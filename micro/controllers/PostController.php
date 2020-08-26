<?php

namespace micro\controllers;


use yii\filters\RateLimiter;

class PostController extends BaseController
{
    public $modelClass = 'micro\models\Post';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = ['class' => \sizeg\jwt\JwtHttpBearerAuth::class];
        return $behaviors;
    }
}