angular.module('cApp', [])
    .controller('comment', function ($scope, $http) {
        //配置
        $scope.count = 0;
        $scope.p_pernum = 10;
        //变量
        $scope.p_current = 1;
        $scope.p_all_page = 0;
        $scope.pages = [];

        $scope.sendData = function () {
            var form = new FormData();
            if (IDENTITY) {
                $.triggerModalBox('您还没登录！！','去登录', LOGIN);
                return false;
            }
            if (!angular.isDefined($scope.content)) {
                $.triggerModalBox('评论内容不能为空！');
                return false;
            }
            var msg = JSON.stringify($scope.content);
            form.append('content', msg);
            $.ajax({
                url: COMMENT + "&id=" + $.getUrlParam('id'),
                type: "POST",
                dataType: 'json',
                data: form,
                async: false, //异步
                processData: false, //很重要，告诉jquery不要对form进行处理
                contentType: false, //很重要，指定为false才能形成正确的Content-Type
                success: function(res) {
                    if (res.data.state == 100) {
                        $.triggerModalBox('您还没登录！！', '去登陆',LOGIN)
                    } else {
                        $scope.data = res.data;
                        $scope.content = null;
                        $.triggerModalBox(res.msg);
                    }
                }
            })
            // $http({
            //     method: 'POST',
            //     url: COMMENT + "&id=" + $.getUrlParam('id'),
            //     data: form,
            //     headers: {'Content-Type': undefined},
            //     transformRequest: angular.identity
            // }).then(function successCallback(response) {
            //     if (response.data.state == 100) {
            //         $.triggerModalBox('您还没登录！！', '去登陆',LOGIN)
            //     } else {
            //         $scope.data = response.data.data;
            //         $scope.content = null;
            //         $.triggerModalBox(response.data.msg);
            //     }
            //
            // }, function errorCallback(response) {
            //     $.triggerModalBox(response.data.msg);
            // });
        };
        //获取数据
        var _get = function (page, size, callback) {
            // 初始化数据
            $http({
                method: 'GET',
                url: COMMENT + "&page=" + page + "&size=" + size + "&id=" + $.getUrlParam('id'),
            }).then(function successCallback(response) {
                $scope.data = response.data.data;
                if (response.data.state == 0) {
                    $scope.count = $scope.data.count;
                    $scope.list = $scope.data.list;
                    $scope.p_current = page;
                    $scope.p_all_page = Math.ceil($scope.count / $scope.p_pernum);
                    reloadPno();
                    callback();
                } else {
                    $.triggerModalBox(response.data.msg);
                }
            }, function errorCallback(response) {
                $.triggerModalBox(response.data.msg);
            });
        }
        //初始化第一页
        _get($scope.p_current, $scope.p_pernum, function () {
            // alert("我是第一次加载");
        });

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