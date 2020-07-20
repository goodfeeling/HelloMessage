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
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        return true;
    }
}
