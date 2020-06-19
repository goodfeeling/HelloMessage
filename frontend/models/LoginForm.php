<?php
namespace frontend\models;

use Yii;
use yii\helpers\Url;

class LoginForm extends BaseModel
{
    public $code;
    public $encrypted_data;
    public $iv;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'encrypted_data', 'iv'], 'string']
        ];
    }

    /**
     * 微信公众号登录
     * 
     * @inheritdoc
     */
    public function wxLogin()
    {

    }

    /**
     * 跳到登录
     * 
     * @inheritdoc
     */
    public function jumpLogin()
    {
        try {
            $config = $this->getWxConfig('simple');
            $wechat = new \WeChat\Oauth($config);
            // 执行操作
            $result = $wechat->getOauthRedirect(Url::toRoute('login/index', true), 123);
            return [
                'msg' => '获取成功',
                'status' => 0,
                'data' => $result
            ];
        } catch (Exception $e){
           return  [
               'msg' => '$e->getMessage()',
               'status' => 1,
               'data' => null
           ];
        }
    }
}