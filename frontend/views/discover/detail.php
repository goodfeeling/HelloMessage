<?php

use yii\helpers\Url;

?>
<!-- App Capsule -->
<div id="appCapsule">
    <div class="appContent">
        <!-- post -->
        <div class="photoPost mt-1">
            <header>
                <div class="user">
                    <a href="social-profile.html">
                        <img src="assets/img/sample/avatar6.jpg" alt="avatar" class="avatar">
                        <strong>Diego Esteve</strong>
                    </a>
                </div>
                <div class="right">
                    <div class="lead">5 mins ago</div>
                </div>
            </header>
            <div class="image">
                <img src="assets/img/sample/photo4.jpg" alt="photo" class="img-fluid">
            </div>
            <footer class="row">
                <div class="col-8">
                    <button class="btn btn-sm mr-2"><i class="icon ion-ios-heart text-danger"></i>35</button>
                    <button class="btn btn-sm"><i class="icon ion-ios-text text-primary"></i>210</button>
                </div>
                <div class="col-4 text-right">
                    <button class="btn btn-sm mr-2"><i class="icon ion-ios-bookmark text-secondary"></i></button>
                    <button class="btn btn-sm"><i class="icon ion-ios-share-alt text-secondary"></i></button>
                </div>
            </footer>
        </div>
        <!-- post -->
        <!-- comments -->
        <div class="comments">
            <div class="item">
                <div class="image">
                    <img src="assets/img/sample/avatar5.jpg" alt="avatar" class="avatar">
                </div>
                <div class="content">
                    <strong>Juan Morata</strong>
                    <div class="text">
                        Duis interdum suscipit ullamcorper.
                    </div>
                    <footer>25 Sep 2019</footer>
                </div>
            </div>
            <div class="item">
                <div class="image">
                    <img src="assets/img/sample/avatar4.jpg" alt="avatar" class="avatar">
                </div>
                <div class="content">
                    <strong>Niek Gaspar</strong>
                    <div class="text">
                        Sed commodo lorem ut dui lacinia vulputate. Proin vulputate turpis lacus, laoreet tincidunt
                        turpis ornare ac. Sed eu felis auctor, tristique tortor sed, bibendum risus.
                    </div>
                    <footer>25 Sep 2019</footer>
                </div>
            </div>
        </div>
        <!-- * comments -->
        <div class="divider mt-3 mb-3"></div>
        <!-- form -->
        <form>
            <div class="form-group">
                <textarea class="form-control" rows="4" placeholder="Write a comment..."></textarea>
            </div>
            <button type="button" class="btn btn-primary btn-large btn-block">
                SEND
            </button>
        </form>
        <!-- * form -->
    </div>
</div>
<!-- appCapsule -->