<?php


namespace frontend\controllers;

use yii\filters\AccessControl;

/**
 * Class ChatController
 * @package frontend\controllers
 */
class ChatController extends BaseController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'my-chat'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
                'denyCallback' => function ($rule, $action) {
                    return $this->redirect(['login/index']);
                }
            ],
        ];
    }

    /**
     * chat page
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * address list
     * @return string
     */
    public function actionMyChat()
    {
        return $this->render('my-chat');
    }

    public function actionFriend() {
        return $this->render('friend');
    }

    public function actionInformationSetting() {
        return $this->render("information-setting");
    }

}