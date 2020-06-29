<?php


namespace frontend\controllers;

use frontend\models\ActivityForm;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use frontend\behaviors\LoginBehavior;
use Yii;

class ActivityController extends BaseController
{
    /**
     * Displays 活动申请.
     *
     * @return mixed
     */
    public function actionApply()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new ActivityForm();
            $form->attributes = $request->post();
            $res = $form->saveData();
            return $this->asJson($res);
        }
        return $this->render('apply');
    }

    /**
     * Displays 活动详情.
     *
     * @return mixed
     */
    public function actionPost()
    {
        $request = Yii::$app->request;
        $form = new ActivityForm();
        $form->id = $request->get('id');
        $res = $form->getData();
        $form->postIncrease();
        return $this->render('post', [
            'data' => $res
        ]);
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

    /**
     * Displays 喜欢递增.
     *
     * @return mixed
     */
    public function actionLikesIncrease()
    {
        $request = Yii::$app->request;
        $form = new ActivityForm();
        $form->id = $request->post('id');
        $res = $form->LikeIncrease($this->userData['id']);
        return $this->asJson($res);
    }
}
