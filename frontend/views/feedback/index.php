<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '反馈';
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">

        <div class="sectionTitle mt-3 mb-2">
            <div class="title">
                <h1>提交意见</h1>
            </div>
            <div class="lead">请您填写以下信息</div>
        </div>

        <form class="mb-2">
            <div class="form-group">
                <input type="text" id="title" class="form-control" placeholder="标题">
            </div>
            <div class="form-group">
                <input type="email" id="email" class="form-control" placeholder="邮箱">
            </div>
            <div class="form-group">
                <textarea class="form-control" id="content" rows="3" placeholder="内容"></textarea>
            </div>
            <div>
                <button type="button" class="btn btn-primary btn-lg btn-block" id="submit">
                    <i class="icon ion-ios-send"></i>
                    提交
                </button>
            </div>
        </form>

        <div class="divider mt-4 mb-4"></div>

        <div class="card mb-2">
            <div class="card-body">
                <h5 class="card-title">地址</h5>
                <p class="card-text">
                    广州XX区XX大道
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
                            <div>
                                <img src="images/qq_connet.png" alt="123">
                            </div>
                        </div>
                        <div class="text">
                            <div>
                                <strong>929089994</strong>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- * listview -->
            </div>
        </div>
    </div>
</div>

<script>
    $('#submit').click(function(e) {
        var data = {
            'title': $('#title').val(),
            'email': $('#email').val(),
            'content': $('#content').val(),
        };
        $.ajax({
            url: 'index.php?r=site/apply',
            type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
            dataType: 'json',
            data: data,
            success: function(data) {
                console.log(data);
            }
        });
    });

</script>
