<?php
namespace frontend\controllers;

use backend\models\ActivityModel;
use Yii;
use common\models\LoginForm;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * Site controller
 */
class SiteController extends BaseController
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
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $query = ActivityModel::find();
        $model = $query
            ->orderBy("addtime DESC")
            ->limit(1)
            ->all();
        return $this->render('index',[
            'model'=>$model[0]
        ]);
    }

    /**
     * Displays apply.
     *
     * @return mixed
     */
    public function actionApply()
    {
        return $this->render('apply');
    }

    /**
     * Displays my.
     *
     * @return mixed
     */
    public function actionMy()
    {
        return $this->render('my');
    }


    /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionDiscover()
    {
        return $this->render('discover');
    }


    /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionMyPhone()
    {
        return $this->render('my-phone');
    }


    /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionMyDetail()
    {
        return $this->render('my-detail');
    }


    /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionMyActivity()
    {
        return $this->render('my-activity');
    }

        /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionHelpCenter()
    {
        return $this->render('help-center');
    }

        /**
     * Displays discover.
     *
     * @return mixed
     */
    public function actionMySetting()
    {
        return $this->render('my-setting');
    }
}
