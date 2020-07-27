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
    public function __construct($id, $module, $config = [])
    {
        parent::__construct($id, $module, $config = []);

        if (\Yii::$app->user->identity) {
            \Yii::$app->view->params['user_info'] =
                AdminUser::find()
                ->where([
                    'id' => \Yii::$app->user->id
                ])->one();
        }
    }
    /**
     * 统一渲染json
     *
     * @param [type] $data
     * @param [type] $msg
     * @param [type] $state
     * @return void
     */
    public function renderJson($data, $msg, $state)
    {
        $res = [
            'state' => $state,
            'msg'  => $msg,
            'data' => $data,
        ];
        return $this->asJson($res);
    }
    
}
