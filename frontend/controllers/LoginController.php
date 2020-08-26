<?php


namespace frontend\controllers;

use backend\models\AdminUser;
use frontend\models\LoginForm;
use frontend\models\RegisterForm;
use frontend\models\User;
use Yii;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

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
                    [
                        'allow'=>false,
                        'roles'=>['@']
                    ]
                ],
                'denyCallback' => function ($rule, $action) {
                   $this->goHome();
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

    /**
     * Display Login Page
     * @return string|\yii\web\Response
     */
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $form = new LoginForm();

        // 微信登录
        if ($request->isGet && $request->get('state') == 'now_jump_index') {
            $form->code = $request->get('code');
            if (!$res = $form->wxLogin()) {
                $this->goHome();
            }
        }
        // 普通登录
        if ($request->isPost) {
            $form->attributes = $request->post()["User"];
            if (!$res = $form->login()) {
                return $this->goBack();
            } else {
                return $this->asJson($res);
            }
        }
        return $this->render('index',['model'=> new User()]);
    }

    /**
     * Weacht Jump API
     * @return \yii\web\Response
     */
    public function actionJumpLoginPage()
    {
        return $this->asJson((new User())->jumpLogin());
    }

    /**
     * User Register API
     * @return string|\yii\web\Response
     */
    public function actionRegister()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $upload_model = new \common\models\UploadForm();
            $upload_model->imageFile = UploadedFile::getInstanceByName('imageFile');
            if ($imageFile = $upload_model->upload()) {
                $form = new RegisterForm();
                $form->attributes = $request->post();
                $form->imageFile = $imageFile;
                // 文件上传成功
                return $this->asJson($form->save());
            }else{
                $msg = array('errno'=>2, 'data'=>$upload_model->getErrors());
                return $this->asJson($msg);
            }

        }
        return $this->render('register');
    }

    /**
     * Edit Password
     * @return string
     */
    public function actionForgotPassword()
    {
        return $this->render('forgot-password');
    }

    /**
     * User Logout
     * @return \yii\web\Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->goHome();
    }
}
