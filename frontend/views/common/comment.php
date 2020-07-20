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
    <div class="divider mt-3 mb-3"></div>

    <!-- submit -->
    <div class="form-group">
        <textarea class="form-control" rows="4" ng-model="content" placeholder="说点什么吧！"></textarea>
    </div>
    <button type="button" class="btn btn-primary btn-large btn-block" ng-click="sendData()">
        提交
    </button>
    <!-- * submit -->
    <div class="divider mt-3 mb-3"></div>

    <div class="comments">

        <div class="item" ng-repeat="item in data.list">
            <div class="image">
                <img src="{{item.avatar_url}}" alt="avatar" class="avatar">
            </div>
            <div class="content">
                <strong>{{item.nickname}}</strong>
                <div style="word-wrap: break-word;max-width: 250px" class="text">
                    {{item.content}}
                </div>
                <footer>{{item.addtime}}</footer>
            </div>
        </div>
    </div>


    <!-- * comments -->
    <!-- <nav class="mt-3">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav> -->
    <ul class="pagination" style="margin: 0px;">
        <li ng-class="{true:'disabled'}[p_current==1]"><a href="javascript:void(0);" ng-click="p_index()">首页</a></li>
        <li ng-repeat="page in pages" ng-class="{true:'active'}[p_current==page]"><a href="javascript:void(0);"
                                                                                     ng-click="load_page(page)">{{ page
                }}</a></li>
        <li ng-class="{true:'disabled'}[p_current==p_all_page]"><a href="javascript:void(0);" ng-click="p_last()">尾页</a>
        </li>
    </ul>

</div>

<script>
    angular.module('cApp', [])
        .controller('comment', function ($scope, $http) {

            // 初始化数据
            $http({

                method: 'GET',
                url: "<?= $urlManager->createUrl(['activity/comment']) ?>" +
                    "&id=<?= Yii::$app->request->getQueryParam('id') ?>",

            }).then(function successCallback(response) {

                $scope.data = response.data.data;

            }, function errorCallback(response) {

                $('.wx-bd').text(response.data.msg);
                $('.wx-main-btn').text("确定");
                $('#simpleDialog').fadeIn(200);

            });


            $scope.sendData = function () {
                var form = new FormData();
                if (!$scope.content || $scope.content == 'undefined' || $scope.content == 'null') {
                    $('.wx-bd').text('评论内容不能为空！');
                    $('.wx-main-btn').text("确定");
                    $('#simpleDialog').fadeIn(200);
                    return false;
                }

                var msg = JSON.stringify($scope.content);
                form.append('content', msg);

                $http({

                    method: 'POST',
                    url: "<?= $urlManager->createUrl(['activity/comment']) ?>" +
                        "&id=<?= Yii::$app->request->getQueryParam('id') ?>",
                    data: form,
                    headers: {
                        'Content-Type': undefined
                    },
                    transformRequest: angular.identity

                }).then(function successCallback(response) {

                    if (response.data.state == 100) {

                        $('.wx-bd').text(response.data.msg);
                        $('.wx-main-btn').text("去登陆");
                        $('.wx-main-btn').on('click', function (e) {
                            window.location.href = "<?= Url::toRoute('login/index', true) ?>";
                        });
                        $('#simpleDialog').fadeIn(200);

                    } else {
                        $scope.data = response.data.data;
                        $scope.content = null;
                    }

                }, function errorCallback(response) {

                    $('.wx-bd').text(response.data.msg);
                    $('.wx-main-btn').text("确定");
                    $('#simpleDialog').fadeIn(200);

                });
            };

            //配置
            $scope.count = 0;
            $scope.p_pernum = 10;
            //变量
            $scope.p_current = 1;
            $scope.p_all_page = 0;
            $scope.pages = [];
            //初始化第一页
            _get($scope.p_current, $scope.p_pernum, function () {
                alert("我是第一次加载");
            });
            //获取数据
            var _get = function (page, size, callback) {
                $http.get("xxx.html?status=0&page=" + page + "&size=" + size).success(function (res) {
                    if (res && res.status == 1) {
                        $scope.count = res.count;
                        $scope.list = res.list;
                        $scope.p_current = page;
                        $scope.p_all_page = Math.ceil($scope.count / $scope.p_pernum);
                        reloadPno();
                        callback();
                    } else {
                        alert("加载失败");
                    }
                });
            }

            //单选按钮选中
            $scope.select = function (id) {
                alert(id);
            }

            //首页
            $scope.p_index = function () {
                $scope.load_page(1);
            }

            //尾页
            $scope.p_last = function () {
                $scope.load_page($scope.p_all_page);
            }

            //加载某一页
            $scope.load_page = function (page) {
                _get(page, $scope.p_pernum, function () {
                });
            };

            //初始化页码
            var reloadPno = function () {
                $scope.pages = calculateIndexes($scope.p_current, $scope.p_all_page, 8);
            };

            //分页算法
            var calculateIndexes = function (current, length, displayLength) {
                var indexes = [];
                var start = Math.round(current - displayLength / 2);
                var end = Math.round(current + displayLength / 2);
                if (start <= 1) {
                    start = 1;
                    end = start + displayLength - 1;
                    if (end >= length - 1) {
                        end = length - 1;
                    }
                }
                if (end >= length - 1) {
                    end = length;
                    start = end - displayLength + 1;
                    if (start <= 1) {
                        start = 1;
                    }
                }
                for (var i = start; i <= end; i++) {
                    indexes.push(i);
                }
                return indexes;
            };

        });
</script>