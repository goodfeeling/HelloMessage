<?php


namespace frontend\controllers;

use backend\models\AdminUser;
use frontend\models\LoginForm;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use frontend\models\ActivityForm;

class LoginController extends BaseController
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'denyCallback' => function($rule, $action){
                    var_dump("你没有权限访问这个网页");exit;
                },
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'index' => ['get'],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isGet && $request->get('state') == 'now_jump_index') {
            $form = new LoginForm();
            $form->code = $request->get('code');
            try {
                $res = $form->wxLogin();
            } catch (\WeChat\Exceptions\InvalidResponseException $e) {
                $res['state'] = 1001;
            }
             if (!$res['state'] || $res['state'] == 1001) {
                $form = new ActivityForm();
                $res = $form->getActivityData();
                return $this->render('@app/views/site/index', [
                    'model' => $res['model'],
                    'recomment' => $res['recomment']
                ]);
            }
        } 
        return $this->render('index');
    }

    public function actionJumpLoginPage()
    {
        $login_model = new LoginForm();
        $res = $login_model->jumpLogin();
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $res;
    }

    public function actionRegister()
    {
        return $this->render('register');
    }

    public function actionForgotPassword()
    {
        return $this->render('forgot-password');
    }
}
