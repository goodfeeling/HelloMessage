<?php
namespace  common\services;

use Yii;

class StaticServices
{
    public static function includeAppStatic($type, $path, $option)
    {
        $release_version = defined("RELEASE_VERSION") ? RELEASE_VERSION : "20200731141600";
        $path = $path . "?ver={$release_version}";
        if ($type == "css") {
            Yii::$app->getView()->registerCssFile($path, $option);
        } else {
            Yii::$app->getView()->registerJsFile($path, $option);
        }
    }

    public static function includeAppJsStatic($path, $option)
    {
        self::includeAppStatic("js", $path, $option);
    }

    public static function includeAppCssStatic($path, $option)
    {
        self::includeAppStatic("css", $path, $option);
    }
}
