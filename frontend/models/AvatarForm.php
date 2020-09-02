<?php


namespace frontend\models;


use backend\models\AdminUser;
use common\models\User;
use common\utils\ConstStatus;

class AvatarForm extends BaseModel
{
    use Send;

    public $imageFile;
    public $uid;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['imageFile', 'default', 'value' => '/images/temp_avatar.jpg'],
        ];
    }

    public function save()
    {
        if (!$this->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($this->getErrors())[0]);
        }
        $model = AdminUser::findOne($this->uid);
        $model->avatar_url = $this->imageFile;
        if (!$model->validate()) {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, current($model->getErrors())[0]);
        }
        if ($model->save()) {
            return $this->resultMsg(null, ConstStatus::CODE_SUCCESS, '更新成功');
        } else {
            return $this->resultMsg(null, ConstStatus::CODE_ERROR, '更新失败');
        }
    }
}