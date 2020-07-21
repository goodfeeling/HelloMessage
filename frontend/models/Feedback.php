<?php
namespace frontend\models;

use backend\models\FeedbackModel;
use common\utils\ConstStatus;
use Yii;

class Feedback extends BaseModel
{
    public $title;
    public $content;
    public $email;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content','email'], 'required', 'message' => '请输入完整的内容！'],
            [['title'], 'string', 'max' => 100, 'message' => '标题最大为100个字符！'],
            [['content'], 'string', 'max' => 500, 'message' => '内容最大为500个字符！'],
            ['email', 'email', 'message' => '请输入正确的邮箱！'],
        ];
    }

    public function saveData()
    {
        if ( !$this->validate() ){
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }

        $model = new FeedbackModel();
        $model->title = $this->title;
        $model->content = $this->content;
        $model->email = $this->email;
        $model->addtime =  date('Y-m-d H:i:s');
        $model->type = '1';

        if ($model->save()) {
            return $this->resultMsg(null, ConstStatus::CODE_SUCCESS, "提交成功");
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '提交失败');
        }
    }
}
