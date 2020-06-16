<?php


namespace frontend\controllers;


use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class ActivityController extends BaseController
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

    /**
     * Displays 活动申请.
     *
     * @return mixed
     */
    public function actionApply()
    {
        return $this->render('apply');
    }

    /**
     * Displays 活动详情.
     *
     * @return mixed
     */
    public function actionPost()
    {
        return $this->render('post');
    }
    
    /**
     * Displays 活动分类.
     *
     * @return mixed
     */
    public function actionCategory()
    {
        return $this->render('category');
    }

    /**
     * Displays 活动分类.
     *
     * @return mixed
     */
    public function actionMyCategory()
    {
        return $this->render('my-category');
    }

    /**
     * Displays 支付报名费.
     *
     * @return mixed
     */
    public function actionUsePay()
    {
        return $this->render('use-pay');
    }


}