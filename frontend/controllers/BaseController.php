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
    public $userData;

    public $access_token;
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        $session = \Yii::$app->session;
        if (!($access_token = $session['access_token']['value'])) {
            $cookies = \Yii::$app->request->cookies;
            $this->access_token =$cookies->get('access_token');
        }
        $userData = AdminUser::findOne(['access_token' => $this->access_token]);
        $this->userData = $userData;
        return true;
    }
}
