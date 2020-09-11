<?php


namespace frontend\models;


use common\helpers\RedisString;
use common\utils\ConstStatus;

class ResetPassword extends BaseModel
{
    use Send;

    public $password;
    public $repassword;
    public $verify_str;

    public function rules()
    {
        return [
            [['password', 'repassword', 'verify_str'], 'required', 'message' => '请填写完整信息！'],

            ['repassword',function ($attribute, $params) {
                if ($this->repassword != $this->password) {
                    $this->addError($attribute, '两次密码不一样，请重新输入！');
                }
            }],
            ['verify_str',function ($attribute, $params) {
                $email = RedisString::get($this->verify_str);
                if (empty($email)) {
                    $this->addError($attribute, '不存在该条目！');
                }
            }],
            'password' => [['password'], 'string', 'max' => 20, 'message' => '密码只能是最大16字符'],
        ];
    }

    public function save()
    {
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }
        $email = RedisString::get($this->verify_str);
        $model = User::findOne(['email'=>$email]);
        if(!empty($model)) {
            $model->password = \Yii::$app->security->generatePasswordHash($this->password);
            RedisString::del($this->verify_str);
            if($model->save()) {
                return $this->resultMsg(null,ConstStatus::CODE_SUCCESS,'重置成功');
            }
        }
        return $this->resultMsg(null,ConstStatus::CODE_ERROR,'重置失败');
    }
}