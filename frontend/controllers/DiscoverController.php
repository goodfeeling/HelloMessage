<?php


namespace frontend\controllers;

use Yii;
use frontend\models\Feedback;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class DiscoverController extends BaseController
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
                        'roles' => ['@'],
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

    public function actionIndex()
    {
        return $this->render('index');
    }
}