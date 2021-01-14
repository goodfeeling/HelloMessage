<?php
namespace frontend\controllers;

use yii\filters\AccessControl;

class NearbyController extends BaseController
{
    /**
     * Display Search lists
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}