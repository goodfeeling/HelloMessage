<?php


namespace frontend\models;


use backend\models\AdminUser;
use common\utils\ConstStatus;
use yii\helpers\Url;

class User extends \yii\db\ActiveRecord
{
    use Send;

}