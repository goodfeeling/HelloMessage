<?php


namespace frontend\models;


use backend\models\ActivityCommentModel;
use backend\models\AdminUser;
use common\utils\CommonFun;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;

class AdminActivityComments extends BaseModel
{
    public $aid;
    public $uid;
    public $content;
    public $addtime;
    public $status;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['aid', 'content'], 'required', 'message' => '请输入完整的内容！'],
            [['aid'], 'integer', 'message' => 'aid error！'],
            [['addtime'], 'safe'],
            [['content'], 'string', 'max' => 1000, 'message' => '评论内容不能为空且最大为1000个字符！'],
            [['status'], 'string', 'max' => 1]
        ];
    }


    public function saveData()
    {
        if (!$this->validate()) {
            return [
                'msg' => current($this->getErrors())[0],
                'state' => 1,
                'data' => null
            ];
        }

        $model = new ActivityCommentModel();
        $model->attributes = $this->attributes;
        $model->addtime = date("yy-m-d H:i:i");
        $model->status = '0';

        if ($model->save()) {
            return [
                'msg' => '评论成功',
                'state' => 0,
                'data' => self::getData()
            ];
        } else {
            return [
                'msg' => '评论失败',
                'state' => 1,
                'data' => null
            ];
        }
    }

    public function getData_old()
    {
        $query = ActivityCommentModel::find()
            ->where(['aid' => $this->aid])
            ->orderBy('addtime DESC')
            ->asArray()
            ->all();
        $user_query = AdminUser::find();
        foreach ($query as $key => &$value) {
            $author = $user_query
                ->where(['id' => $value['uid']])
                ->select('avatar_url,nickname')
                ->one();
            $value['avatar_url'] = $author['avatar_url'];
            $value['nickname'] = $author['nickname'];
//            $value['addtime'] = \Yii::$app->formatter->asRelativeTime($value['addtime']);
            $value['addtime'] = CommonFun::get_last_time(strtotime($value['addtime']));
        }
        return ['list' => $query, 'count' => count($query)];
    }

    public function getData()
    {
        // $query = ActivityCommentModel::find()
        //     ->where(['aid' => $this->aid])
        //     ->orderBy('addtime DESC')
        //     ->asArray()
        //     ->all();
        $query = new ActiveDataProvider([
            'query'=>ActivityCommentModel::find()->where(['aid' => $this->aid])->orderBy('addtime DESC')->asArray()->all(),
            'pagination' => new Pagination()
        ]);
        var_dump($query->_totalCount);exit;
        $user_query = AdminUser::find();
        foreach ($query as $key => &$value) {
            $author = $user_query
                ->where(['id' => $value['uid']])
                ->select('avatar_url,nickname')
                ->one();
            $value['avatar_url'] = $author['avatar_url'];
            $value['nickname'] = $author['nickname'];
//            $value['addtime'] = \Yii::$app->formatter->asRelativeTime($value['addtime']);
            $value['addtime'] = CommonFun::get_last_time(strtotime($value['addtime']));
        }
        return ['list' => $query, 'count' => count($query)];
    }

}