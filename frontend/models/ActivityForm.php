<?php

namespace frontend\models;

use backend\models\ActivityUserModel;
use backend\models\OrderModel;
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
            $value['is_pay'] = $isPay ? '已支付':'未支付';
            // 是否签到
            $isJoin = ActivityUserModel::find()
                ->where([
                    'aid'=>$value['aid'],
                    'uid'=>$this->uid,
                    'is_join'=>1
                ])->exists();
            $value['is_join'] = $isJoin ? '已签到':'未签到';
        }

        return $userActivity;
    }
}
