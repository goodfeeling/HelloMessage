<?php

/**
 * Created by IntelliJ IDEA.
 * User: yzw
 * Date: 2020/6/18
 * Time: 1:05
 */

namespace frontend\controllers;

use backend\models\AdminUser;
use yii\web\Controller;

class BaseController extends Controller
{
    // 用户数据
    public $userData;

    public $id;

    public $userName;

    // 用户的token
    public $access_token;
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        $session = \Yii::$app->session;
        if (!($this->access_token = @$session['access_token']['value'])) {
            $cookies = \Yii::$app->request->cookies;
            $this->access_token = $cookies->get('access_token');
        }
        if ( !($this->access_token) ){
            return true;
        }
        $userData = AdminUser::findOne([
            'access_token' => $this->access_token
        ]);
        $this->userData = $userData;
        return true;
    }
}
