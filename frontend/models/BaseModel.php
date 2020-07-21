<?php


namespace frontend\models;

use backend\models\WechatConfigModel;
use common\utils\ConstStatus;

class BaseModel extends \yii\db\ActiveRecord
{
    // 微信配置
    public function getWxConfig($type)
    {
        $WeChat_config = WechatConfigModel::find()
            ->orderBy('id DESC')
            ->limit(1)
            ->one();
        if (!empty($WeChat_config)) {
            if ($type == 'simple') {
                return [
                    'token' => 'test',
                    'appid' => $WeChat_config['app_id'],
                    'appsecret' => $WeChat_config['app_secret'],
//                    'encodingaeskey' => $WeChat_config['encodingaeskey'],
                ];
            } else {
                return [
                    'token' => 'test',
                    'appid' => $WeChat_config['app_id'],
                    'appsecret' => $WeChat_config['app_secret'],
                    'encodingaeskey' => $WeChat_config['encodingaeskey'],
                    // 配置商户支付参数（可选，在使用支付功能时需要）
                    'mch_id' => $WeChat_config['mch_id'],
                    'mch_key' => $WeChat_config['key'],
                    // 配置商户支付双向证书目录（可选，在使用退款|打款|红包时需要）
                    'ssl_key' => $WeChat_config['key_pem'],
                    'ssl_cer' => $WeChat_config['cert_pem'],
                    // 缓存目录配置（可选，需拥有读写权限）
                    'cache_path' => '',
                ];
            }
        } else {
            return null;
        }
    }

    public function resultMsg($data, ConstStatus $state, $msg = '')
    {
        return [
            'msg' => $msg,
            'state' => $state,
            'data' => $data,
        ];
    }
}