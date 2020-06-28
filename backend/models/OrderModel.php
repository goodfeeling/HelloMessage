<?php
namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%admin_order}}".
 *
 * @property integer $id
 * @property string $order_number
 * @property integer $aid
 * @property integer $uid
 * @property integer $is_pay
 * @property integer $money
 */
class OrderModel extends \backend\models\BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_number', 'aid', 'uid', 'money'], 'required'],
            [['aid', 'uid'], 'integer'],
            [['order_number'], 'string', 'max' => 35],
            [['is_pay'], 'string', 'max' => 1],
            [['money'], 'string', 'max' => 8]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order_number' => '订单号',
            'aid' => '活动id',
            'uid' => '用户id',
            'is_pay' => '是否支付',
            'money' => '支付金额',
        ];
    }

  /**
     * 返回数据库字段信息，仅在生成CRUD时使用，如不需要生成CRUD，请注释或删除该getTableColumnInfo()代码
     * COLUMN_COMMENT可用key如下:
     * label - 显示的label
     * inputType 控件类型, 暂时只支持text,hidden  // select,checkbox,radio,file,password,
     * isEdit   是否允许编辑，如果允许编辑将在添加和修改时输入
     * isSearch 是否允许搜索
     * isDisplay 是否在列表中显示
     * isOrder 是否排序
     * udc - udc code，inputtype为select,checkbox,radio三个值时用到。
     * 特别字段：
     * id：主键。必须含有主键，统一都是id
     * create_date: 创建时间。生成的代码自动赋值
     * update_date: 修改时间。生成的代码自动赋值
     */
    public function getTableColumnInfo(){
        return array(
        'id' => array(
                        'name' => 'id',
                        'allowNull' => false,
//                         'autoIncrement' => true,
//                         'comment' => '',
//                         'dbType' => "int(11)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => true,
                        'phpType' => 'integer',
                        'precision' => '11',
                        'scale' => '',
                        'size' => '11',
                        'type' => 'integer',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('id'),
                        'inputType' => 'hidden',
                        'isEdit' => true,
                        'isSearch' => true,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'order_number' => array(
                        'name' => 'order_number',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '订单号',
//                         'dbType' => "varchar(35)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '35',
                        'scale' => '',
                        'size' => '35',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('order_number'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'aid' => array(
                        'name' => 'aid',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '活动id',
//                         'dbType' => "int(11)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'integer',
                        'precision' => '11',
                        'scale' => '',
                        'size' => '11',
                        'type' => 'integer',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('aid'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'uid' => array(
                        'name' => 'uid',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '用户id',
//                         'dbType' => "int(11)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'integer',
                        'precision' => '11',
                        'scale' => '',
                        'size' => '11',
                        'type' => 'integer',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('uid'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'is_pay' => array(
                        'name' => 'is_pay',
                        'allowNull' => true,
//                         'autoIncrement' => false,
//                         'comment' => '是否支付',
//                         'dbType' => "tinyint(1)",
                        'defaultValue' => '0',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'integer',
                        'precision' => '1',
                        'scale' => '',
                        'size' => '1',
                        'type' => 'tinyint',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('is_pay'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'money' => array(
                        'name' => 'money',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '支付金额',
//                         'dbType' => "tinyint(8)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'integer',
                        'precision' => '8',
                        'scale' => '',
                        'size' => '8',
                        'type' => 'tinyint',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('money'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		        );
        
    }
 
}
