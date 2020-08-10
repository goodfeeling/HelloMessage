<?php


namespace frontend\controllers;

use backend\models\AdminUser;
use frontend\models\LoginForm;
use frontend\models\RegisterForm;
use frontend\models\User;
use Yii;
use yii\filters\AccessControl;

class LoginController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index','register'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                   
                }
            ]
        ];
    }

    public function actions()
    {
        return [
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
                'backColor'=>0x000000,//背景颜色
                'maxLength' => 6, //最大显示个数
                'minLength' => 5,//最少显示个数
                'padding' => 5,//间距
                'height'=>40,//高度
                'width' => 100,  //宽度
                'foreColor'=>0xffffff,     //字体颜色
                'offset'=>4,        //设置字符偏移量 有效果
                //'controller'=>'login',        //拥有这个动作的controller
            ],
        ];
    }
    
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $form = new LoginForm();

        // 微信登录
        if ($request->isGet && $request->get('state') == 'now_jump_index') {
            $form->code = $request->get('code');
            $res = $form->wxLogin();
            if (!$res) {
                $this->goHome();
            }
        }
        // 普通登录
        if ($request->isPost) {
            $form->attributes = $request->post()["User"];
            $res = $form->login();
            if (!$res) {
                return $this->goBack();
            } else {
                return $this->asJson($res);
            }
        }
        return $this->render('index',['model'=> new User()]);
    }

    public function actionJumpLoginPage()
    {
        return $this->asJson((new User())->jumpLogin());
    }

    public function actionRegister()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new RegisterForm();
            $form->attributes = $request->post();
            $res = $form->save();
            return $this->asJson($res);
        }
        return $this->render('register');
    }

    public function actionForgotPassword()
    {
        return $this->render('forgot-password');
    }
}
