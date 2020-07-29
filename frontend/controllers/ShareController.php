<?php


namespace frontend\controllers;


use frontend\models\Share;
use yii\filters\AccessControl;

class ShareController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['apply', 'verify-user', 'user-pay', 'likes-increase'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                        'verbs' => ['POST']
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->asJson([
                        'msg' => '您需要登陆!',
                        'state' => 100,
                        'data' => null,
                    ]);
                }
            ],
        ];
    }

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