<?php

namespace micro\models;

use \yii\helpers\Url;
use yii\db\ActiveRecord;
use yii\web\Link;

class Post extends ActiveRecord
{
    public static function tableName()
    {
        return '{{post}}';
    }

    // 明确列出每个字段，适用于你希望数据表或
    // 模型属性修改时不导致你的字段修改（保持后端API兼容性）
    public function fields()
    {
        return [
            // 字段名和属性名相同
            'id'
        ];
    }

    public function extraFields()
    {
        return ['profile'];
    }

    public function getLinks()
    {
        return [
            Link::REL_SELF => Url::to(['user/view', 'id' => $this->id], true),
            'edit' => Url::to(['user/view', 'id' => $this->id], true),
            'profile' => Url::to(['user/profile/view', 'id' => $this->id], true),
            'index' => Url::to(['users'], true),
        ];
    }
}