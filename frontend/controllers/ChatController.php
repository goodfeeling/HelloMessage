<?php


namespace frontend\controllers;


class ChatController extends BaseController
{
    public function acitonIndex()
    {
        return $this->render('index');
    }

    public function actionMyChat()
    {
        return $this->render('my-chat');
    }

}