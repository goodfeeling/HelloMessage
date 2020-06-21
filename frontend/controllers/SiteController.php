<?php
namespace frontend\controllers;

use backend\models\ActivityModel;
use backend\models\AdminUser;
use backend\models\ImagesModel;
use common\models\User;
use Yii;
use frontend\behaviors\LoginBehavior;
/**
 * Site controller
 */
class SiteController extends BaseController
{
    public function behaviors()
    {
        return [
            'login' => [
                'class'=> LoginBehavior::className()
            ]
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
       $query = ActivityModel::find();
       $user_query = AdminUser::find();
       $recommend = $query
           ->orderBy("sort DESC")
           ->select('id,author_id,name,views,keyword,pic_url_id,addtime')
           ->limit(4)
           ->asArray()
           ->all();
       foreach ($recommend as $key=>&$val)
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
        return $this->render('index',[
           'model'=>$model,
           'recomment'=>$recommend,
            'userInfo'=>$this->userData
        ]);
    }

    /**
     * Displays post.
     *
     * @return mixed
     */
    public function actionPost()
    {
        return $this->render('post');
    }

    /**
     * Displays guidance.
     *
     * @return mixed
     */
    public function actionGuidance()
    {
        return $this->render('guidance');
    }

    /**
     * Displays setting.
     *
     * @return mixed
     */
    public function actionSetting()
    {
        return $this->render('setting');
    }

    /**
     * Displays error.
     *
     * @return mixed
     */
    public function actionError()
    {
        return $this->render('error');
    }
}
