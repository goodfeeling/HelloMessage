<?php
namespace frontend\controllers;

use yii\web\Response;
use yii\filters\AccessControl;

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

    /**
     * wechat pay api
     */
    public function actionPay()
    {

    }

    /**
     * get QR code api
     * @return mixed
     * @throws \yii\base\InvalidConfigException
     */
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