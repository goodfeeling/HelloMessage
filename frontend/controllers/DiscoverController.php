<?php


namespace frontend\controllers;


use frontend\models\Feedback;

class DiscoverController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}