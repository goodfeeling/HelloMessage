<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '';
$urlManager = Yii::$app->urlManager;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">
        <div style="position: relative;z-index: 1">
            <img src="fornt/img/sample/photo3.jpg" alt="image" class="imageBlock img-fluid rounded">
            <div style="z-index: 999;position: absolute;float: none">
                <img src="fornt/img/sample/avatar.jpg" alt="image" class="imageBlock large rounded">
            </div>
        </div>

        <div class="card mt-2 mb-4">
            <div class="card-body">
                <h5 class="card-title">Card Content</h5>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lectus nulla. Quisque
                pharetra, diam eget tempor pharetra, nisl sem sollicitudin sem, vel finibus orci velit sit amet
                lorem. Nulla aliquet massa a metus tempor maximus.
            </div>
        </div>

        <div class="contentBox mb-4">
            <h3 class="title">Basic Content Box</h3>
            <div class="contentBox-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lectus nulla. Quisque
                pharetra, diam eget tempor pharetra, nisl sem sollicitudin sem, vel finibus orci velit sit amet
                lorem. Nulla aliquet massa a metus tempor maximus.
            </div>
        </div>

        <div class="contentBox long mb-4">
            <h5 class="title">Content Box Long</h5>
            <div class="contentBox-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lectus nulla. Quisque
                pharetra, diam eget tempor pharetra, nisl sem sollicitudin sem, vel finibus orci velit sit amet
                lorem. Nulla aliquet massa a metus tempor maximus.
            </div>
        </div>

        <div class="contentBox mb-4">
            <h1 class="title">Large</h1>
            <div class="contentBox-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lectus nulla. Quisque
                pharetra, diam eget tempor pharetra, nisl sem sollicitudin sem, vel finibus orci velit sit amet
                lorem. Nulla aliquet massa a metus tempor maximus.
            </div>
        </div>

        <div class="contentBox mb-2">
            <h4 class="title">Content Box with Image</h4>
            <img src="fornt/img/sample/photo4.jpg" alt="image" class="img-fluid mb-3">
            <div class="contentBox-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lectus nulla. Quisque
                pharetra, diam eget tempor pharetra, nisl sem sollicitudin sem, vel finibus orci velit sit amet
                lorem. Nulla aliquet massa a metus tempor maximus.
            </div>
        </div>


    </div>

    <!-- app Footer -->
    <footer class="appFooter">
        <div class="heading">Copyright © Bitter 2019. All Rights Reserved.</div>
        <p>
            Modern, simple and elegant design for mobile devices. Based on Bootstrap.
        </p>
        <!-- facebook -->
        <a href="#" class="btn btn-facebook btn-icon mr-1">
            <i class="icon ion-logo-facebook"></i>
        </a>
        <!-- twitter -->
        <a href="#" class="btn btn-twitter btn-icon mr-1">
            <i class="icon ion-logo-twitter"></i>
        </a>
        <!-- instagram -->
        <a href="#" class="btn btn-instagram btn-icon mr-1">
            <i class="icon ion-logo-instagram"></i>
        </a>
        <!-- linkedin -->
        <a href="#" class="btn btn-linkedin btn-icon mr-1">
            <i class="icon ion-logo-linkedin"></i>
        </a>
        <!-- whatsapp -->
        <a href="#" class="btn btn-whatsapp btn-icon mr-1">
            <i class="icon ion-logo-whatsapp"></i>
        </a>
    </footer>
    <!-- * app Footer -->

</div>
<!-- appCapsule -->