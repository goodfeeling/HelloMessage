<?php


namespace frontend\models;


use yii\base\Model;

class Share extends BaseModel
{
    public $url;

    public function getConfig()
    {
        $config = $this->getWxConfig();
        $wechat = new \WeChat\Script($config);
        // 执行操作
        $result = $wechat->getJsSign($this->url);
        return $result;
    }

}