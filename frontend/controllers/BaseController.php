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

/**
 * Class BaseController
 * @package frontend\controllers
 */
class BaseController extends Controller
{
    /**
     * BaseController constructor.
     * @param $id
     * @param $module
     * @param array $config
     */
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
     * @param $url
     * @param $param
     * @return string
     */
    public function renderJS($url, $param)
    {
        return $this->renderPartial($url, $param);
    }
}
