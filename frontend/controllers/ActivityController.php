<?php


namespace frontend\controllers;

use backend\models\ActivityModel;
use backend\models\ImagesModel;
use frontend\models\AdminActivityComments;
use frontend\models\ActivityForm;
use frontend\models\AdminOrder;
use frontend\models\AdminUserDetail;
use yii\data\Pagination;
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
            $form = new AdminUserDetail();
            $form->uid = Yii::$app->user->id;
            $form->attributes = $request->post();
            $form->aid = $request->get('id');
            $res = $form->saveData();
            return $this->asJson($res);
        }
        return $this->render('apply');
    }

    public function actionVerifyUser()
    {
        $form = new ActivityForm();
        $form->id = Yii::$app->request->get('id');
        $form->uid = Yii::$app->user->id;
        $res = $form->saveVerify();
        return $this->asJson($res);
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
        $query = ActivityModel::find()->where(['status' => 1]);
        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->orderBy("addtime DESC")
            ->select('id,name,pic_url_id')
            ->asArray()
            ->all();
        foreach ($models as $key => &$val) {
            $img = ImagesModel::findOne(['id' => $val['pic_url_id']]);
            $val['img_url'] = Yii::getAlias('@back') . $img['url'];
        }
        return $this->render('category', [
            'models' => $models,
            'pages' => $pages,
        ]);
    }

    /**
     * Displays 活动分类.
     *
     * @return mixed
     */
    public function actionMyCategory()
    {
        $request = Yii::$app->request;
        $form = new ActivityForm();
        $form->uid = Yii::$app->user->id;
        if ($request->isPost) {

        } else {
            $res = $form->getStateData();
            return $this->render('my-category', [
                'data' => $res
            ]);
        }
    }

    /**
     * Displays 支付报名费.
     *
     * @return mixed
     */
    public function actionUserPay()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new AdminOrder();
            $form->uid = Yii::$app->user->id;
            $form->aid = $request->post('id');
            $form->money = "10000";
            $res = $form->sendPay();
            return $this->asJson($res);
        } else {
            return $this->render('user-pay');
        }
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
        $res = $form->LikeIncrease(Yii::$app->user->id);
        return $this->asJson($res);
    }

    /**
     * Displays 评论列表.
     *
     * @return mixed
     */
    public function actionComment()
    {
        $request = Yii::$app->request;
        $form = new AdminActivityComments();
        $form->aid = $request->get('id');
        if ($request->isPost) {
            $form->uid = Yii::$app->user->id;
            $form->content = $request->post('content');
            $res = $form->saveData();
        } else {
            $res = [
                'msg' => '获取成功',
                'state' => 0,
                'data' => $form->getData()
            ];
        }
        return $this->asJson($res);
    }
}
