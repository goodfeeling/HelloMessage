<?php

use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;
use common\utils\CommonFun;
use yii\helpers\Url;
use \backend\services\ActivityModelService;

use backend\models\ActivityModel;

$modelLabel = new \backend\models\ActivityModel();
?>

<?php $this->beginBlock('header');  ?>
<!-- <head></head>中代码块 -->
<?php $this->endBlock(); ?>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">

                <div class="box-header">
                    <h3 class="box-title">数据列表</h3>
                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <button id="create_btn" type="button" class="btn btn-xs btn-primary">添&nbsp;&emsp;加</button>
                            |
                            <button id="delete_btn" type="button" class="btn btn-xs btn-danger">批量删除</button>
                        </div>
                    </div>
                </div>
                <!-- /.box-header -->

                <div class="box-body">
                    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap table-responsive">
                        <!-- row start search-->
                        <div class="row">
                            <div class="col-sm-12">
                                <?php ActiveForm::begin(['id' => 'activity-search-form', 'method' => 'get', 'options' => ['class' => 'form-inline'], 'action' => Url::toRoute('activity/index')]); ?>

                                <div class="form-group" style="margin: 5px;">
                                    <label><?= $modelLabel->getAttributeLabel('id') ?>:</label>
                                    <input type="text" class="form-control" id="query[id]" name="query[id]" value="<?= isset($query["id"]) ? $query["id"] : "" ?>">
                                </div>
                                <div class="form-group">
                                    <a onclick="searchAction()" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>搜索</a>
                                </div>
                                <?php ActiveForm::end(); ?>
                            </div>
                        </div>
                        <!-- row end search -->

                        <!-- row start -->
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="data_table" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="data_table_info">
                                    <thead class="text-nowrap">
                                        <tr role="row">

                                            <?php
                                            $orderby = isset($_GET['orderby']) ? $_GET['orderby'] : '';
                                            echo '<th><input id="data_table_check" type="checkbox"></th>';
                                            echo '<th onclick="orderby(\'id\', \'desc\')" ' . CommonFun::sortClass($orderby, 'id') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('id') . '</th>';
                                            echo '<th onclick="orderby(\'name\', \'desc\')" ' . CommonFun::sortClass($orderby, 'name') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('name') . '</th>';
                                            echo '<th onclick="orderby(\'addtime\', \'desc\')" ' . CommonFun::sortClass($orderby, 'addtime') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('addtime') . '</th>';
                                            echo '<th onclick="orderby(\'endtime\', \'desc\')" ' . CommonFun::sortClass($orderby, 'endtime') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('endtime') . '</th>';
                                            echo '<th onclick="orderby(\'money\', \'desc\')" ' . CommonFun::sortClass($orderby, 'money') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('money') . '</th>';
                                            echo '<th onclick="orderby(\'describe\', \'desc\')" ' . CommonFun::sortClass($orderby, 'describe') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('describe') . '</th>';
                                            echo '<th onclick="orderby(\'theme\', \'desc\')" ' . CommonFun::sortClass($orderby, 'theme') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('theme') . '</th>';
                                            echo '<th onclick="orderby(\'join_number\', \'desc\')" ' . CommonFun::sortClass($orderby, 'join_number') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('join_number') . '</th>';
                                            echo '<th onclick="orderby(\'status\', \'desc\')" ' . CommonFun::sortClass($orderby, 'status') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('status') . '</th>';
                                            echo '<th onclick="orderby(\'keyword\', \'desc\')" ' . CommonFun::sortClass($orderby, 'keyword') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('keyword') . '</th>';
                                            echo '<th onclick="orderby(\'author_id\', \'desc\')" ' . CommonFun::sortClass($orderby, 'author_id') . ' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >' . $modelLabel->getAttributeLabel('author_id') . '</th>';
                                            echo '<th onclick="orderby(\'pic_url_id\', \'desc\')" '.CommonFun::sortClass($orderby, 'pic_url_id').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('pic_url_id').'</th>';
                                            echo '<th onclick="orderby(\'views\', \'desc\')" '.CommonFun::sortClass($orderby, 'views').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('views').'</th>';

                                            ?>

                                            <th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php
                                        foreach ($models as $model) {
                                            echo '<tr id="rowid_' . $model->id . '">';
                                            echo '  <td><label><input type="checkbox" value="' . $model->id . '"></label></td>';
                                            echo '  <td>' . $model->id . '</td>';
                                            echo '  <td>' . $model->name . '</td>';
                                            echo '  <td>' . $model->addtime . '</td>';
                                            echo '  <td>' . $model->endtime . '</td>';
                                            echo '  <td>' . $model->money . '</td>';
                                            echo '  <td>' . '....' . '</td>';
                                            echo '  <td>' . $model->theme . '</td>';
                                            echo '  <td>' . $model->join_number . '</td>';
                                            echo '  <td>' . $model->status . '</td>';
                                            echo '  <td>' . $model->keyword . '</td>';
                                            echo '  <td>' . $model->author_id . '</td>';
                                            echo '  <td>' . $model->pic_url_id . '</td>';
                                            echo '  <td>' . $model->views . '</td>';
                                            echo '  <td class="center">';
                                            echo '      <a id="view_btn" onclick="viewAction(' . $model->id . ')" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>查看</a>';
                                            echo '      <a id="edit_btn" onclick="editAction(' . $model->id . ')" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-edit icon-white"></i>修改</a>';
                                            echo '      <a id="delete_btn" onclick="deleteAction(' . $model->id . ')" class="btn btn-danger btn-sm" href="#"> <i class="glyphicon glyphicon-trash icon-white"></i>删除</a>';
                                            echo '  </td>';
                                            echo '</tr>';
                                        }

                                        ?>



                                    </tbody>
                                    <!-- <tfoot></tfoot> -->
                                </table>
                            </div>
                        </div>
                        <!-- row end -->

                        <!-- row start -->
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="dataTables_info" id="data_table_info" role="status" aria-live="polite">
                                    <div class="infos">
                                        从<?= $pages->getPage() * $pages->getPageSize() + 1 ?> 到 <?= ($pageCount = ($pages->getPage() + 1) * $pages->getPageSize()) < $pages->totalCount ?  $pageCount : $pages->totalCount ?> 共 <?= $pages->totalCount ?> 条记录</div>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="data_table_paginate">
                                    <?= LinkPager::widget([
                                        'pagination' => $pages,
                                        'nextPageLabel' => '»',
                                        'prevPageLabel' => '«',
                                        'firstPageLabel' => '首页',
                                        'lastPageLabel' => '尾页',
                                    ]); ?>

                                </div>
                            </div>
                        </div>
                        <!-- row end -->
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

