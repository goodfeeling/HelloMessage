<?php
namespace frontend\models;

use backend\models\FeedbackModel;
use Yii;

class FeedbackForm extends BaseModel
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
            [['title', 'content','email'], 'required'],
            [['title'], 'string', 'max' => 100],
            [['content'], 'string', 'max' => 500],
            ['email', 'email'],
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

    public function save()
    {
        if ($this->validate()){
            return [
                'msg'=>'提交数据有误',
                'state'=>1,
                'data'=>null
            ];
        }

        $model = new FeedbackModel();
        $model->attributes = $this->attributes;
        $model->addtime = date('yyyy-mm-dd h:i:s');
        $model->type = 1;
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
