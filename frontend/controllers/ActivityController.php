<?php
namespace frontend\controllers;

use frontend\models\ActivityComments;
use frontend\models\ActivityForm;
use frontend\models\Order;
use frontend\models\UserDetail;
use Yii;
use yii\filters\AccessControl;

class ActivityController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['apply','likes-increase'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                        'verbs' => ['POST']
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->asJson([
                        'msg' => '您需要登陆!',
                        'state' => 100,
                        'data' => null,
                    ]);
                }
            ],
        ];
    }

    /**
     * Displays apply.
     *
     * @return mixed
     */
    public function actionApply()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $form = new UserDetail();
            $form->uid = Yii::$app->user->id;
            $form->attributes = $request->post();
            $form->aid = $request->get('id');
            $res = $form->saveData();
            return $this->asJson($res);
        }
        return $this->render('apply');
    }

    /**
     * 验证用户
     */
    public function actionVerifyUser()
    {
        $form = new ActivityForm();
        $form->id = Yii::$app->request->get('id');
        $form->uid = Yii::$app->user->id;
        $res = $form->saveVerify();
        return $this->redirect($res['state'] == 303 ? ['user-pay'] : ['apply']);
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
        $form = new ActivityForm();
        $form->size = Yii::$app->request->get('size', '10');
        $res = $form->getCategory();
        return $this->render('category', [
            'models' => $res['models'],
            'pages' => $res['pages'],
        ]);
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
            $form = new Order();
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
        $form = new ActivityComments();
        $form->aid = $request->get('id');
        $form->size = $request->get('size', '10');
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
