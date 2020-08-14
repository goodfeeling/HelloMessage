<?php


namespace frontend\controllers;

use yii\filters\AccessControl;

class SearchController extends BaseController
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

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionLists()
    {
        return $this->render('lists');
    }

}