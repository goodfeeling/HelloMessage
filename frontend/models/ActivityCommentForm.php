<?php

namespace frontend\models;

use backend\models\ActivityCommentModel;
use Yii;

class ActivityCommentForm extends BaseModel
{
    public $content;
    public $aid;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content'], 'required'],
            [['content'], 'string', 'max' => 2000],
            ['content','trim'],
            ['aid', 'number']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'content' => '内容必须是2000个字符',
            'aid' => '活动id',
        ];
    }

    public function save()
    {
        if (!$this->validate()) {
            return [
                'msg' => '数据格式不正确',
                'status' => 1,
                'data' => null
            ];
        }

        $model = new ActivityCommentModel();
        $model->attributes = $this->attributes;
        if ($model->save()) {
        } else {
        }
    }

    public function getData()
    {
        $queryData = ActivityCommentModel::find()
            ->where([
                'aid' => $this->id,
                'status' => 1
            ])
            ->select('content,addtime,uid,aid')
            ->asArray()
            ->all();

        foreach ($queryData as $key => &$value) {
        }
    }
}
