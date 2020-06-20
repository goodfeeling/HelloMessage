<?php
/**
 * Created by IntelliJ IDEA.
 * User: yzw
 * Date: 2020/6/18
 * Time: 1:05
 */

namespace frontend\behaviors;

use app\hejiang\ApiResponse;
use yii\base\ActionFilter;
use yii\helpers\Url;
use yii\web\Controller;

class LoginBehavior extends ActionFilter 
{
    public function beforeAction($action)
    {
        $cookies = \Yii::$app->request->cookies;
        $session = \Yii::$app->session;
        if (($cookie = $cookies->get('access_token')) !== null) {
            if ($session['access_token']['value'] == $cookie ) {
                $access_token = $cookie->value;
            }
        }
         if (!$access_token) {
             return $this->render('@app/views/login/index');
         }
        return true;
    }


}