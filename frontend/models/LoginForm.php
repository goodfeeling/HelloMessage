<?php

namespace frontend\models;

use backend\models\AdminUser;
use common\utils\ConstStatus;
use Yii;
use yii\helpers\Url;

class LoginForm extends BaseModel
{
    use Send;

    public $_user = false;
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
            ['verifyCode', 'required','message'=>'请输入验证码！'],
            [['uname','password'], 'required','message'=>'请输入完整的用户名或密码！'],
            ['verifyCode', 'captcha','captchaAction'=>'login/captcha','message'=>'验证码错误！'],
            ['rememberme','string'],
        ];
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
        if (!empty($checkData) && Yii::$app->getSecurity()->validatePassword($this->password, $checkData['password'])) {
            // all good, logging user in
            $duration = $this->rememberme == "on" ? 3600 * 24 * 30 : \Yii::$app->user->authTimeout;
            if ($user_instance = \common\models\User::findIdentity($checkData['id'])) {
                \Yii::$app->user->login(\common\models\User::findIdentity($checkData['id']), $duration);
            } else {
                return $this->resultMsg(null, ConstStatus::CODE_LOGIN_ERROR,'用户未审核');
            }
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_LOGIN_ERROR,'账号或密码错误');
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