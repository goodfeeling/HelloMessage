<?php
use yii\helpers\Url;
use \common\services\StaticServices;
/* @var $this yii\web\View */

$this->title = '我的收藏';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/collect/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

        <div class="card mb-1">
            <div class="card-body">

                <div class="accordion styled" id="accordionExample2">
                    <div class="card">
                        <div class="card-header" id="headingOne2">
                            <h2 class="mb-0">
                                <button class="btn btn-primary" type="button" data-toggle="collapse"
                                        data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                                    <i class="icon ion-ios-boat"></i>
                                    Ship
                                    <i class="arrow icon ion-ios-arrow-down"></i>
                                </button>
                            </h2>
                        </div>

                        <div id="collapseOne2" class="collapse" aria-labelledby="headingOne2"
                             data-parent="#accordionExample2">
                            <div class="card-body">
                                <!-- listview -->
                                <div class="listView iconed">
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-boat"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Boats</strong>
                                                <div class="text-muted">
                                                    52 models
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-bicycle"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Roadmap</strong>
                                                <div class="text-muted">
                                                    52.249 miles
                                                </div>
                                            </div>
                                        </div>
                                    </a>

                                </div>
                                <!-- * listview -->
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTwo2">
                            <h2 class="mb-0">
                                <button class="btn btn-danger collapsed" type="button" data-toggle="collapse"
                                        data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
                                    <i class="icon ion-ios-car"></i>
                                    Car
                                    <i class="arrow icon ion-ios-arrow-down"></i>
                                </button>
                            </h2>
                        </div>
                        <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2"
                             data-parent="#accordionExample2">
                            <div class="card-body">
                                <div class="listView iconed">
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-body"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Activity</strong>
                                            <div class="text-muted">
                                                592 cal
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-battery-full"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Battery Status</strong>
                                            <div class="text-muted">
                                                %29
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-microphone"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Records</strong>
                                            <div class="text-muted">
                                                50 items
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingThree2">
                            <h2 class="mb-0">
                                <button class="btn btn-success collapsed" type="button" data-toggle="collapse"
                                        data-target="#collapseThree2" aria-expanded="false"
                                        aria-controls="collapseThree2">
                                    <i class="icon ion-ios-airplane"></i>
                                    Plane
                                    <i class="arrow icon ion-ios-arrow-down"></i>
                                </button>
                            </h2>
                        </div>
                        <div id="collapseThree2" class="collapse" aria-labelledby="headingThree2"
                             data-parent="#accordionExample2">
                            <div class="card-body">
                                <div class="listView iconed">
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-pulse"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Health</strong>
                                            <div class="text-muted">
                                                Good
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-shirt"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Clothes</strong>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-stats"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Stats</strong>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-alarm"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Alarms</strong>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="listItem">
                                    <div class="iconBox">
                                        <i class="icon ion-ios-cart"></i>
                                    </div>
                                    <div class="text">
                                        <div>
                                            <strong>Cart</strong>
                                        </div>
                                    </div>
                                </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-pulse"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Health</strong>
                                                <div class="text-muted">
                                                    Good
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-shirt"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Clothes</strong>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-stats"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Stats</strong>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-alarm"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Alarms</strong>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#" class="listItem">
                                        <div class="iconBox">
                                            <i class="icon ion-ios-cart"></i>
                                        </div>
                                        <div class="text">
                                            <div>
                                                <strong>Cart</strong>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- appCapsule -->