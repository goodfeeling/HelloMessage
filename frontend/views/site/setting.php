<?php
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '相关设置';
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">
    <div class="appContent">
        <div class="contentList">
            <div>
                <h6>夜间模式</h6>
            </div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch0">
                    <label class="custom-control-label" for="customSwitch0"></label>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>Notifications</div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch1">
                    <label class="custom-control-label" for="customSwitch1"></label>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>Vibration</div>
            <div>
                <a href="#">Only once</a>
            </div>
        </div>

        <div class="contentList">
            <div>Spam Filter</div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch11" checked />
                    <label class="custom-control-label" for="customSwitch11"></label>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>Manuel Filter</div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch12">
                    <label class="custom-control-label" for="customSwitch12"></label>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>
                <h6 class="mb-0">Alarm</h6>
                <p class="text-muted mb-0">Friday, 06:00 PM</p>
            </div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch2" checked />
                    <label class="custom-control-label" for="customSwitch2"></label>
                </div>
            </div>
        </div>
        <a href="#" class="btn btn-primary btn-lg btn-block mt-2">Save</a>
    </div>
</div>
<!-- appCapsule -->