
<?php
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;
use common\utils\CommonFun;
use yii\helpers\Url;

use backend\models\WechatConfigModel;

$modelLabel = new \backend\models\WechatConfigModel();
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
                <?php ActiveForm::begin(['id' => 'wechat-config-search-form', 'method'=>'get', 'options' => ['class' => 'form-inline'], 'action'=>Url::toRoute('wechat-config/index')]); ?>     
                
                  <div class="form-group" style="margin: 5px;">
                      <label><?=$modelLabel->getAttributeLabel('id')?>:</label>
                      <input type="text" class="form-control" id="query[id]" name="query[id]"  value="<?=isset($query["id"]) ? $query["id"] : "" ?>">
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
              echo '<th onclick="orderby(\'id\', \'desc\')" '.CommonFun::sortClass($orderby, 'id').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('id').'</th>';
              echo '<th onclick="orderby(\'app_id\', \'desc\')" '.CommonFun::sortClass($orderby, 'app_id').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('app_id').'</th>';
              echo '<th onclick="orderby(\'app_secret\', \'desc\')" '.CommonFun::sortClass($orderby, 'app_secret').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('app_secret').'</th>';
              echo '<th onclick="orderby(\'mch_id\', \'desc\')" '.CommonFun::sortClass($orderby, 'mch_id').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('mch_id').'</th>';
              echo '<th onclick="orderby(\'key\', \'desc\')" '.CommonFun::sortClass($orderby, 'key').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('key').'</th>';
              echo '<th onclick="orderby(\'cert_pem\', \'desc\')" '.CommonFun::sortClass($orderby, 'cert_pem').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('cert_pem').'</th>';
              echo '<th onclick="orderby(\'key_pem\', \'desc\')" '.CommonFun::sortClass($orderby, 'key_pem').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('key_pem').'</th>';
              echo '<th onclick="orderby(\'encodingaeskey\', \'desc\')" '.CommonFun::sortClass($orderby, 'encodingaeskey').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('encodingaeskey').'</th>';
         
			?>
	
            <th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >操作</th>
            </tr>
            </thead>
            <tbody>
            
            <?php
            foreach ($models as $model) {
                echo '<tr id="rowid_' . $model->id . '">';
                echo '  <td><label><input type="checkbox" value="' . $model->id . '"></label></td>';
                echo '  <td>' . $model->id . '</td>';
                echo '  <td>' . $model->app_id . '</td>';
                echo '  <td>' . $model->app_secret . '</td>';
                echo '  <td>' . $model->mch_id . '</td>';
                echo '  <td>' . $model->key . '</td>';
                echo '  <td>' . $model->cert_pem . '</td>';
                echo '  <td>' . $model->key_pem . '</td>';
                echo '  <td>' . $model->encodingaeskey . '</td>';
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
            		从<?= $pages->getPage() * $pages->getPageSize() + 1 ?>            		到 <?= ($pageCount = ($pages->getPage() + 1) * $pages->getPageSize()) < $pages->totalCount ?  $pageCount : $pages->totalCount?>            		 共 <?= $pages->totalCount?> 条记录</div>
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

<div class="modal fade" id="edit_dialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
                <?php $form = ActiveForm::begin(["id" => "wechat-config-form", "class"=>"form-horizontal", "action"=>Url::toRoute("wechat-config/save")]); ?>                      
                 
          <input type="hidden" class="form-control" id="id" name="id" />

          <div id="app_id_div" class="form-group">
              <label for="app_id" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("app_id")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="app_id" name="WechatConfigModel[app_id]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="app_secret_div" class="form-group">
              <label for="app_secret" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("app_secret")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="app_secret" name="WechatConfigModel[app_secret]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="mch_id_div" class="form-group">
              <label for="mch_id" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("mch_id")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="mch_id" name="WechatConfigModel[mch_id]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="key_div" class="form-group">
              <label for="key" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("key")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="key" name="WechatConfigModel[key]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="cert_pem_div" class="form-group">
              <label for="cert_pem" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("cert_pem")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="cert_pem" name="WechatConfigModel[cert_pem]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="key_pem_div" class="form-group">
              <label for="key_pem" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("key_pem")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="key_pem" name="WechatConfigModel[key_pem]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="encodingaeskey_div" class="form-group">
              <label for="encodingaeskey" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("encodingaeskey")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="encodingaeskey" name="WechatConfigModel[encodingaeskey]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>
                    

			<?php ActiveForm::end(); ?>          
                </div>
			<div class="modal-footer">
				<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a> <a
					id="edit_dialog_ok" href="#" class="btn btn-primary">确定</a>
			</div>
		</div>
	</div>
</div>
<?php $this->beginBlock('footer');  ?>
<!-- <body></body>后代码块 -->
 <script>
function orderby(field, op){
	 var url = window.location.search;
	 var optemp = field + " desc";
	 if(url.indexOf('orderby') != -1){
		 url = url.replace(/orderby=([^&?]*)/ig,  function($0, $1){ 
			 var optemp = field + " desc";
			 optemp = decodeURI($1) != optemp ? optemp : field + " asc";
			 return "orderby=" + optemp;
		   }); 
	 }
	 else{
		 if(url.indexOf('?') != -1){
			 url = url + "&orderby=" + encodeURI(optemp);
		 }
		 else{
			 url = url + "?orderby=" + encodeURI(optemp);
		 }
	 }
	 window.location.href=url; 
 }
 function searchAction(){
		$('#wechat-config-search-form').submit();
	}
 function viewAction(id){
		initModel(id, 'view', 'fun');
	}

 function initEditSystemModule(data, type){
	if(type == 'create'){
    	        $("#id").val("");
        $("#app_id").val("");
        $("#app_secret").val("");
        $("#mch_id").val("");
        $("#key").val("");
        $("#cert_pem").val("");
        $("#key_pem").val("");
        $("#encodingaeskey").val("");
	
	}
	else{
    	        $("#id").val(data.id)
        $("#app_id").val(data.app_id)
        $("#app_secret").val(data.app_secret)
        $("#mch_id").val(data.mch_id)
        $("#key").val(data.key)
        $("#cert_pem").val(data.cert_pem)
        $("#key_pem").val(data.key_pem)
        $("#encodingaeskey").val(data.encodingaeskey)
	}
	if(type == "view"){
      $("#id").attr({readonly:true,disabled:true});
      $("#app_id").attr({readonly:true,disabled:true});
      $("#app_secret").attr({readonly:true,disabled:true});
      $("#mch_id").attr({readonly:true,disabled:true});
      $("#key").attr({readonly:true,disabled:true});
      $("#cert_pem").attr({readonly:true,disabled:true});
      $("#key_pem").attr({readonly:true,disabled:true});
      $("#encodingaeskey").attr({readonly:true,disabled:true});
	$('#edit_dialog_ok').addClass('hidden');
	}
	else{
      $("#id").attr({readonly:false,disabled:false});
      $("#app_id").attr({readonly:false,disabled:false});
      $("#app_secret").attr({readonly:false,disabled:false});
      $("#mch_id").attr({readonly:false,disabled:false});
      $("#key").attr({readonly:false,disabled:false});
      $("#cert_pem").attr({readonly:false,disabled:false});
      $("#key_pem").attr({readonly:false,disabled:false});
      $("#encodingaeskey").attr({readonly:false,disabled:false});
		$('#edit_dialog_ok').removeClass('hidden');
		}
		$('#edit_dialog').modal('show');
}

function initModel(id, type, fun){
	
	$.ajax({
		   type: "GET",
		   url: "<?=Url::toRoute('wechat-config/view')?>",
		   data: {"id":id},
		   cache: false,
		   dataType:"json",
		   error: function (xmlHttpRequest, textStatus, errorThrown) {
			    alert("出错了，" + textStatus);
			},
		   success: function(data){
			   initEditSystemModule(data, type);

			   ////////////////////////////////////////
   		   }
		});
}
	
function editAction(id){
	initModel(id, 'edit');
}

function deleteAction(id){
	var ids = [];
	if(!!id == true){
		ids[0] = id;
	}
	else{
		var checkboxs = $('#data_table :checked');
	    if(checkboxs.size() > 0){
	        var c = 0;
	        for(i = 0; i < checkboxs.size(); i++){
	            var id = checkboxs.eq(i).val();
	            if(id != ""){
	            	ids[c++] = id;
	            }
	        }
	    }
	}
	if(ids.length > 0){
		admin_tool.confirm('请确认是否删除', function(){
		    $.ajax({
				   type: "GET",
				   url: "<?=Url::toRoute('wechat-config/delete')?>",
				   data: {"ids":ids},
				   cache: false,
				   dataType:"json",
				   error: function (xmlHttpRequest, textStatus, errorThrown) {
					    admin_tool.alert('msg_info', '出错了，' + textStatus, 'warning');
					},
				   success: function(data){
					   for(i = 0; i < ids.length; i++){
						   $('#rowid_' + ids[i]).remove();
					   }
					   admin_tool.alert('msg_info', '删除成功', 'success');
					   window.location.reload();
				   }
				});
		});
	}
	else{
		admin_tool.alert('msg_info', '请先选择要删除的数据', 'warning');
	}
    
}

function getSelectedIdValues(formId)
{
	var value="";
	$( formId + " :checked").each(function(i)
	{
		if(!this.checked)
		{
			return true;
		}
		value += this.value;
		if(i != $("input[name='id']").size()-1)
		{
			value += ",";
		}
	 });
	return value;
}

$('#edit_dialog_ok').click(function (e) {
    e.preventDefault();
	$('#wechat-config-form').submit();
});

$('#create_btn').click(function (e) {
    e.preventDefault();
    initEditSystemModule({}, 'create');
});

$('#delete_btn').click(function (e) {
    e.preventDefault();
    deleteAction('');
});

$('#wechat-config-form').bind('submit', function(e) {
	e.preventDefault();
	var id = $("#id").val();
	var action = id == "" ? "<?=Url::toRoute('wechat-config/create')?>" : "<?=Url::toRoute('wechat-config/update')?>";
    $(this).ajaxSubmit({
    	type: "post",
    	dataType:"json",
    	url: action,
    	success: function(value) 
    	{
        	if(value.errno == 0){
        		$('#edit_dialog').modal('hide');
        		admin_tool.alert('msg_info', '添加成功', 'success');
        		window.location.reload();
        	}
        	else{
            	var json = value.data;
        		for(var key in json){
        			$('#' + key).attr({'data-placement':'bottom', 'data-content':json[key], 'data-toggle':'popover'}).addClass('popover-show').popover('show');
        			
        		}
        	}

    	}
    });
});

</script>
<?php $this->endBlock(); ?>