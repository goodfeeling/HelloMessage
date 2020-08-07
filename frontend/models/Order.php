<?php


namespace frontend\models;


use backend\models\OrderModel;
use common\utils\ConstStatus;

class Order extends \yii\db\ActiveRecord
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
        $model->is_pay = '0';

        if ($model->save()) {
            return $this->resultMsg(null, ConstStatus::CODE_SUCCESS,'提交成功');
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_SUCCESS,'提交失败');
        }

    }

}