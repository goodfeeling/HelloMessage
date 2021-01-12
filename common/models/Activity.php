<?php
namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%activity}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $addtime
 * @property string $endtime
 * @property string $money
 * @property string $describe
 * @property string $theme
 * @property integer $join_number
 * @property integer $status
 * @property string $keyword
 * @property integer $author_id
 * @property integer $pic_url_id
 * @property integer $views
 * @property integer $sort
 */
class Activity extends \backend\models\BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%activity}}';
    }

}
