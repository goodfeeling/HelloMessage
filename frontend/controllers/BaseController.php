<?php

/**
 * Created by IntelliJ IDEA.
 * User: yzw
 * Date: 2020/6/18
 * Time: 1:05
 */

namespace frontend\controllers;

use backend\models\AdminUser;
use yii\web\Controller;

class BaseController extends Controller
{
    public $user_info;
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        if (\Yii::$app->user->identity && empty($user_info)) {
            $this->user_info = AdminUser::find()->where(['id'=> \Yii::$app->user->id])->one();
        }
        return true;
    }
}
