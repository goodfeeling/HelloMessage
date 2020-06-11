<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '反馈';
?>

<div class="appContent pb-0">

    <img src="fornt/img/sample/draw-2.png" alt="img" class="img-fluid mt-3 mb-3">

    <div class="sectionTitle text-center">
        <div class="title">
            <h1>Join Us Now!</h1>
        </div>
        <div class="lead mb-3">Sign up to join</div>
    </div>

    <form action="index.html">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Name">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" placeholder="E-mail">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password">
        </div>
        <div>
            <button type="submit" class="btn btn-primary btn-lg btn-block">
                Sign up
            </button>
        </div>
    </form>

</div>