<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$urlManager = Yii::$app->urlManager;
$identity = \Yii::$app->user->identity;

\common\services\StaticServices::includeAppJsStatic('@web/js/common/comment.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
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

    <nav class="mt-3">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item" ng-class="{true:'disabled'}[p_current==1]">
                <a class="page-link" href="javascript:void(0);" ng-click="p_index()">首页</a>
            </li>
            <li class="page-item" ng-repeat="page in pages" ng-class="{true:'active'}[p_current==page]">
                <a class="page-link" href="javascript:void(0);" ng-click="load_page(page)">{{ page }}</a>
            </li>
            <li class="page-item" ng-class="{true:'disabled'}[p_current==p_all_page]">
                <a class="page-link" href="javascript:void(0);" ng-click="p_last()">尾页</a>
            </li>
        </ul>
    </nav>
</div>