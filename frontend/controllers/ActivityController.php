<?php


namespace frontend\controllers;

use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;
use frontend\models\ActivityForm;
use frontend\models\UserDetailForm;
use yii\data\Pagination;
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
        if (empty($this->userData)) {
            return [
                'msg' => '您需要登陆！',
                'state' => 100,
                'data' => null,
            ];
        }

        $request = Yii::$app->request;
        if ($request->isPost) {

            $form = new UserDetailForm();
            $form->attributes = $request->post();
            $res = $form->saveData();
            return $this->asJson($res);
        }
        return $this->render('apply');
    }

    public function actionVerifyUser()
    {
        if (empty($this->userData)) {
            $res =  [
                'msg' => '您需要登陆！',
                'state' => 100,
                'data' => null,
            ];
        }else {
            $res =  [
                'msg' => 'no error',
                'state' => 0,
                'data' => null,
            ];
        }
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
        return $this->render('category',[
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
        if ($request->isPost) {

        } else {
            $form = new ActivityForm();
            $res = $form->getStateData();
            return $this->render('my-category',[
                'data'=>$res
            ]);
        }
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
