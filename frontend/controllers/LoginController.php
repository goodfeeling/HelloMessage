<?php


namespace frontend\controllers;

use frontend\models\LoginForm;
use frontend\models\MailForm;
use frontend\models\RegisterForm;
use frontend\models\ResetPassword;
use frontend\models\User;
use frontend\models\WechatForm;
use Yii;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

/**
 * Class LoginController
 * @package frontend\controllers
 */
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

    /**
     * @return array[]
     */
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
//                'controller'=>'login',        //拥有这个动作的controller
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
        // 微信登录
        if ($request->isGet && $request->get('state') == 'now_jump_index') {
            $form = new WechatForm();
            $form->code = $request->get('code');
            if (!$res = $form->wxLogin()) {
                $this->goHome();
            }
        }
        // 普通登录
        if ($request->isPost) {
            $form = new LoginForm();
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
     * WeachtJumpUrl API
     * @return \yii\web\Response
     */
    public function actionJumpLoginPage()
    {
        return $this->asJson((new WechatForm())->jumpLogin());
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
        $request = Yii::$app->request;
        if ($request->isAjax) {
            $form = new MailForm();
            $form->to = $request->get('to');
            return $this->asJson( $form->send());
        }
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

    /**
     * Edit Password reset
     * @return string
     */
    public function actionPasswordReset()
    {
        $request = Yii::$app->request;
        if($request->isPost) {
            $form = new ResetPassword();
            $form->attributes = $request->post();
            return $this->asJson( $form->save());
        }
        return $this->render('password-reset');
    }
}
