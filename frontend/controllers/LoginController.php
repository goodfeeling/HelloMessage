<?php


namespace frontend\controllers;

use frontend\models\LoginForm;
use Yii;
use yii\base\Controller;

class LoginController extends Controller
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ( $request->isGet && $request->get('state') == 'now_jump_index' ) {
            $form = new LoginForm();
            $form->code = $request->get('code');
            if ($form->wxLogin()){
                return $this->render('site/index');
            } else {
                return $this->render('index');
            }
        }
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
