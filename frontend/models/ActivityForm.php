<?php

namespace frontend\models;

use backend\models\FeedbackModel;
use Yii;
use backend\models\ActivityLikesUserModel;
use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;

class ActivityForm extends BaseModel
{
    public $id;

    public $title;
    public $content;
    public $email;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content','email'], 'required', 'message' => '请输入完整的内容！'],
            [['title'], 'string', 'max' => 100, 'message' => '标题最大为100个字符！'],
            [['content'], 'string', 'max' => 500, 'message' => '内容最大为500个字符！'],
            ['email', 'email', 'message' => '请输入正确的邮箱！'],
        ];
    }

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

    public function saveData()
    {
        if ( !$this->validate() ){
            return [
                'msg'=>current($this->getErrors())[0],
                'state'=>1,
                'data'=>null
            ];
        }
        $model = new FeedbackModel();
        $model->title = $this->title;
        $model->content = $this->content;
        $model->email = $this->email;
        $model->addtime =  date('Y-m-d H:i:s');
        $model->type = '1';

        if ($model->save()) {
            return  [
                'msg'=>'提交成功',
                'state'=>0,
                'data'=>null
            ];
        } else {
            return  [
                'msg'=>'提交失败',
                'state'=>1,
                'data'=>null
            ];
        }

    }
}
