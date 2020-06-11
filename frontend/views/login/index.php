<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '反馈';
?>


<div class="appContent">


    <div class="sectionTitle text-center mt-3">
        <div class="title">
            <h1>Welcome Back</h1>
        </div>
        <div class="lead mb-2">Sign in to continue</div>
    </div>

    <form action="index.html">
        <div class="form-group">
            <input type="email" class="form-control" placeholder="E-mail">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group row mt-3 mb-3">
            <div class="col-6">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="remember" />
                    <label class="custom-control-label text-muted" for="remember">Remember me</label>
                </div>
            </div>
            <div class="col-6 text-right">
                <a href="page-forgot-password.html" class="text-muted">Forgot password?</a>
            </div>
        </div>
        <div>
            <button type="submit" class="btn btn-primary btn-lg btn-block">
                Sign in
            </button>
        </div>
    </form>
    <div class="divider mt-3 mb-3"></div>

    <div class="text-muted text-center mb-2">or login with</div>
    <div class="row">
        <div class="col-6">
            <button type="button" class="btn btn-facebook btn-block">
                <i class="icon ion-logo-facebook"></i>
                Facebook
            </button>
        </div>
        <div class="col-6">
            <button type="button" class="btn btn-twitter btn-block">
                <i class="icon ion-logo-twitter"></i>
                Twitter
            </button>
        </div>
    </div>


</div>
