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
        $object = new \yii\web\Response();
        $cookies = \Yii::$app->request->cookies;
        if (($cookie = $cookies->get('language')) !== null) {
            $access_token = $cookie->value;
        }
         if (!$access_token) {
             $object->redirect(Url::toRoute('login/index', true));
             return false;
         }
        return true;
    }


}