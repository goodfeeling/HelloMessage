<?php


namespace frontend\controllers;


class CartController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}