<?php
namespace frontend\models;

use backend\models\AdminUser;
use Yii;
use yii\helpers\Url;

class LoginForm extends BaseModel
{
    public $code;
    public $encrypted_data;
    public $iv;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'encrypted_data', 'iv'], 'string']
        ];
    }

    /**
     * 微信公众号登录
     * 
     * @inheritdoc
     */
    public function wxLogin()
    {
        if (!$this->validate()) {
            return [
                'msg' => '数据格式不正确',
                'status' => 1,
                'data' => null
            ];
        }

        try {
            $config = $this->getWxConfig('simple');
            // 实例接口
            $wechat = new \WeChat\Oauth($config);
            // 获取openid和access_token
            $result = $wechat->getOauthAccessToken();
            if ($result['errcode'] == 40029) {
                return [
                    'msg' => $result['errmsg'],
                    'status' => $result['errcode'],
                    'data' => null
                ];
            }
            // 检查AccessToken
            $checkToken = $wechat->checkOauthAccessToken($result['access_token'], $result['openid']);
            if( !($checkToken['errcode'] == 0) ) {
                // 刷新token
                $result = $wechat->getOauthRefreshToken($result['refresh_token']);
            } else {
                return [
                    'msg' => $checkToken['errmsg'],
                    'status' => $checkToken['errcode'],
                    'data' => null
                ];
            }
            // 存数据库
            $userModel = new AdminUser();
            $checkData = $userModel::findOne(['wechat_platform_open_id'=>$result['openid']]);
            // 获取用户信息
            $userInfo = $wechat->getUserInfo($result['access_token'], $result['openid'], 'zh_CN');
            if ($userInfo['errcode'] == 40003) {
                return [
                    'msg' => $userInfo['errmsg'],
                    'status' => $userInfo['errcode'],
                    'data' => null
                ];
            }
            if (empty($checkData)) {
                $userModel->uname = $result['openid'];
                $userModel->password = \Yii::$app->security->generatePasswordHash(\Yii::$app->security->generateRandomString(), 5);;
                $userModel->last_ip = \Yii::$app->request->userIP;
                $userModel->status = 10;
                $userModel->create_user = 'front';
                $userModel->create_date = date('y-m-d h:i:s');
                $userModel->update_user = 'front';
                $userModel->update_date = date('y-m-d h:i:s');
                $userModel->type = 2;
                $userModel->access_token = $result['access_token'];
                $userModel->wechat_platform_open_id = $result['openid'];
                $userModel->nickname = $userInfo['nickname'];
                $userModel->avatar_url = $userInfo['avatar_url'];
                $userModel->bind_phone = $userInfo['bind_phone'];
            } else {
                $userModel->wechat_platform_open_id = $result['openid'];
                $userModel->nickname = $userInfo['nickname'];
                $userModel->avatar_url = $userInfo['avatar_url'];
            }
            $userModel->save();
            $session = Yii::$app->session;
            // 存入Sessions
            $session->set('accessToken',$result['access_token']);
            // 设置cookie
            $cookies = Yii::$app->response->cookies;
            // 在要发送的响应中添加一个新的 cookie
            $cookies->add(new \yii\web\Cookie([
                'accessToken' => $result['access_token']
            ]));
            return [
                'msg'=>'登录成功',
                'statue'=>0,
                'data'=>null
            ];
        } catch (\yii\base\Exception $e){
            return  [
                'msg' => '$e->getMessage()',
                'status' => 1,
                'data' => null
            ];
        }
    }

    /**
     * 跳到登录
     * 
     * @inheritdoc
     */
    public function jumpLogin()
    {
        try {
            $config = $this->getWxConfig('simple');
            $wechat = new \WeChat\Oauth($config);
            // 执行操作
            $result = $wechat->getOauthRedirect(Url::toRoute('login/index', true), 'now_jump_index');
            return [
                'msg' => '获取成功',
                'status' => 0,
                'data' => $result
            ];
        } catch (\yii\base\Exception $e){
           return  [
               'msg' => '$e->getMessage()',
               'status' => 1,
               'data' => null
           ];
        }
    }
}