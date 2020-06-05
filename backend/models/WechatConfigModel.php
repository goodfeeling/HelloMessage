<?php
namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%admin_wechat_config}}".
 *
 * @property integer $id
 * @property string $app_id
 * @property string $app_secret
 * @property string $mch_id
 * @property string $key
 * @property string $cert_pem
 * @property string $key_pem
 */
class WechatConfigModel extends \backend\models\BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_wechat_config}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['app_id', 'app_secret', 'mch_id', 'key', 'cert_pem', 'key_pem'], 'required'],
            [['app_id', 'app_secret', 'key'], 'string', 'max' => 100],
            [['mch_id'], 'string', 'max' => 30],
            [['cert_pem', 'key_pem'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => '微信appid',
            'app_secret' => '微信appsecret',
            'mch_id' => '商户号',
            'key' => 'Api密钥',
            'cert_pem' => 'apiclient_cert.pem',
            'key_pem' => 'apiclient_key.pem',
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
//                         'dbType' => "int(10) unsigned",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => true,
                        'phpType' => 'integer',
                        'precision' => '10',
                        'scale' => '',
                        'size' => '10',
                        'type' => 'integer',
                        'unsigned' => true,
                        'label'=>$this->getAttributeLabel('id'),
                        'inputType' => 'hidden',
                        'isEdit' => true,
                        'isSearch' => true,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'app_id' => array(
                        'name' => 'app_id',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '微信appid',
//                         'dbType' => "varchar(100)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '100',
                        'scale' => '',
                        'size' => '100',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('app_id'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'app_secret' => array(
                        'name' => 'app_secret',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '微信appsecret',
//                         'dbType' => "varchar(100)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '100',
                        'scale' => '',
                        'size' => '100',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('app_secret'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'mch_id' => array(
                        'name' => 'mch_id',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '商户号',
//                         'dbType' => "varchar(30)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '30',
                        'scale' => '',
                        'size' => '30',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('mch_id'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'key' => array(
                        'name' => 'key',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => 'Api密钥',
//                         'dbType' => "varchar(100)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '100',
                        'scale' => '',
                        'size' => '100',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('key'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'cert_pem' => array(
                        'name' => 'cert_pem',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => 'apiclient_cert.pem',
//                         'dbType' => "varchar(255)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '255',
                        'scale' => '',
                        'size' => '255',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('cert_pem'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'key_pem' => array(
                        'name' => 'key_pem',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => 'apiclient_key.pem',
//                         'dbType' => "varchar(255)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '255',
                        'scale' => '',
                        'size' => '255',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('key_pem'),
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
