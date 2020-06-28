<?php
namespace backend\models;

use yii\base\Model;
use yii\web\UploadedFile;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg'],
        ];
    }


    public function upload()
    {
        if ($this->validate()) {
            $save_url = UPLOADS_PATH . $this->imageFile->baseName . '.' . $this->imageFile->extension;
            $url = '/resource/uploads/' . $this->imageFile->baseName . '.' . $this->imageFile->extension;
            $this->imageFile->saveAs($save_url);
            $imageModel = new ImagesModel();
            $imageModel->url = $url;
            $imageModel->created_at = date("Y-m-d H:i:s");
            $imageModel->save();
            if ($imageModel->save()) {
                return true;
            }
        }
        return false;
    }
}