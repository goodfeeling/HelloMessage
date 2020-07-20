<?php
namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%admin_system}}".
 *
 * @property integer $id
 * @property double $lng
 * @property double $lat
 * @property integer $aid
 * @property string $title
 * @property string $content
 */
class SystemModel extends \backend\models\BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%system}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['lng', 'lat'], 'number'],
            [['aid'], 'required'],
            [['aid'], 'integer'],
            [['title'], 'string', 'max' => 10],
            [['content'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'lng' => '经度',
            'lat' => '纬度',
            'aid' => '活动id',
            'title' => '地图标题',
            'content' => '地图内容',
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
		'lng' => array(
                        'name' => 'lng',
                        'allowNull' => true,
//                         'autoIncrement' => false,
//                         'comment' => '经度',
//                         'dbType' => "double(10,6)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'double',
                        'precision' => '10',
                        'scale' => '6',
                        'size' => '10',
                        'type' => 'double',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('lng'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'lat' => array(
                        'name' => 'lat',
                        'allowNull' => true,
//                         'autoIncrement' => false,
//                         'comment' => '纬度',
//                         'dbType' => "double(10,6)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'double',
                        'precision' => '10',
                        'scale' => '6',
                        'size' => '10',
                        'type' => 'double',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('lat'),
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
		'title' => array(
                        'name' => 'title',
                        'allowNull' => true,
//                         'autoIncrement' => false,
//                         'comment' => '地图标题',
//                         'dbType' => "varchar(10)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '10',
                        'scale' => '',
                        'size' => '10',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('title'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'content' => array(
                        'name' => 'content',
                        'allowNull' => true,
//                         'autoIncrement' => false,
//                         'comment' => '地图内容',
//                         'dbType' => "varchar(50)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '50',
                        'scale' => '',
                        'size' => '50',
                        'type' => 'string',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('content'),
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
