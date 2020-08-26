<?php


namespace frontend\controllers;

use Yii;
use frontend\models\UserDetail;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class UserInfoController extends BaseController
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    // 认证用户才能访问index
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    if (Yii::$app->request->isPost) {
                        return $this->asJson([
                            'msg' => '您需要登陆!',
                            'state' => 100,
                            'data' => null,
                        ]);
                    }
                    return $this->render('login/index');
                }
            ]

        ];
    }

    /**
     * Display user detail
     * @return string|\yii\web\Response
     */
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $form = new UserDetail();
        $form->uid = Yii::$app->user->id;
        if ($request->isPost) {
            $form->attributes = $request->post();
            $res = $form->simpleSaveData();
            return $this->asJson($res);
        } else {
            $res = $form->getUserData();
            return $this->render('index', [
                'data' => $res
            ]);
        }
    }
}