<?php


namespace frontend\controllers;


use yii\web\Response;
class DefaultController extends BaseController
{
    // 微信支付接口
    public function actionPay()
    {

    }

    // 获取二维码接口
    public function actionGetQr()
    {
        if (\Yii::$app->request->isGet) {
            $qr = \Yii::$app->get('qr');
            \Yii::$app->response->format = Response::FORMAT_RAW;
            \Yii::$app->response->headers->add('Content-Type', $qr->getContentType());
            
            return $qr
                ->setText('https://2amigos.us')
                ->setLabel('2amigos consulting group llc')
                ->writeString();
        }
    }
}