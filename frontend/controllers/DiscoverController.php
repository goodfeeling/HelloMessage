<?php


namespace frontend\controllers;


use frontend\models\AdminFeedback;

class DiscoverController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}