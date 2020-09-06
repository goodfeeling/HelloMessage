<?php


namespace frontend\models;

use common\utils\ConstStatus;
use Yii;
use yii\helpers\Url;

class MailForm extends BaseModel
{
    use Send;

    public $to;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['to','required','message'=>'邮箱或账号不能为空！'],
            ['to', 'email','message'=>'检测邮箱是否正确！'],
            // 定义为匿名函数的行内验证器
            ['to', function ($attribute, $params) {
                $checkData = User::findOne(['email' => $this->to]);
                if (!empty($checkData)) {
                    $this->addError($attribute, '不存在该邮箱地址！');
                }
            }],
        ];
    }

    public function send(){
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }
        try {
            $url = Url::base();
            $res = Yii::$app->mailer->compose()
                ->setTo($this->to)
                ->setSubject('重置密码')
                ->setTextBody('Plain text content')
                ->setHtmlBody('<a href="'.$url.'">点击重置密码</a>')
                ->send();
        } catch (\Exception $e) {
            return $this->resultMsg(null, ConstStatus::CODE_MAIL_SEND_SUCCESS,$e->getMessage());
        }

        if(!empty($res)) {
            return $this->resultMsg(null, ConstStatus::CODE_MAIL_SEND_SUCCESS,'发送成功');
        } else{
            return $this->resultMsg(null, ConstStatus::CODE_MAIL_SEND_SUCCESS,'发送失败');
        }
    }

}