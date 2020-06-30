<?php


namespace frontend\controllers;

use backend\models\ActivityModel;
use backend\models\ImagesModel;
use backend\models\OrderModel;
use backend\models\UserDetailModel;
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
        if (empty($this->userData)) {
            return [
                'msg' => '您需要登陆！',
                'state' => 100,
                'data' => null,
            ];
        }

        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new AdminUserDetail();
            $form->uid = $this->userData['id'];
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
            $CheckUserExist = UserDetailModel::find()
                ->where(['uid'=>$this->userData['id']])
                ->exists();
            if ($CheckUserExist) {

                $isPay = OrderModel::find()
                    ->where([
                        'aid'=>Yii::$app->request->get('id'),
                        'uid'=>$this->userData['id'],
                        'is_pay'=>1
                    ])->exists();

                if ($isPay) {
                    $res =  [
                        'msg' => '还没有支付金额！',
                        'state' => 303,
                        'data' => null,
                    ];
                } else {
                    $res =  [
                        'msg' => '您已经填写过了，需要修改请到个人中心！',
                        'state' => 302,
                        'data' => null,
                    ];
                }

            } else {
                $res =  [
                    'msg' => 'no error',
                    'state' => 0,
                    'data' => null,
                ];
            }
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
    public function actionUserPay()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new AdminOrder();
            $form->uid = $this->userData['id'];
            $form->aid = $request->post('id');
            $form->money = 100;
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
        $res = $form->LikeIncrease($this->userData['id']);
        return $this->asJson($res);
    }
}