<div class="modal fade" id="edit_dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>设置</h3>
            </div>
            <div class="modal-body">
                <?php $form = ActiveForm::begin(["id" => "activity-form", "class" => "form-horizontal", "action" => Url::toRoute("activity/save")]); ?>

                <input type="hidden" class="form-control" id="id" name="id" />

                <div id="name_div" class="form-group">
                    <label for="name" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("name") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="ActivityModel[name]" placeholder="必填" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="addtime_div" class="form-group">
                    <label for="addtime" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("addtime") ?></label>
                    <div class="col-sm-10">
                        <input type="datetime-local" class="form-control" id="addtime" name="ActivityModel[addtime]" value="123" placeholder="yyyy-mm-dd hh:mm:ss" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="endtime_div" class="form-group">
                    <label for="endtime" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("endtime") ?></label>
                    <div class="col-sm-10">
                        <input type="datetime-local" class="form-control" id="endtime" name="ActivityModel[endtime]" placeholder="yyyy-mm-dd hh:mm:ss" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="money_div" class="form-group">
                    <label for="money" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("money") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="money" name="ActivityModel[money]" placeholder="男生|女生 100|20" />
                    </div>
                    <div class="clearfix"></div>
                </div>


                <div id="describe_div" class="form-group">
                    <label for="describe" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("describe") ?></label>
                    <div class="col-sm-10" id='describe-insert'>
                        <textarea id="describe" name="ActivityModel[describe]" placeholder="">
                 </textarea>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="theme_div" class="form-group">
                    <label for="theme" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("theme") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="theme" name="ActivityModel[theme]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="join_number_div" class="form-group">
                    <label for="join_number" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("join_number") ?></label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="join_number" name="ActivityModel[join_number]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>


                <div id="status_div" class="form-group">
                    <label for="status" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("status") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="status" name="ActivityModel[status]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="status_div" class="form-group">
                    <label for="status" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("status")?></label>
                    <div class="col-sm-10">
                        <select class="form-control" name="ActivityModel[status]" id="status">
                            <?php
                            foreach(ActivityModelService::$STATUS_CODE as $key=>$value){
                                echo "<option value=\"{$key}\">{$value}</option>";
                            }
                            ?>

                        </select>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="keyword_div" class="form-group">
                    <label for="keyword" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("keyword") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="keyword" name="ActivityModel[keyword]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div id="author_id_div" class="form-group">
                    <label for="author_id" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("author_id") ?></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="author_id" name="ActivityModel[author_id]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                
                <div id="pic_url_id_div" class="form-group">
              <label for="pic_url_id" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("pic_url_id")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="pic_url_id" name="ActivityModel[pic_url_id]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>
                <div id="views_div" class="form-group">
                    <label for="views" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("views") ?></label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="views" name="ActivityModel[views]" placeholder="" />
                    </div>
                    <div class="clearfix"></div>
                </div>


                <?php ActiveForm::end(); ?>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a> <a id="edit_dialog_ok" href="#" class="btn btn-primary">确定</a>
            </div>
        </div>
    </div>
