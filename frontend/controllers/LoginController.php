<?php


namespace frontend\controllers;

use Yii;
use yii\web\IdentityInterface;
use yii\web\Cookie;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\AdminUser;
use common\utils\CommonFun;
use yii\base\Controller;

class LoginController extends Controller
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            
        } else {
            return $this->render('index');
        }
    }

    public function actionJumpLoginPage()
    {
        
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
