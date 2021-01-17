<?php


namespace frontend\models;


use backend\models\PostCommentModel;
use backend\models\AdminUser;
use common\utils\CommonFun;
use common\utils\ConstStatus;
use yii\data\Pagination;

class PostComment extends \yii\db\ActiveRecord
{
    use Send;

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
            ['content', 'filter', 'filter' => function ($value) {
                return str_replace('"',"",$value);
            }],
            [['status'], 'string', 'max' => 1]
        ];
    }


    public function saveData()
    {
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }

        $model = new PostCommentModel();
        $model->attributes = $this->attributes;
        $model->addtime = date("Y-m-d H:i:s");
        $model->status = '0';
        if ($model->save()) {
            return $this->resultMsg(self::getData(), ConstStatus::CODE_SUCCESS, '评论成功');
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '评论失败');
        }
    }

    public function getData()
    {
        $query = PostCommentModel::find()
            ->where(['aid' => $this->aid]);
        $count = (clone $query)->count();
        $pagination = new Pagination([
            'totalCount' => $count,
            'defaultPageSize' => $this->size,
        ]);
        $comments = $query->offset($pagination->offset)
            ->limit($pagination->limit)
            ->orderBy("addtime DESC")
            ->asArray()->all();
        $user_query = AdminUser::find();
        foreach ($comments as $key => &$value) {
            $author = $user_query
                ->where(['id' => $value['uid']])
                ->select('avatar_url,nickname')
                ->one();
            if (!( strpos($author['avatar_url'],'http') !== false )) {
                $value['avatar_url'] = \Yii::getAlias('@back').$author['avatar_url'];
            }else {
                $value['avatar_url'] = $author['avatar_url'];
            }
            $value['nickname'] = $author['nickname'];
            $value['addtime'] = \Yii::$app->formatter->asRelativeTime($value['addtime']);
        }
        return ['list' => $comments, 'count' => $count];
    }

}