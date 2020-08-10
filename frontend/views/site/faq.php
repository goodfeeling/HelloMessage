<?php
\common\services\StaticServices::includeAppJsStatic('@web/js/feedback/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

        <img src="fornt/img/sample/draw-4.png" alt="draw" class="img-fluid mb-4 mt-2">

        <div class="sectionTitle text-center mb-2">
            <div class="text-muted">Need Help?</div>
            <div class="title">
                <h1>Frequently Asked Questions</h1>
            </div>
        </div>

        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="heading1">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-dark" type="button" data-toggle="collapse"
                                data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Is this hybrid?
                            <i class="arrow icon ion-ios-arrow-down"></i>
                        </button>
                    </h2>
                </div>

                <div id="collapseOne" class="collapse" aria-labelledby="heading1" data-parent="#accordionExample">
                    <div class="card-body pt-1">
                        Yes, Bitter is hybrid ready HTML template. You can use it with Phonegap, Cordova or Webview
                        for mobile apps or you can use it directly PWA apps.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="heading2">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-dark collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            How can i buy it?
                            <i class="arrow icon ion-ios-arrow-down"></i>
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="heading2" data-parent="#accordionExample">
                    <div class="card-body pt-1">
                        You can buy it on themeforest.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="heading3">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-dark collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Is Bitter based on Bootstrap?
                            <i class="arrow icon ion-ios-arrow-down"></i>
                        </button>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="heading3"
                     data-parent="#accordionExample">
                    <div class="card-body pt-1">
                        Yes, Bitter using Bootstrap v4.4.1
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="heading4">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-dark collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Is this WordPress theme?
                            <i class="arrow icon ion-ios-arrow-down"></i>
                        </button>
                    </h2>
                </div>
                <div id="collapseFour" class="collapse" aria-labelledby="heading4"
                     data-parent="#accordionExample">
                    <div class="card-body pt-1">
                        No, Bitter is HTML, CSS, JS Template for Hybrid Apps which can be made by Phonegap, Cordova
                        or Webview.
                        You can use it for your PWA projects too.
                    </div>
                </div>
            </div>
        </div>

        <div class="mb-4 text-center">
            <div class="sectionTitle text-center mt-4">
                <div class="title">
                    <h1>Still have question?</h1>
                </div>
                <p class="mt-2 mb-3 text-center">Contact us if you still have questions.</p>
            </div>

            <button type="button" class="btn btn-primary btnGoLink">
                <i class="icon ion-ios-mail"></i>
                Contact Us
            </button>
        </div>

    </div>

</div>
<!-- appCapsule -->
