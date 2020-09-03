<?php
namespace frontend\controllers;

use frontend\models\ActivityForm;

/**
 * Site controller
 */
class SiteController extends BaseController
{
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
           'recomment'=>$res['recomment']
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
     * Displays helper document.
     * @return string
     */
    public function actionFaq()
    {
        return $this->render('faq');
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
