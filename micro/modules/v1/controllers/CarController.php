<?php
namespace micro\modules\v1\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

class CarController extends ActiveController
{
    public $modelClass = 'micro\modules\v1\models\Car';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function behaviors()
    {
        // remove rateLimiter which requires an authenticated user to work
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = ['class' => \sizeg\jwt\JwtHttpBearerAuth::class];
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }
}