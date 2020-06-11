<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '反馈';
?>

<div class="appContent">

    <div class="sectionTitle mt-3 mb-2">
        <div class="title">
            <h1>Get in Touch</h1>
        </div>
        <div class="lead">Fill the form to contact us</div>
    </div>

    <form class="mb-2">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Name">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" placeholder="E-mail">
        </div>
        <div class="form-group">
            <textarea class="form-control" rows="3" placeholder="Message"></textarea>
        </div>
        <div>
            <button type="button" class="btn btn-primary btn-lg btn-block">
                <i class="icon ion-ios-send"></i>
                Send
            </button>
        </div>
    </form>

    <div class="divider mt-4 mb-4"></div>

    <div class="card mb-2">
        <div class="card-body">
            <h5 class="card-title">Address</h5>
            <p class="card-text">
                PO Box 16122 Collins Street West<br>
                Victoria 8007 Australia
            </p>
        </div>
    </div>

    <div class="card listviewCard">
        <div class="card-body pt-1 pb-1">
            <!-- listview -->
            <div class="listView">
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success">
                            <i class="icon ion-ios-call"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>+1 984 225 00 00</strong>
                        </div>
                    </div>
                </a>

                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-primary">
                            <i class="icon ion-ios-mail"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>hello@domain.com</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-facebook">
                            <i class="icon ion-logo-facebook"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>Bitter</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-twitter">
                            <i class="icon ion-logo-twitter"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>BitterUI</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-instagram">
                            <i class="icon ion-logo-instagram"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>Bitter</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-linkedin">
                            <i class="icon ion-logo-linkedin"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>Bitter</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-twitch">
                            <i class="icon ion-logo-twitch"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>Bitter</strong>
                        </div>
                    </div>
                </a>
                <a href="#" class="listItem">
                    <div class="image">
                        <div class="iconBox bg-success bg-whatsapp">
                            <i class="icon ion-logo-whatsapp"></i>
                        </div>
                    </div>
                    <div class="text">
                        <div>
                            <strong>Send us a message</strong>
                        </div>
                    </div>
                </a>
            </div>
            <!-- * listview -->
        </div>
    </div>


</div>
