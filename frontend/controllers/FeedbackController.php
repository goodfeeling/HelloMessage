<?php

namespace frontend\controllers;

use frontend\models\FeedbackForm;
use Yii;
use yii\base\Controller;

class FeedbackController extends Controller
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isPost){
            $form = new FeedbackForm();
            $form->attributes = $request->post();
            $res = $form->save();
            return $this->asJson($res);
        } else {
            return $this->render('index');
        }
    }
}