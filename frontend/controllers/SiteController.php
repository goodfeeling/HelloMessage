<?php
namespace frontend\controllers;

use backend\models\AdminUser;
use common\models\User;
use Yii;
use frontend\models\ActivityForm;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

/**
 * Site controller
 */
class SiteController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout','index'],
                'rules' => [
                    // [
                    //     'actions' => ['logout'],
                    //     'allow' => true,
                    //     'roles' => ['@'],
                    // ],
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
                    // 'logout' => ['post'],
                    'index' => ['get'],
                ],
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
        $form = new ActivityForm();
        $res = $form->getActivityData();
        var_dump(AdminUser::findOne(['id'=>Yii::$app->user->id]));exit;
        return $this->render('index',[
           'model'=>$res['model'],
           'recomment'=>$res['recomment'],
            'userInfo'=> AdminUser::findOne(['id'=>Yii::$app->user->id])
        ]);
    }

    /**
     * Displays guidance.
     *
     * @return mixed
     */
    public function actionGuidance()
    {
        return $this->render('guidance');
    }

    /**
     * Displays setting.
     *
     * @return mixed
     */
    public function actionSetting()
    {
        return $this->render('setting');
    }

    /**
     * Displays error.
     *
     * @return mixed
     */
    public function actionError()
    {
        return $this->render('error');
    }
}
