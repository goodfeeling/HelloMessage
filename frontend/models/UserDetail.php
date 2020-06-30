<?php


namespace frontend\models;


use backend\models\UserDetailModel;

class UserDetail extends BaseModel
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
            [['uid', 'income', 'height', 'mobile'], 'integer', 'message' => '手机号码、身高、收入必须是纯整型！'],
            [['birthday'], 'safe'],
            [['name', 'character'], 'string', 'max' => 10, 'message' => '请输入的正确的内容！'],
            [['occupation'], 'string', 'max' => 20, 'message' => '请输入正确的职业！'],
            [['cars_and_houses', 'marital_status', 'gender'], 'string', 'max' => 1],
            [['education'], 'string', 'max' => 2, 'message' => '请输入正确的学历！'],
            [['native_place'], 'string', 'max' => 10, 'message' => '请输入正确的籍贯如：广东省广州市！'],
            [['hobby'], 'string', 'max' => 200, 'message' => '爱好只能在255字符以内！'],
            [['mate_require'], 'string', 'max' => 500, 'message' => '择偶只能在1000个字符内！']
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