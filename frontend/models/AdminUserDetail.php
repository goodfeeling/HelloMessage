<?php


namespace frontend\models;


use backend\models\UserDetailModel;

class AdminUserDetail extends BaseModel
{
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
                'state' => 302,
                'data' => null,
            ];
        }

        $model = new UserDetailModel();
        $model->attributes = $this->attributes;
        if ($model->save()) {
            return  [
                'msg'=>'提交成功',
                'state'=>0,
                'data'=>null
            ];
        } else {
            return  [
                'msg'=>current($model->getErrors())[0],
                'state'=>1,
                'data'=>null
            ];
        }
    }
}