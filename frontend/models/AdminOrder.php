<?php


namespace frontend\models;


use backend\models\OrderModel;

class AdminOrder extends BaseModel
{
    public $aid;
    public $uid;
    public $money;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['aid', 'uid', 'money'], 'required'],
            [['aid', 'uid'], 'integer'],
            [['order_number'], 'string', 'max' => 35],
            [['money'], 'string', 'max' => 8]
        ];
    }

    public function sendPay()
    {
        if ( !$this->validate() ){
            return [
                'msg'=>current($this->getErrors())[0],
                'state'=>1,
                'data'=>null
            ];
        }

        $model = new OrderModel();
        $model->attributes = $this->attributes;
        $model->addtime = date('yy-m-d H:i:s');
        $model->order_number = 'A123456456sda';
        $model->is_pay = 1;

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