<?php


namespace micro\modules\v1\models;

use yii\db\ActiveRecord;

class Car extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%car}}';
    }
}