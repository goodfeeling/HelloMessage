<?php

namespace frontend\models;

use backend\models\AdminUser;
use common\utils\ConstStatus;
use Yii;
use yii\helpers\Url;

class LoginForm extends BaseModel
{
    use Send;

    public $code;
    public $encrypted_data;
    public $iv;
    public $_user = false;
    public $open_id;
    public $uname;
    public $password;
    public $verifyCode;
    public $rememberme;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'encrypted_data', 'iv'], 'string'],
            ['verifyCode', 'required','message'=>'请输入验证码！'],
            ['password', 'required','message'=>'请输入密码！'],
            ['uname', 'required','message'=>'请输入用户名！'],
            ['verifyCode', 'captcha','captchaAction'=>'login/captcha'],
            ['rememberme', 'string'],
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
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '数据格式不正确');
        }

        try {
            $config = $this->getWxConfig();
            // 实例接口
            $wechat = new \WeChat\Oauth($config);
            // 获取openid和access_token
            $result = $wechat->getOauthAccessToken();
            if ($result['errcode'] == 40029) {
                return $this->resultMsg(null, $result['errcode'], $result['errmsg']);
            }

            // 检查AccessToken
            $checkToken = $wechat->checkOauthAccessToken($result['access_token'], $result['openid']);

            if (!($checkToken['errcode'] == 0)) {
                // 刷新token
                $result = $wechat->getOauthRefreshToken($result['refresh_token']);
            }
            $this->open_id = $result['openid'];
            // 存数据库
            $userModel = new AdminUser();
            $checkData = $userModel::findOne(['wechat_platform_open_id' => $result['openid']]);
            // 获取用户信息
            $userInfo = $wechat->getUserInfo($result['access_token'], $result['openid'], 'zh_CN');
            if ($userInfo['errcode'] == 40003) {
                return $this->resultMsg(null, $userInfo['errcode'], $userInfo['errmsg']);
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
                    return $this->resultMsg(null, ConstStatus::CODE_ERROR,serialize($userModel->getErrors()));
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
                $duration = \Yii::$app->user->authTimeout;
                \Yii::$app->user->login($this->getUser(), $duration);
            } else {
                return $this->resultMsg(null, ConstStatus::CODE_ERROR,'登录失败请联系管理员');
            }

        } catch (\yii\base\Exception $e) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, $e->getMessage());
        }  catch (\WeChat\Exceptions\InvalidResponseException $e) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, $e->getMessage());
        }
    }

    /**
     * 普通登录
     */
    public function login()
    {
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }
        $checkData = User::findOne(['uname' => $this->uname]);
        $hash = Yii::$app->getSecurity()->generatePasswordHash($this->password);
        if (Yii::$app->getSecurity()->validatePassword($checkData['password'], $hash)) {
            // all good, logging user in
            $duration = $this->rememberme == "on" ? 3600 * 24 * 30 : \Yii::$app->user->authTimeout;
            \Yii::$app->user->login($this->getUser(), $duration);
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_LOGIN_ERROR,'账号或密码错误');
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
            $config = $this->getWxConfig();
            $wechat = new \WeChat\Oauth($config);
            // 执行操作
            $result = $wechat->getOauthRedirect(Url::toRoute('login/index', true), 'now_jump_index', 'snsapi_userinfo');
            return $this->resultMsg($result, ConstStatus::CODE_SUCCESS,'获取成功');
        } catch (\yii\base\Exception $e) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR,$e->getMessage());
        }
    }

    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = \common\models\User::findIdentityByOpenId($this->open_id);
        }
        return $this->_user;
    }

}