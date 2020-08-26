<?php

$params = array_merge(
    require(__DIR__ . '/../common/config/params.php'),
    require(__DIR__ . '/config/params.php')
);

return [
    'id' => 'micro-app',
    // the basePath of the application will be the `micro-app` directory
    'basePath' => __DIR__,
    // this is where the application will find all controllers
    'controllerNamespace' => 'micro\controllers',
    // set an alias to enable autoloading of classes from the 'micro' namespace
    'aliases' => [
        '@micro' => __DIR__,
    ],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User', // User must implement the IdentityInterface
            'enableSession' => false,
            'loginUrl' => 'www.baidu.com',
            // ...
        ],
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '123123123',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        'response' => [
            // ...
            'formatters' => [
                \yii\web\Response::FORMAT_JSON => [
                    'class' => 'yii\web\JsonResponseFormatter',
                    'prettyPrint' => YII_DEBUG, // use "pretty" output in debug mode
                    'encodeOptions' => JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE,
                    // ...
                ],
            ],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['post']
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['v1/car']
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['v2/car']
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['user'],
                    'pluralize' => false,
                    'extraPatterns'=>['POST login'=>'login'],
                    'only'=>['login'],
                ],
            ],
        ],
        'jwt' => [
            'class' => \sizeg\jwt\Jwt::class,
            'key' => 'secret',
            // You have to configure ValidationData informing all claims you want to validate the token.
            'jwtValidationData' => \micro\components\JwtValidationData::class,
        ],
    ],
    'modules' => [
        'v1' => [
            'class' => 'micro\modules\v1\Module',
        ],
        'v2' => [
            'class' => 'micro\modules\v2\Module',
        ],
    ],
    'params' => $params,
];