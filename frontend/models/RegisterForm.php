<?php


namespace frontend\models;

use Yii;
use common\utils\ConstStatus;

class RegisterForm extends BaseModel
{
    use Send;

    public $email;
    public $username;
    public $password;
    public $verifyPassword;
    public $imageFile;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // name，email，subject 和 body 特性是 `require`（必填）的
            [['username', 'email', 'password', 'verifyPassword'], 'required', 'message' => '请输入填完所需的参数！'],
            [['username', 'email', 'imageFile'], 'trim'],
            [['imageFile'], 'string',],
            ['imageFile', 'default', 'value' => '/images/temp_avatar.jpg'],
            // 定义为匿名函数的行内验证器
            ['username', function ($attribute, $params) {
                $checkData = User::findOne(['uname' => $this->username]);
                if ($checkData) {
                    $this->addError($attribute, '用户名已存在啦！');
                }
            }],
            // email 特性必须是一个有效的 email 地址
            ['email', 'email'],
            'password' => [['password'], 'string', 'max' => 16, 'message' => '密码只能是最大16字符'],
            // 定义为匿名函数的行内验证器
            ['verifyPassword', function ($attribute, $params) {
                $checkData = User::findOne(['uname' => $this->username]);
                if ($checkData) {
                    $hash = Yii::$app->getSecurity()->generatePasswordHash($this->password);
                    if (!Yii::$app->getSecurity()->validatePassword($checkData['password'], $hash)) {
                        $this->addError($attribute, '密码或用户名不正确！');
                    }
                }
            }],
        ];
    }

    public function save()
    {
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }

        $model = new User();
        $model->uname = $this->username;
        $model->password = \Yii::$app->security->generatePasswordHash($this->password);
        $model->status = 0;
        $model->create_user = 'front';
        $model->create_date = date('Y-m-d');
        $model->update_user = 'front';
        $model->update_date = date('Y-m-d');
        $model->avatar_url = $this->imageFile;
        $model->type = 2;

        if (!$model->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($model->getErrors())[0]);
        }
        if ($model->save()) {
            return $this->resultMsg(null, ConstStatus::CODE_REGISTER_SUCCESS, '注册成功');
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_REGISTER_ERROR, '注册失败');
        }
    }
}