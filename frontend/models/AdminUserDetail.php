<?php


namespace frontend\models;


use backend\models\ActivityUserModel;
use backend\models\UserDetailModel;

class AdminUserDetail extends BaseModel
{
    public $aid;

    public $uid;
    public $income;
    public $height;
    public $mobile;
    public $birthday;
    public $name;
    public $character;
    public $occupation;
    public $cars_and_houses;
    public $marital_status;
    public $gender;
    public $education;
    public $native_place;
    public $hobby;
    public $mate_require;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid'], 'required'],
            [['uid', 'height', 'mobile'], 'integer', 'message' => '请输入正确的我手机号码、身高'],
            [['birthday'], 'safe'],
            [['name', 'income', 'native_place', 'character'], 'string', 'max' => 10, 'message' => '请输入的正确的内容！'],
            [['occupation'], 'string', 'max' => 20],
            [['cars_and_houses', 'marital_status','education'], 'string', 'max' => 2],
            [['hobby'], 'string', 'max' => 200,'message' => '爱好只能在200字符以内！'],
            [['mate_require'], 'string', 'max' => 500, 'message' => '择偶只能在1000个字符内！'],
            [['gender'], 'string', 'max' => 1]
        ];
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

        if (!$this->uid) {
            return [
                'msg' => '您需要登陆！',
                'state' => 100,
                'data' => null,
            ];
        }

        $CheckUserExist = UserDetailModel::find()
            ->where(['uid'=>$this->uid])
            ->exists();
        if ($CheckUserExist) {
            return [
                'msg' => '您已经填写过了！',
                'state' => 303,
                'data' => null,
            ];
        }

        $model = new UserDetailModel();
        $model->attributes = $this->attributes;
        $model->update_time = date('yy-m-d H:i:s');
        $model->addtime = date('yy-m-d H:i:s');
        if ($model->save()) {
            $UserActivity = new ActivityUserModel();
            $UserActivity->uid = $this->uid;
            $UserActivity->aid = $this->aid;
            $UserActivity->join_time = null;
            $UserActivity->create_time = date("yy-m-d H:i:s");
            $UserActivity->is_join = '0';
            if ($UserActivity->save()) {
                return  [
                    'msg'=>'成功',
                    'state'=>0,
                    'data'=>null
                ];
            }
        } else {
            return  [
                'msg'=>current($model->getErrors())[0],
                'state'=>1,
                'data'=>null
            ];
        }
    }

    public function getUserData()
    {
        $query = AdminUserDetail::find();
        $res = $query
            ->where(['uid'=>$this->uid])
            ->asArray()
            ->one();

        return [
            'msg'=>'获取成功',
            'state'=>0,
            'data'=>$res
        ];
    }
}