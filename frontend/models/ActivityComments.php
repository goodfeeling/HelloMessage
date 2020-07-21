<?php


namespace frontend\models;


use backend\models\ActivityCommentModel;
use backend\models\AdminUser;
use common\utils\CommonFun;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;

class ActivityComments extends BaseModel
{
    public $aid;
    public $uid;
    public $content;
    public $addtime;
    public $status;
    public $size;

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

    public function getData()
    {
        $query = ActivityCommentModel::find()->where(['aid' => $this->aid]);
        $count =  $query->count();
        $pagination = new Pagination([
            'totalCount' => $count,
            'defaultPageSize'=>$this->size,
        ]);
        $comments = $query->offset($pagination->offset)
            ->limit($pagination->limit)
            ->asArray()
            ->all();
        $user_query = AdminUser::find();
        foreach ($comments as $key => &$value) {
            $author = $user_query
                ->where(['id' => $value['uid']])
                ->select('avatar_url,nickname')
                ->one();
            $value['avatar_url'] = $author['avatar_url'];
            $value['nickname'] = $author['nickname'];
//            $value['addtime'] = \Yii::$app->formatter->asRelativeTime($value['addtime']);
            $value['addtime'] = CommonFun::get_last_time(strtotime($value['addtime']));
        }
        return ['list' => $comments, 'count' => $count];
    }

}