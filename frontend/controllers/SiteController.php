<?php
namespace frontend\controllers;

use backend\models\ActivityModel;
use Yii;
use frontend\behaviors\LoginBehavior;
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
//            'login' => [
//                'class' => LoginBehavior::className(),
//            ],
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
     * Displays post.
     *
     * @return mixed
     */
    public function actionPost()
    {
        return $this->render('post');
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
