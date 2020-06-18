<?php
namespace backend\models;

class BaseModel extends \yii\db\ActiveRecord
{
    // 微信配置
    public function getWxConfig($type)
    {
        $wechat_config = WechatConfigModel::find()
            ->orderBy('id DESC')
            ->limit(1)
            ->one();
        if (!empty($wechat_config)) {
            if ($type == 'simple') {
                return  [
                    'token'          => 'test',
                    'appid'          => $wechat_config['app_id'],
                    'appsecret'      => $wechat_config['app_secret'],
                    'encodingaeskey' => $wechat_config['encodingaeskey'],
                ];
            } else {
                return  [
                    'token'          => 'test',
                    'appid'          => $wechat_config['app_id'],
                    'appsecret'      => $wechat_config['app_secret'],
                    'encodingaeskey' => $wechat_config['encodingaeskey'],
                    // 配置商户支付参数（可选，在使用支付功能时需要）
                    'mch_id'         => $wechat_config['mch_id'],
                    'mch_key'        => $wechat_config['key'],
                    // 配置商户支付双向证书目录（可选，在使用退款|打款|红包时需要）
                    'ssl_key'        => $wechat_config['key_pem'],
                    'ssl_cer'        => $wechat_config['cert_pem'],
                    // 缓存目录配置（可选，需拥有读写权限）
                    'cache_path'     => '',
                ];
            }
        }else {
            return null;
        }
    }

   
}

?>