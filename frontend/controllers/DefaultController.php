<?php
namespace frontend\controllers;

use Yii;
use yii\web\Response;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class DefaultController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    [
                        'allow' => false,
                        'roles' => ['?'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->asJson([
                        'msg' => '您需要登陆!',
                        'state' => 100,
                        'data' => null,
                    ]);
                }
            ]
        ];
    }

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

    // 图片上传接口
    public function actionUploadImage()
    {
        
    }
}