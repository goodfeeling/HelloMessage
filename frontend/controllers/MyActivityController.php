<?php


namespace frontend\controllers;

use Yii;
use frontend\models\ActivityForm;
use yii\filters\AccessControl;

class MyActivityController extends BaseController
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
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->redirect(['login/index']);
                }
            ],

        ];
    }

    /**
     * Displays my class.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $form = new ActivityForm();
        $form->uid = Yii::$app->user->id;
        if ($request->isPost) {

        } else {
            $res = $form->getStateData();
            return $this->render('index', [
                'data' => $res
            ]);
        }
    }
}