</div>
<?php $this->beginBlock('footer');  ?>
<!-- <body></body>后代码块 -->
<script>
    var is_exit = false;
    var option = {
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": true, //Button to insert an image. Default true,
        "color": true, //Button to change color of font
    }

    function orderby(field, op) {
        var url = window.location.search;
        var optemp = field + " desc";
        if (url.indexOf('orderby') != -1) {
            url = url.replace(/orderby=([^&?]*)/ig, function($0, $1) {
                var optemp = field + " desc";
                optemp = decodeURI($1) != optemp ? optemp : field + " asc";
                return "orderby=" + optemp;
            });
        } else {
            if (url.indexOf('?') != -1) {
                url = url + "&orderby=" + encodeURI(optemp);
            } else {
                url = url + "?orderby=" + encodeURI(optemp);
            }
        }
        window.location.href = url;
    }

    function searchAction() {
        $('#activity-search-form').submit();
    }

    function viewAction(id) {
        initModel(id, 'view', 'fun');
    }

    function initEditSystemModule(data, type) {
        $('#describe')
            .wysihtml5(option);

        if (type == 'create') {
            $("#id").val("");
            $("#name").val("");
            $("#addtime").val("");
            $("#endtime").val("");
            $("#money").val("");
            $("#describe").val("");
            $("#theme").val("");
            $("#join_number").val("");
            $("#status").val("");
            $("#keyword").val("");
            $("#author_id").val("");
            $("#pic_url_id").val("");
            $("#views").val("");
        } else {

            $("#id").val(data.id)
            $("#name").val(data.name)
            $("#addtime").val(data.addtime.split(' ').join("T"))
            $("#endtime").val(data.endtime.split(' ').join("T"))
            $("#money").val(data.money)
            $("#describe").val(data.describe);
            $("#theme").val(data.theme)
            $("#join_number").val(data.join_number)
            $("#status").val(data.status)
            $("#keyword").val(data.keyword)
            $("#author_id").val(data.author_id)
            $("#pic_url_id").val(data.pic_url_id)
            $("#views").val(data.views)
        }
        if (type == "view") {
            $("#id").attr({
                readonly: true,
                disabled: true
            });
            $("#name").attr({
                readonly: true,
                disabled: true
            });
            $("#addtime").attr({
                readonly: true,
                disabled: true
            });
            $("#endtime").attr({
                readonly: true,
                disabled: true
            });
            $("#money").attr({
                readonly: true,
                disabled: true
            });
            $("#describe").attr({
                readonly: true,
                disabled: true
            });
            $("#theme").attr({
                readonly: true,
                disabled: true
            });
            $("#join_number").attr({
                readonly: true,
                disabled: true
            });
            $("#status").attr({
                readonly: true,
                disabled: true
            });
            $("#keyword").attr({
                readonly: true,
                disabled: true
            });
            $("#author_id").attr({
                readonly: true,
                disabled: true
            });
            $("#pic_url_id").attr({readonly:true,disabled:true});
            $("#views").attr({readonly:true,disabled:true});
            $('#edit_dialog_ok').addClass('hidden');

        } else {
            $("#id").attr({
                readonly: false,
                disabled: false
            });
            $("#name").attr({
                readonly: false,
                disabled: false
            });
            $("#addtime").attr({
                readonly: false,
                disabled: false
            });
            $("#endtime").attr({
                readonly: false,
                disabled: false
            });
            $("#money").attr({
                readonly: false,
                disabled: false
            });
            $("#describe").attr({
                readonly: false,
                disabled: false
            });
            $("#theme").attr({
                readonly: false,
                disabled: false
            });
            $("#join_number").attr({
                readonly: false,
                disabled: false
            });
            $("#status").attr({
                readonly: false,
                disabled: false
            });
            $("#keyword").attr({
                readonly: false,
                disabled: false
            });
            $("#author_id").attr({
                readonly: false,
                disabled: false
            });
            $("#pic_url_id").attr({readonly:false,disabled:false});
            $("#views").attr({readonly:false,disabled:false});
            $('#edit_dialog_ok').removeClass('hidden');
        }
        $('#edit_dialog').modal('show');
    }

    function initModel(id, type, fun) {

        $.ajax({
            type: "GET",
            url: "<?= Url::toRoute('activity/view') ?>",
            data: {
                "id": id
            },
            cache: false,
            dataType: "json",
            error: function(xmlHttpRequest, textStatus, errorThrown) {
                alert("出错了，" + textStatus);
            },
            success: function(data) {
                initEditSystemModule(data, type);

                ////////////////////////////////////////
            }
        });
    }

    function editAction(id) {
        initModel(id, 'edit');
    }

    function deleteAction(id) {
        var ids = [];
        if (!!id == true) {
            ids[0] = id;
        } else {
            var checkboxs = $('#data_table :checked');
            if (checkboxs.size() > 0) {
                var c = 0;
                for (i = 0; i < checkboxs.size(); i++) {
                    var id = checkboxs.eq(i).val();
                    if (id != "") {
                        ids[c++] = id;
                    }
                }
            }
        }
        if (ids.length > 0) {
            admin_tool.confirm('请确认是否删除', function() {
                $.ajax({
                    type: "GET",
                    url: "<?= Url::toRoute('activity/delete') ?>",
                    data: {
                        "ids": ids
                    },
                    cache: false,
                    dataType: "json",
                    error: function(xmlHttpRequest, textStatus, errorThrown) {
                        admin_tool.alert('msg_info', '出错了，' + textStatus, 'warning');
                    },
                    success: function(data) {
                        for (i = 0; i < ids.length; i++) {
                            $('#rowid_' + ids[i]).remove();
                        }
                        admin_tool.alert('msg_info', '删除成功', 'success');
                        window.location.reload();
                    }
                });
            });
        } else {
            admin_tool.alert('msg_info', '请先选择要删除的数据', 'warning');
        }

    }

    function getSelectedIdValues(formId) {
        var value = "";
        $(formId + " :checked").each(function(i) {
            if (!this.checked) {
                return true;
            }
            value += this.value;
            if (i != $("input[name='id']").size() - 1) {
                value += ",";
            }
        });
        return value;
    }

    $('#edit_dialog_ok').click(function(e) {
        e.preventDefault();
        $('#activity-form').submit();
    });

    $('#create_btn').click(function(e) {
        e.preventDefault();
        initEditSystemModule({}, 'create');
    });

    $('#delete_btn').click(function(e) {
        e.preventDefault();
        deleteAction('');
    });

    $('#activity-form').bind('submit', function(e) {
        e.preventDefault();
        var id = $("#id").val();
        var action = id == "" ? "<?= Url::toRoute('activity/create') ?>" : "<?= Url::toRoute('activity/update') ?>";
        $(this).ajaxSubmit({
            type: "post",
            dataType: "json",
            url: action,
            success: function(value) {
                if (value.errno == 0) {
                    $('#edit_dialog').modal('hide');
                    admin_tool.alert('msg_info', '添加成功', 'success');
                    window.location.reload();
                } else {
                    var json = value.data;
                    for (var key in json) {
                        $('#' + key).attr({
                            'data-placement': 'bottom',
                            'data-content': json[key],
                            'data-toggle': 'popover'
                        }).addClass('popover-show').popover('show');

                    }
                }

            }
        });
    });

    $('.close').on('click', function(e) {
        $('#describe-insert').html('<textarea id="describe" name="ActivityModel[describe]" placeholder=""></textarea>');
    })
</script>

<?php $this->endBlock(); ?>