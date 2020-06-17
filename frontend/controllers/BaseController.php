<?php
namespace frontend\controllers;

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
