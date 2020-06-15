<?php


namespace frontend\controllers;

use Yii;
use yii\web\IdentityInterface;
use yii\web\Cookie;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\AdminUser;
use common\utils\CommonFun;

class LoginController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionLogin()
    {
    }

    public function actionIndex()
    {
        if (\Yii::$app->request->isPost) {
            $username = Yii::$app->request->post('username');
            $password = Yii::$app->request->post('password');
            $captcha = Yii::$app->request->post('captcha');
            
            $valid = $this->createAction('captcha')->validate($captcha, false);
            $key = 'try_login_' . $username;
            $checkinfo = Yii::$app->cache->get($key);
            $valid = true;
            if (empty($checkinfo) == false) {
                $valid = $this->createAction('captcha')->validate($captcha, false);
            }

            $rememberMe = Yii::$app->request->post('remember');
            $rememberMe = $rememberMe == 'y' ? true : false;
            if ($valid === false) {
                return $this->asJson(['errno' => 1, 'msg' => '验证码不正确']);
            } else {
                try {
                    $login = AdminUser::login($username, $password, $rememberMe);
                    if ($login == true) {
                        AdminUser::updateAll(
                            ['last_ip' => CommonFun::getClientIp()],
                            ['uname' => $username]
                        );
                        return $this->asJson(['errno' => 0, 'msg' => $captcha, 'valid' => $valid]);
                    } else {
                        Yii::$app->cache->set('try_login_' . $username, true, 60);
                        return $this->asJson(['errno' => 2, 'msg' => '用户名或密码不正确']);
                    }
                } catch (\Exception $e) {
                    return $this->asJson(['errno' => 2, 'msg' => "网络或数据库错误！"]);
                }
            }
        } else {
            return $this->render('index');
        }
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
