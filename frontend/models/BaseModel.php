<?php


namespace frontend\models;

use backend\models\WechatConfigModel;
use common\utils\ConstStatus;

class BaseModel extends \yii\db\ActiveRecord
{
    // 微信配置
    public function getWxConfig()
    {
        $WeChat_config = WechatConfigModel::find()
            ->select([
                'app_id AS appid',
                'app_secret AS appsecret',
                'encodingaeskey',
                'mch_id',
                'key AS mch_key',
                'key_pem AS ssl_key',
                'cert_pem AS ssl_cer'
            ])
            ->orderBy('id DESC')
            ->asArray()
            ->one();
        $WeChat_config['token'] = 'test';
        $WeChat_config['cache_path'] = '';
        if ( !empty($WeChat_config) ) {
           return $WeChat_config;
        } else {
            return null;
        }
    }

    public function resultMsg($data, $state = 0, $msg = '')
    {
        return [
            'msg' => $msg,
            'state' => $state,
            'data' => $data,
        ];
    }
}