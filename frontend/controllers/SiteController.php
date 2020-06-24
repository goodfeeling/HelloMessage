<?php
namespace frontend\controllers;

use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;
use common\models\User;
use Yii;
use frontend\behaviors\LoginBehavior;
use frontend\models\ActivityForm;
/**
 * Site controller
 */
class SiteController extends BaseController
{
    public function behaviors()
    {
        return [
            'login' => [
                'class'=> LoginBehavior::className()
            ]
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
        return $this->render('index',[
           'model'=>$res['model'],
           'recomment'=>$res['recomment'],
            'userInfo'=>$this->userData
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
