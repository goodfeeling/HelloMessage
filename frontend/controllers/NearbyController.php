<?php
namespace frontend\controllers;

use yii\filters\AccessControl;

class NearbyController extends BaseController
{

    /**
     * @return array[]
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->redirect(['login/index']);
                }
            ]
        ];
    }
    /**
     * Display Search lists
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}