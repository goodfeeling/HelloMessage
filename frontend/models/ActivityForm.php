<?php

namespace frontend\models;

use backend\models\ActivityCommentModel;
use backend\models\ActivityUserModel;
use backend\models\OrderModel;
use backend\models\UserDetailModel;
use common\utils\CommonFun;
use common\utils\ConstStatus;
use Yii;
use backend\models\ActivityLikesUserModel;
use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;
use yii\data\Pagination;

class ActivityForm extends BaseModel
{
    public $id;
    public $uid;
    public $size;

    /**
     * 获得数据
     * @return array|\yii\db\ActiveRecord|null
     */
    public function getData()
    {
        $model = ActivityModel::find();
        $res = $model->where(['id' => $this->id])
            ->select('id,addtime,name,describe,join_number,keyword,author_id,pic_url_id,views')
            ->asArray()
            ->one();
        $user_query = AdminUser::find();
        $author = $user_query
            ->where(['id' => $res['author_id']])
            ->select('avatar_url,nickname')
            ->one();

        $res['avatar_url'] = $author['avatar_url'];
        $res['nickname'] = $author['nickname'];
        $res['likes'] = ActivityLikesUserModel::find()
            ->where(['aid' => $this->id])
            ->count();
        return $res;
    }

    /**
     * 获得活动数据
     * @return array
     */
    public function getActivityData()
    {
        $query = ActivityModel::find();
        $user_query = AdminUser::find();
        $recomment = $query
            ->orderBy("sort DESC")
            ->select('id,author_id,name,views,keyword,pic_url_id,addtime')
            ->limit(4)
            ->asArray()
            ->all();
        foreach ($recomment as $key => &$val) {
            $author = $user_query
                ->where(['id' => $val['author_id']])
                ->select('avatar_url,nickname')
                ->one();
            $val['avatar_url'] = $author['avatar_url'];
            $val['nickname'] = $author['nickname'];
            $val['addtime'] = CommonFun::get_last_time(strtotime($val['addtime']));
            $img = ImagesModel::findOne(['id' => $val['pic_url_id']]);
            $val['img_url'] = Yii::getAlias('@back') . $img['url'];
        }

        $model = $query
            ->orderBy("addtime DESC")
            ->select('id,author_id,name,views,keyword,addtime,pic_url_id')
            ->limit(6)
            ->asArray()
            ->all();

        foreach ($model as $key => &$val) {
            $author = $user_query
                ->where(['id' => $val['author_id']])
                ->select('avatar_url,nickname')
                ->one();
            $val['avatar_url'] = $author['avatar_url'];
            $val['nickname'] = $author['nickname'];
            $val['addtime'] = CommonFun::get_last_time(strtotime($val['addtime']));
            $img = ImagesModel::findOne(['id' => $val['pic_url_id']]);
            $val['img_url'] = Yii::getAlias('@back') . $img['url'];
        }
        return [
            'model' => $model,
            'recomment' => $recomment
        ];
    }

    /**
     * 增加浏览量
     * @return array|int
     */
    public function postIncrease()
    {
        if (!$this->id) {
            return $this->resultMsg(null, ConstStatus::CODE_NO_LOGIN, '您未登录！');
        }
        return ActivityModel::updateAllCounters([
            'views' => 1
        ], [
            'id' => $this->id
        ]);
    }

    /**
     * 点赞数计算
     * @param $uid
     * @return array
     */
    public function LikeIncrease($uid)
    {
        $checkData = ActivityLikesUserModel::findOne(['uid' => $uid, 'aid' => $this->id]);
        if ($checkData) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '您已经点过赞啦！');
        }
        $model = new ActivityLikesUserModel();
        $model->aid = $this->id;
        $model->uid = $uid;

        if (!$model->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_NO_LOGIN, '您需要登陆！');
        }

        if ($model->save()) {
            $count = ActivityLikesUserModel::find()
                ->where(['aid' => $this->id])->count();
            return $this->resultMsg($count, ConstStatus::CODE_SUCCESS, '点赞成功！');
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '点赞失败！');
        }
    }

    /**
     * 状态数据
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getStateData()
    {
        $userActivity = ActivityUserModel::find()
            ->where(['uid'=>$this->uid])
            ->orderBy('create_time DESC')
            ->asArray()
            ->all();
        foreach ($userActivity as $key=>&$value) {
            // 这个用户参加的所有活动
            $activity = ActivityModel::find()
                ->where(['id'=>$value['aid']])
                ->select('name,addtime,endtime,theme')
                ->asArray()
                ->one();
            $value = array_merge($activity, $value);
            // 是否付费
            $isPay = OrderModel::find()
                ->where([
                    'aid'=>$value['aid'],
                    'uid'=>$this->uid,
                    'is_pay'=>1
                ])->exists();
            $value['is_pay'] = $isPay;
            // 是否签到
            $isJoin = ActivityUserModel::find()
                ->where([
                    'aid'=>$value['aid'],
                    'uid'=>$this->uid,
                    'is_join'=>1
                ])->exists();
            $value['is_join'] = $isJoin;
        }
        return $userActivity;
    }

    /**
     * 支付
     * @return array
     */
    public function saveVerify()
    {
        $CheckUserExist = UserDetailModel::find()
            ->where(['uid'=>$this->uid])
            ->exists();
        if ($CheckUserExist) {
            $exist = ActivityUserModel::find()
                ->where(['uid'=>$this->uid,'aid'=>$this->id])
                ->exists();
            if ($exist){
                return $this->resultMsg(null, ConstStatus::CODE_NO_PAY, '还没有支付金额！');
            }

            $UserActivity = new ActivityUserModel();
            $UserActivity->uid = $this->uid;
            $UserActivity->aid = $this->id;
            $UserActivity->join_time = null;
            $UserActivity->create_time = date("yy-m-d H:i:s");
            $UserActivity->is_join = '0';
            $UserActivity->save();

            $isPay = OrderModel::find()
                ->where([
                    'aid'=>$this->id,
                    'uid'=>$this->uid,
                    'is_pay'=>1
                ])->exists();

            if (!$isPay) {
                return $this->resultMsg(null, ConstStatus::CODE_NO_PAY, '还没有支付金额！');
            } else {
                return $this->resultMsg(null, ConstStatus::CODE_GO_TOCENTER, '您已经填写过了，需要修改请到个人中心！');
            }

        } else {
            return $this->resultMsg(null, ConstStatus::CODE_SUCCESS, 'no error！');
        }
    }

    // 获得所有有效的活动分类
    public function getCategory()
    {
        $query = ActivityModel::find()->where(['status' => 1]);
        $pages = new Pagination([
            'totalCount' => (clone $query)->count(),
            'defaultPageSize' => $this->size,
        ]);
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
        return ['models' => $models, 'pages' => $pages];
    }

    /**
     * 生成二维码
     */
    public function generateQrCode()
    {

    }

    // 处理二维码
    public function handleQrCode()
    {

    }
}
