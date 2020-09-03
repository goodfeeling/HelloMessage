<?php


namespace frontend\controllers;

use yii\filters\AccessControl;

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
                'only' => ['index1'],
                'rules' => [
                    [
                        'allow' => true,
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

    /**
     * Display Discover page
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Display uploader page
     * @return string
     */
    public function actionUploader()
    {
        return $this->render('uploader');
    }
}