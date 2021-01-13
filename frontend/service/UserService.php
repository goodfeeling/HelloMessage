<?php
namespace frontend\service;

use yii\web\View;

class UserService extends View
{
    public function generaterUrl($avatar_url)
    {
        $identity = \Yii::$app->user->identity;
        if (!empty($identity)) {
            if ( strpos($avatar_url,'http') === false ) {
                $avatar_url = \Yii::getAlias('@back').$avatar_url;
            }
        } else {
            $avatar_url = 'images/未登录头象.png';
        }
        return $avatar_url;
    }
}