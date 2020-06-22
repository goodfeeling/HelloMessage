<?php

namespace frontend\models;

use Yii;
use backend\models\ActivityLikesUserModel;
use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;

class ActivityForm extends BaseModel
{
    public $id;

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
            ->where(['aid'=>$this->id])
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
       foreach ($recomment as $key=>&$val)
       {
           $author = $user_query
               ->where(['id'=>$val['author_id']])
               ->select('avatar_url,nickname')
               ->one();
           $val['avatar_url'] = $author['avatar_url'];
           $val['nickname'] = $author['nickname'];
           $val['addtime'] = \Yii::$app->formatter->asRelativeTime($val['addtime']);
           $img = ImagesModel::findOne(['id'=>$val['pic_url_id']]);
           $val['img_url'] = Yii::$app->request->hostInfo.Yii::getAlias('@back').$img['url'];
       }

       $model = $query
           ->orderBy("addtime DESC")
           ->select('id,author_id,name,views,keyword,addtime,pic_url_id')
           ->limit(6)
           ->asArray()
           ->all();

       foreach ($model as $key=>&$val)
       {
           $author = $user_query
               ->where(['id'=>$val['author_id']])
               ->select('avatar_url,nickname')
               ->one();
           $val['avatar_url'] = $author['avatar_url'];
           $val['nickname'] = $author['nickname'];
           $val['addtime'] = \Yii::$app->formatter->asRelativeTime($val['addtime']);
           $img = ImagesModel::findOne(['id'=>$val['pic_url_id']]);
           $val['img_url'] = Yii::$app->request->hostInfo.Yii::getAlias('@back').$img['url'];
       }
       return [
           'model'=>$model,
           'recomment'=>$recomment
        ];
    }

    public function postIncrease(){
       return ActivityModel::updateAllCounters([
           'views'=>1
        ],[
            'id'=>$this->id
            ]);
    }

    public function LikeIncrease($uid){
        $model = new ActivityLikesUserModel();
        $model->aid = $this->id;
        $model->uid = $uid;
        $model->validate();
        if ($model->save()) {
            return [
                'msg'=>'点赞成功',
                'statue'=>0,
                'data'=>null,
            ];
        } else {
            return [
                'msg'=>'点赞失败',
                'statue'=>1,
                'data'=>null,
            ];
        }`
     }
}
