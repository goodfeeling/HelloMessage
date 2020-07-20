<?php


namespace frontend\controllers;


use frontend\models\AdminUserDetail;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class UserInfoController extends BaseController
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout','index'],
                'rules' => [
                    // 所有用户都能访问
                     [
                         'actions' => ['logout'],
                         'allow' => true,
                         'roles' => ['?'],
                     ],
                    // 认证用户才能访问index
                    [
                        'actions' => ['index'],
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
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    // 'logout' => ['post'],
                    'index' => ['get'],
                ],
            ],

        ];
    }

    public function actionIndex()
    {
        $request = \Yii::$app->request;
        $form = new AdminUserDetail();
        $form->uid = Yii::$app->user->id;
        if($request->isPost) {
            $form->attributes = $request->post();
            $res = $form->simpleSaveData();
            return $this->asJson($res);
        }else {
            $res = $form->getUserData();
            return $this->render('index',[
                'data'=>$res
            ]);
        }
    }

}