<?php


namespace backend\services;


use backend\models\ActivityModel;

class ActivityModelService extends ActivityModel
{
    public static $STATUS_USABLE = 1;//通过
    public static $STATUS_CODE = array(
        '0'=>'未审核',
        '1'=>'通过',
        '2'=>'禁用',
    );
}