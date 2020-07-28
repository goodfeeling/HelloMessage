<?php

namespace frontend\controllers;

use frontend\models\Feedback;
use Yii;
use yii\web\Controller;

class FeedbackController extends BaseController
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isPost){
            $form = new Feedback();
            $form->attributes = $request->post();
            $res = $form->saveData();
            return $this->asJson($res);
        } else {
            return $this->render('index');
        }
    }
}