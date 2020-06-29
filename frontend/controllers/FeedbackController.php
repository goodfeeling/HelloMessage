<?php

namespace frontend\controllers;

use frontend\models\AdminFeedback;
use Yii;
use yii\web\Controller;

class FeedbackController extends Controller
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isPost){
            $form = new AdminFeedback();
            $form->attributes = $request->post();
            $res = $form->saveData();
            return $this->asJson($res);
        } else {
            return $this->render('index');
        }
    }
}