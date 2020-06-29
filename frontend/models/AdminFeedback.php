<?php
namespace frontend\models;

use backend\models\FeedbackModel;
use Yii;

class AdminFeedback extends BaseModel
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

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '标题小于一百个字符',
            'content' => '内容小于五百个字符',
            'addtime' => '提交时间',
            'type' => '反馈类型',
            'email' => '邮箱地址',
        ];
    }

    public function saveData()
    {
        if ( !$this->validate() ){
            return [
                'msg'=>current($this->getErrors())[0],
                'state'=>1,
                'data'=>null
            ];
        }
        $model = new FeedbackModel();
        $model->title = $this->title;
        $model->content = $this->content;
        $model->email = $this->email;
        $model->addtime =  date('Y-m-d H:i:s');
        $model->type = '1';

        if ($model->save()) {
            return  [
                'msg'=>'提交成功',
                'state'=>0,
                'data'=>null
            ];
        } else {
            return  [
                'msg'=>'提交失败',
                'state'=>1,
                'data'=>null
            ];
        }
    }
}
