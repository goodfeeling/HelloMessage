<?php

namespace frontend\models;

use Yii;
use backend\models\AdminUser;
use backend\models\ActivityModel;
use backend\models\ActivityLikesUserModel;

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
}
