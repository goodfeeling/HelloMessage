<?php

$this->title = 'Juli';
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent pt-2">

        <div class="chatItem">
            <img src="fornt/img/sample/avatar6.jpg" alt="avatar" class="avatar">
            <div class="content">
                <div class="bubble">
                    Hey John, can we talk soon?
                </div>
                <footer>6 mins ago</footer>
            </div>
        </div>

        <div class="chatItem user">
            <div class="content">
                <div class="bubble">
                    Sure Will.
                </div>
            </div>
        </div>

        <div class="chatItem user">
            <div class="content">
                <div class="bubble">
                    About what?
                </div>
                <footer>5 mins ago</footer>
            </div>
        </div>

        <div class="chatItem">
            <img src="fornt/img/sample/avatar6.jpg" alt="avatar" class="avatar">
            <div class="content">
                <div class="bubble">
                    <img src="fornt/img/sample/photo3.jpg" alt="image" class="imageBlock xlarge rounded">
                </div>
                <footer>2 mins ago</footer>
            </div>
        </div>


        <div class="chatItem">
            <img src="fornt/img/sample/avatar6.jpg" alt="avatar" class="avatar">
            <div class="content">
                <div class="bubble">
                    Can you help me about photoshop?
                </div>
                <footer>1 mins ago</footer>
            </div>
        </div>

        <div class="chatFooter">
            <div class="leftButton">
                <button type="button" class="btn btn-secondary btn-icon">
                    <i class="icon ion-ios-camera"></i>
                </button>
            </div>
            <form class="formArea">
                <input type="text" class="form-control">
                <button type="button" class="btn btn-primary btn-icon">
                    <i class="icon ion-ios-send"></i>
                </button>
            </form>
        </div>

    </div>

</div>
<!-- appCapsule -->
