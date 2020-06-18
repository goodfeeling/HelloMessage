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
use yii\web\Controller;

class LoginBehavior extends ActionFilter 
{
    public function beforeAction($action)
    {
        // $access_token = \Yii::$app->request->get('access_token');
        // if (!$access_token) {
            // $access_token = \Yii::$app->request->post('access_token');
        // }
        // if (!$access_token) {
            // 跳到登录页面
            // \Yii::$app->response->data = new ApiResponse(-1, 'access_token 不能为空');
            // return false;
        // }
        
        return true;
    }


}