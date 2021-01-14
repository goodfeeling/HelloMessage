<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '个人动态';
$urlManager = Yii::$app->urlManager;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

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

</div>
<!-- appCapsule -->