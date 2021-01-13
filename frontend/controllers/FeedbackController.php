<?php

namespace frontend\controllers;

use frontend\models\Feedback;
use Yii;

/**
 * Class FeedbackController
 * @package frontend\controllers
 */
class FeedbackController extends BaseController
{
    /**
     * Display Feedback page
     * @return string|\yii\web\Response
     */
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