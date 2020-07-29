<?php


namespace frontend\controllers;

use frontend\models\LoginForm;
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
                'only' => ['index'],
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
    
    public function actionIndex()
    {
        $request = Yii::$app->request;
        if ($request->isGet && $request->get('state') == 'now_jump_index') {
            $form = new LoginForm();
            $form->code = $request->get('code');
            $res = $form->wxLogin();
            if (!$res['state']) {
                $this->goHome();
            }
        } 
        return $this->render('index');
    }

    public function actionJumpLoginPage()
    {
        return $this->asJson((new LoginForm())->jumpLogin());
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
