<?php
namespace backend\models;

use Yii;

class FeedbackForm extends extends BaseModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content'], 'required'],
            ['integer'],
            [['addtime'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['content'], 'string', 'max' => 500],
            [['type'], 'string', 'max' => 1],
        ];
    }

}
