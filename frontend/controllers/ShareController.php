<?php


namespace frontend\controllers;


use frontend\models\Share;

class ShareController extends BaseController
{
    public function actionGetConfig()
    {
        $request = \Yii::$app->request;
        if ($request->isGet) {
            $form = new Share();
            $form->url = $request->get('url');
            $res = $form->getConfig();
            return $this->asJson($res);
        }
    }
}