<?php

namespace frontend\models;

use backend\models\AdminUser;
use common\models\User;
use Yii;
use yii\helpers\Url;
use yii\web\Cookie;

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
                'state' => 1,
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
                    'state' => $result['errcode'],
                    'data' => null
                ];
            }

            // 检查AccessToken
            $checkToken = $wechat->checkOauthAccessToken($result['access_token'], $result['openid']);

            if (!($checkToken['errcode'] == 0)) {
                // 刷新token
                $result = $wechat->getOauthRefreshToken($result['refresh_token']);
            }

            // 存数据库
            $userModel = new User();
            $checkData = $userModel::findOne(['wechat_platform_open_id' => $result['openid']]);
            // 获取用户信息
            $userInfo = $wechat->getUserInfo($result['access_token'], $result['openid'], 'zh_CN');
            if ($userInfo['errcode'] == 40003) {
                return [
                    'msg' => $userInfo['errmsg'],
                    'state' => $userInfo['errcode'],
                    'data' => null
                ];
            }

            if (empty($checkData)) {
                $userModel->uname = $result['openid'];
                $userModel->password = \Yii::$app->security->generatePasswordHash(\Yii::$app->security->generateRandomString(), 5);;
                $userModel->last_ip = \Yii::$app->request->userIP;
                $userModel->status = 10;
                $userModel->create_user = 'front';
                $userModel->create_date = date('yy-m-d H:i:s');
                $userModel->update_user = 'front';
                $userModel->update_date = date('yy-m-d H:i:s');
                $userModel->type = 2;
                $userModel->access_token = $result['access_token'];
                $userModel->wechat_platform_open_id = $result['openid'];
                $userModel->nickname = $userInfo['nickname'];
                $userModel->avatar_url = $userInfo['headimgurl'];
                $userModel->bind_phone = $userInfo['bind_phone'];
                $userModel->city = $userInfo['city'];
                $res = $userModel->save();
                if (!$userModel->validate()) {
                    return [
                        'msg' => serialize($userModel->getErrors()),
                        'state' => 1,
                        'data' => null
                    ];
                }
            } else {
                $checkData->access_token = $result['access_token'];
                $checkData->wechat_platform_open_id = $result['openid'];
                $checkData->nickname = $userInfo['nickname'];
                $checkData->avatar_url = $userInfo['headimgurl'];
                $checkData->city = $userInfo['city'];
                $res = $checkData->save();
            }

            if ($res) {
                $duration = \Yii::$app->user->authtimeout;
                \Yii::$app->user->login($checkData, $duration);
            } else {
                return [
                    'msg' => '登录失败请联系管理员',
                    'state' => 1,
                    'data' => null
                ];
            }

        } catch (\yii\base\Exception $e) {
            return [
                'msg' => $e->getMessage(),
                'state' => 1,
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
            $result = $wechat->getOauthRedirect(Url::toRoute('login/index', true), 'now_jump_index', 'snsapi_userinfo');
            return [
                'msg' => '获取成功',
                'status' => 0,
                'data' => $result
            ];
        } catch (\yii\base\Exception $e) {
            return [
                'msg' => '$e->getMessage()',
                'status' => 1,
                'data' => null
            ];
        }
    }
}