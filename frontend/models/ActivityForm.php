<?php

namespace frontend\models;

use backend\models\ActivityUserModel;
use backend\models\OrderModel;
use backend\models\UserDetailModel;
use Yii;
use backend\models\ActivityLikesUserModel;
use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;

class ActivityForm extends BaseModel
{
    public $id;
    public $uid;

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
            $val['addtime'] = \Yii::$app->formatter->asRelativeTime($val['addtime']);
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
            $val['addtime'] = \Yii::$app->formatter->asRelativeTime($val['addtime']);
            $img = ImagesModel::findOne(['id' => $val['pic_url_id']]);
            $val['img_url'] = Yii::getAlias('@back') . $img['url'];
        }
        return [
            'model' => $model,
            'recomment' => $recomment
        ];
    }

    public function postIncrease()
    {
        if (!$this->id) {
            return [
                'msg' => '您未登录！',
                'state' => 1000,
                'data' => null,
            ];
        }
        return ActivityModel::updateAllCounters([
            'views' => 1
        ], [
            'id' => $this->id
        ]);
    }

    public function LikeIncrease($uid)
    {
        $checkData = ActivityLikesUserModel::findOne(['uid' => $uid, 'aid' => $this->id]);
        if ($checkData) {
            return [
                'msg' => '您已经点过赞啦！',
                'state' => 1,
                'data' => null,
            ];
        }
        $model = new ActivityLikesUserModel();
        $model->aid = $this->id;
        $model->uid = $uid;

        if (!$model->validate()) {
            return [
                'msg' => '您需要登陆！',
                'state' => 100,
                'data' => null,
            ];
        }

        if ($model->save()) {
            $count = ActivityLikesUserModel::find()
                ->where(['aid' => $this->id])->count();
            return [
                'msg' => '点赞成功！',
                'state' => 0,
                'data' => $count,
            ];
        } else {
            return [
                'msg' => '点赞失败！',
                'state' => 1,
                'data' => null,
            ];
        }
    }

    public function getStateData()
    {
        $userActivity = ActivityUserModel::find()
            ->where([
                'uid'=>$this->uid
            ])
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
            $value['is_pay'] = $isPay ? 1 : 0;
            // 是否签到
            $isJoin = ActivityUserModel::find()
                ->where([
                    'aid'=>$value['aid'],
                    'uid'=>$this->uid,
                    'is_join'=>1
                ])->exists();
            $value['is_join'] = $isJoin ? 1 : 0;
        }
        var_dump($userActivity);exit;
        return $userActivity;
    }

    public function saveVerify()
    {
        $CheckUserExist = UserDetailModel::find()
            ->where([
                'uid'=>$this->uid
            ])
            ->exists();
        if ($CheckUserExist) {
            $exist = ActivityUserModel::find()
                ->where(['uid'=>$this->uid,'aid'=>$this->id])
                ->exists();
            if ($exist){
                return  [
                    'msg' => '还没有支付金额！',
                    'state' => 303,
                    'data' => null,
                ];
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
                return  [
                    'msg' => '还没有支付金额！',
                    'state' => 303,
                    'data' => null,
                ];
            } else {
                return  [
                    'msg' => '您已经填写过了，需要修改请到个人中心！',
                    'state' => 302,
                    'data' => null,
                ];
            }

        } else {
            return  [
                'msg' => 'no error',
                'state' => 0,
                'data' => null,
            ];
        }
    }
}
