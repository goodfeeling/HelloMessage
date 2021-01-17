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
                'only' => ['index', 'my-chat','chat-room','friend'],
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
    public function actionChatInterface()
    {
        return $this->render('chat-interface');
    }

    /**
     * 好友资料
     * @return string
     */
    public function actionFriend() {
        return $this->render('friend');
    }

    /**
     * 信息设置
     * @return string
     */
    public function actionInformationSetting() {
        return $this->render("information-setting");
    }


    /**
     * 我的聊天室
     * @return string
     */
    public function actionChatRoom() {
        return $this->render('chat-room');
    }

}