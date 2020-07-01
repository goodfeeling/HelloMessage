<?php

use yii\helpers\Url;

/* @var $this yii\web\View */
$urlManager = Yii::$app->urlManager;
?>
<script src="https://cdn.bootcdn.net/ajax/libs/angular.js/1.7.9/angular.min.js"></script>

<div ng-app="cApp" ng-controller="comment">
    <!-- comments -->
    <div class="sectionTitle mb-2">
        <div class="title">
            <h1>评论 <small>{{data.count}}</small></h1>
        </div>
    </div>

    <div class="comments">

        <div class="item" ng-repeat="item in data.list">
            <div class="image">
                <img src="{{item.avatar_url}}" alt="avatar" class="avatar">
            </div>
            <div class="content">
                <strong>ccc</strong>
                <div class="text">
                    {{item.content}}
                </div>
                <footer>{{item.addtime}}</footer>
            </div>
        </div>

    </div>
    <!-- * comments -->

    <div class="divider mt-3 mb-3"></div>

    <!-- submit -->
    <div class="form-group">
        <textarea class="form-control" rows="4" ng-model="content" placeholder="说点什么吧！"></textarea>
    </div>
    <button type="button" class="btn btn-primary btn-large btn-block" ng-click="sendData()">
        提交
    </button>
    <!-- * submit -->
</div>

<script>
    angular.module('cApp', [])
        .controller('comment', function ($scope, $http, $window) {
            // 初始化数据
            $http({
                method: 'GET',
                url: "<?= $urlManager->createUrl(['activity/comment']) ?>"
                    +"&id=<?= Yii::$app->request->getQueryParam('id') ?>",
            }).then(function successCallback(response) {
                $scope.data = response.data.data;
            }, function errorCallback(response) {
                $('.wx-bd').text(response.data.msg);
                $('.wx-main-btn').text("确定");
                $('#simpleDialog').fadeIn(200);
            });


            $scope.sendData = function () {
                // 创建一个表单对象
                var form = new FormData();
                var msg = JSON.stringify($scope.content);
                form.append('msg', msg);
                // 发送ajax请求
                $http({
                    method: 'POST',
                    url: "<?= $urlManager->createUrl(['activity/comment']) ?>"
                        +"&id=<?= Yii::$app->request->getQueryParam('id') ?>",
                    data: form,
                    headers: { 'Content-Type': undefined },
                    transformRequest: angular.identity
                }).then(function successCallback(response) {
                    if (response.data.state == 100) {
                        $('.wx-bd').text(response.data.msg);
                        $('.wx-main-btn').text("去登陆");
                        $('.wx-main-btn').on('click',function(e){
                            window.location.href = "<?= Url::toRoute('login/index', true) ?>";
                        });
                        $('#simpleDialog').fadeIn(200);
                    }else {
                        $('.wx-bd').text(response.data.msg);
                        $('.wx-main-btn').text("确定");
                        $('#simpleDialog').fadeIn(200);
                    }
                    // $window.location.reload();
                }, function errorCallback(response) {
                    $('.wx-bd').text(response.data.msg);
                    $('.wx-main-btn').text("确定");
                    $('#simpleDialog').fadeIn(200);
                });
            };
        });
</script>