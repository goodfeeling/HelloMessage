<?php
namespace backend\models;

use Yii;

class LoginForm extends \backend\models\BaseModel
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
            // 实例接口
            $wechat = new \WeChat\Oauth($config);
            // 执行操作
            $redirect_url = '';
            $state = '';
            $scope = '';
            $result = $wechat->getOauthRedirect($redirect_url, $state, $scope);
            return $result;
        } catch (Exception $e){
        
            // 异常处理
            echo  $e->getMessage();
            
        }
    }
}