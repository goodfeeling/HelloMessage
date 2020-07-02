<?php


namespace frontend\controllers;


use frontend\models\AdminUserDetail;

class UserInfoController extends BaseController
{
    public function actionIndex()
    {
        $request = \Yii::$app->request;
        $form = new AdminUserDetail();
//        $form->uid = $this->userData['id'];
        $form->uid = 159;
        if($request->isPost) {
            if (empty($this->userData)) {
                return $this->asJson([
                    'msg' => '您需要登陆！',
                    'state' => 100,
                    'data' => null,
                ]);
            }
        }else {
            $res = $form->getUserData();
            return $this->render('index',[
                'data'=>$res
            ]);
        }
    }

}