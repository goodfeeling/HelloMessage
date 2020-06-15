<?php
namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%admin_activity_comments}}".
 *
 * @property integer $id
 * @property integer $aid
 * @property integer $uid
 * @property string $content
 * @property string $addtime
 * @property integer $status
 */
class ActivityCommentModel extends \backend\models\BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_activity_comments}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['aid', 'uid', 'content', 'addtime', 'status'], 'required'],
            [['aid', 'uid'], 'integer'],
            [['addtime'], 'safe'],
            [['content'], 'string', 'max' => 1000],
            [['status'], 'string', 'max' => 1]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'aid' => '活动id',
            'uid' => '用户id',
            'content' => '内容',
            'addtime' => '添加时间',
            'status' => '审核状态',
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
		'content' => array(
                        'name' => 'content',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '内容',
//                         'dbType' => "varchar(1000)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '1000',
                        'scale' => '',
                        'size' => '1000',
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
		'addtime' => array(
                        'name' => 'addtime',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '添加时间',
//                         'dbType' => "datetime",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'string',
                        'precision' => '',
                        'scale' => '',
                        'size' => '',
                        'type' => 'datetime',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('addtime'),
                        'inputType' => 'text',
                        'isEdit' => true,
                        'isSearch' => false,
                        'isDisplay' => true,
                        'isSort' => true,
//                         'udc'=>'',
                    ),
		'status' => array(
                        'name' => 'status',
                        'allowNull' => false,
//                         'autoIncrement' => false,
//                         'comment' => '审核状态',
//                         'dbType' => "tinyint(1)",
                        'defaultValue' => '',
                        'enumValues' => null,
                        'isPrimaryKey' => false,
                        'phpType' => 'integer',
                        'precision' => '1',
                        'scale' => '',
                        'size' => '1',
                        'type' => 'tinyint',
                        'unsigned' => false,
                        'label'=>$this->getAttributeLabel('status'),
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
