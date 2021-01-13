
<?php
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;
use common\utils\CommonFun;
use yii\helpers\Url;

use backend\models\UserDetailModel;

$modelLabel = new \backend\models\UserDetailModel();
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
                <?php ActiveForm::begin(['id' => 'user-detail-search-form', 'method'=>'get', 'options' => ['class' => 'form-inline'], 'action'=>Url::toRoute('user-detail/index')]); ?>     
                
                  <div class="form-group" style="margin: 5px;">
                      <label><?=$modelLabel->getAttributeLabel('id')?>:</label>
                      <input type="text" class="form-control" id="query[id]" name="query[id]"  value="<?=isset($query["id"]) ? $query["id"] : "" ?>">
                  </div>
              <div class="form-group">
              	<a onclick="searchAction()" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>搜索</a>
                  <a class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-save icon-white"></i>导出数据</a>

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
              echo '<th onclick="orderby(\'uid\', \'desc\')" '.CommonFun::sortClass($orderby, 'uid').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('uid').'</th>';
              echo '<th onclick="orderby(\'name\', \'desc\')" '.CommonFun::sortClass($orderby, 'name').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('name').'</th>';
              echo '<th onclick="orderby(\'birthday\', \'desc\')" '.CommonFun::sortClass($orderby, 'birthday').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('birthday').'</th>';
              echo '<th onclick="orderby(\'occupation\', \'desc\')" '.CommonFun::sortClass($orderby, 'occupation').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('occupation').'</th>';
              echo '<th onclick="orderby(\'income\', \'desc\')" '.CommonFun::sortClass($orderby, 'income').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('income').'</th>';
              echo '<th onclick="orderby(\'cars_and_houses\', \'desc\')" '.CommonFun::sortClass($orderby, 'cars_and_houses').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('cars_and_houses').'</th>';
              echo '<th onclick="orderby(\'marital_status\', \'desc\')" '.CommonFun::sortClass($orderby, 'marital_status').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('marital_status').'</th>';
              echo '<th onclick="orderby(\'education\', \'desc\')" '.CommonFun::sortClass($orderby, 'education').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('education').'</th>';
              echo '<th onclick="orderby(\'native_place\', \'desc\')" '.CommonFun::sortClass($orderby, 'native_place').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('native_place').'</th>';
              echo '<th onclick="orderby(\'character\', \'desc\')" '.CommonFun::sortClass($orderby, 'character').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('character').'</th>';
              echo '<th onclick="orderby(\'hobby\', \'desc\')" '.CommonFun::sortClass($orderby, 'hobby').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('hobby').'</th>';
              echo '<th onclick="orderby(\'mate_require\', \'desc\')" '.CommonFun::sortClass($orderby, 'mate_require').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('mate_require').'</th>';
              echo '<th onclick="orderby(\'gender\', \'desc\')" '.CommonFun::sortClass($orderby, 'gender').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('gender').'</th>';
              echo '<th onclick="orderby(\'height\', \'desc\')" '.CommonFun::sortClass($orderby, 'height').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('height').'</th>';
              echo '<th onclick="orderby(\'mobile\', \'desc\')" '.CommonFun::sortClass($orderby, 'mobile').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('mobile').'</th>';
              echo '<th onclick="orderby(\'addtime\', \'desc\')" '.CommonFun::sortClass($orderby, 'addtime').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('addtime').'</th>';
              echo '<th onclick="orderby(\'update_time\', \'desc\')" '.CommonFun::sortClass($orderby, 'update_time').' tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('update_time').'</th>';
         
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
                echo '  <td>' . $model->uid . '</td>';
                echo '  <td>' . $model->name . '</td>';
                echo '  <td>' . $model->birthday . '</td>';
                echo '  <td>' . $model->occupation . '</td>';
                echo '  <td>' . $model->income . '</td>';
                echo '  <td>' . $model->cars_and_houses . '</td>';
                echo '  <td>' . $model->marital_status . '</td>';
                echo '  <td>' . $model->education . '</td>';
                echo '  <td>' . $model->native_place . '</td>';
                echo '  <td>' . $model->character . '</td>';
                echo '  <td>' . $model->hobby . '</td>';
                echo '  <td>' . $model->mate_require . '</td>';
                echo '  <td>' . $model->gender . '</td>';
                echo '  <td>' . $model->height . '</td>';
                echo '  <td>' . $model->mobile . '</td>';
                echo '  <td>' . $model->addtime . '</td>';
                echo '  <td>' . $model->update_time . '</td>';
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
                <?php $form = ActiveForm::begin(["id" => "user-detail-form", "class"=>"form-horizontal", "action"=>Url::toRoute("user-detail/save")]); ?>                      
                 
          <input type="hidden" class="form-control" id="id" name="id" />

          <div id="uid_div" class="form-group">
              <label for="uid" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("uid")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="uid" name="UserDetailModel[uid]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="name_div" class="form-group">
              <label for="name" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("name")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="UserDetailModel[name]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="birthday_div" class="form-group">
              <label for="birthday" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("birthday")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="birthday" name="UserDetailModel[birthday]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="occupation_div" class="form-group">
              <label for="occupation" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("occupation")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="occupation" name="UserDetailModel[occupation]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="income_div" class="form-group">
              <label for="income" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("income")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="income" name="UserDetailModel[income]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="cars_and_houses_div" class="form-group">
              <label for="cars_and_houses" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("cars_and_houses")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="cars_and_houses" name="UserDetailModel[cars_and_houses]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="marital_status_div" class="form-group">
              <label for="marital_status" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("marital_status")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="marital_status" name="UserDetailModel[marital_status]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="education_div" class="form-group">
              <label for="education" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("education")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="education" name="UserDetailModel[education]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="native_place_div" class="form-group">
              <label for="native_place" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("native_place")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="native_place" name="UserDetailModel[native_place]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="character_div" class="form-group">
              <label for="character" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("character")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="character" name="UserDetailModel[character]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="hobby_div" class="form-group">
              <label for="hobby" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("hobby")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="hobby" name="UserDetailModel[hobby]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="mate_require_div" class="form-group">
              <label for="mate_require" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("mate_require")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="mate_require" name="UserDetailModel[mate_require]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="gender_div" class="form-group">
              <label for="gender" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("gender")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="gender" name="UserDetailModel[gender]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="height_div" class="form-group">
              <label for="height" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("height")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="height" name="UserDetailModel[height]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="mobile_div" class="form-group">
              <label for="mobile" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("mobile")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="mobile" name="UserDetailModel[mobile]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="addtime_div" class="form-group">
              <label for="addtime" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("addtime")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="addtime" name="UserDetailModel[addtime]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="update_time_div" class="form-group">
              <label for="update_time" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("update_time")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="update_time" name="UserDetailModel[update_time]" placeholder="" />
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
		$('#user-detail-search-form').submit();
	}
 function viewAction(id){
		initModel(id, 'view', 'fun');
	}

 function initEditSystemModule(data, type){
	if(type == 'create'){
    	        $("#id").val("");
        $("#uid").val("");
        $("#name").val("");
        $("#birthday").val("");
        $("#occupation").val("");
        $("#income").val("");
        $("#cars_and_houses").val("");
        $("#marital_status").val("");
        $("#education").val("");
        $("#native_place").val("");
        $("#character").val("");
        $("#hobby").val("");
        $("#mate_require").val("");
        $("#gender").val("");
        $("#height").val("");
        $("#mobile").val("");
        $("#addtime").val("");
        $("#update_time").val("");
	
	}
	else{
    	        $("#id").val(data.id)
        $("#uid").val(data.uid)
        $("#name").val(data.name)
        $("#birthday").val(data.birthday)
        $("#occupation").val(data.occupation)
        $("#income").val(data.income)
        $("#cars_and_houses").val(data.cars_and_houses)
        $("#marital_status").val(data.marital_status)
        $("#education").val(data.education)
        $("#native_place").val(data.native_place)
        $("#character").val(data.character)
        $("#hobby").val(data.hobby)
        $("#mate_require").val(data.mate_require)
        $("#gender").val(data.gender)
        $("#height").val(data.height)
        $("#mobile").val(data.mobile)
        $("#addtime").val(data.addtime)
        $("#update_time").val(data.update_time)
	}
	if(type == "view"){
      $("#id").attr({readonly:true,disabled:true});
      $("#uid").attr({readonly:true,disabled:true});
      $("#name").attr({readonly:true,disabled:true});
      $("#birthday").attr({readonly:true,disabled:true});
      $("#occupation").attr({readonly:true,disabled:true});
      $("#income").attr({readonly:true,disabled:true});
      $("#cars_and_houses").attr({readonly:true,disabled:true});
      $("#marital_status").attr({readonly:true,disabled:true});
      $("#education").attr({readonly:true,disabled:true});
      $("#native_place").attr({readonly:true,disabled:true});
      $("#character").attr({readonly:true,disabled:true});
      $("#hobby").attr({readonly:true,disabled:true});
      $("#mate_require").attr({readonly:true,disabled:true});
      $("#gender").attr({readonly:true,disabled:true});
      $("#height").attr({readonly:true,disabled:true});
      $("#mobile").attr({readonly:true,disabled:true});
      $("#addtime").attr({readonly:true,disabled:true});
      $("#update_time").attr({readonly:true,disabled:true});
	$('#edit_dialog_ok').addClass('hidden');
	}
	else{
      $("#id").attr({readonly:false,disabled:false});
      $("#uid").attr({readonly:false,disabled:false});
      $("#name").attr({readonly:false,disabled:false});
      $("#birthday").attr({readonly:false,disabled:false});
      $("#occupation").attr({readonly:false,disabled:false});
      $("#income").attr({readonly:false,disabled:false});
      $("#cars_and_houses").attr({readonly:false,disabled:false});
      $("#marital_status").attr({readonly:false,disabled:false});
      $("#education").attr({readonly:false,disabled:false});
      $("#native_place").attr({readonly:false,disabled:false});
      $("#character").attr({readonly:false,disabled:false});
      $("#hobby").attr({readonly:false,disabled:false});
      $("#mate_require").attr({readonly:false,disabled:false});
      $("#gender").attr({readonly:false,disabled:false});
      $("#height").attr({readonly:false,disabled:false});
      $("#mobile").attr({readonly:false,disabled:false});
      $("#addtime").attr({readonly:false,disabled:false});
      $("#update_time").attr({readonly:false,disabled:false});
		$('#edit_dialog_ok').removeClass('hidden');
		}
		$('#edit_dialog').modal('show');
}

function initModel(id, type, fun){
	
	$.ajax({
		   type: "GET",
		   url: "<?=Url::toRoute('user-detail/view')?>",
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
				   url: "<?=Url::toRoute('user-detail/delete')?>",
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
	$('#user-detail-form').submit();
});

$('#create_btn').click(function (e) {
    e.preventDefault();
    initEditSystemModule({}, 'create');
});

$('#delete_btn').click(function (e) {
    e.preventDefault();
    deleteAction('');
});

$('#user-detail-form').bind('submit', function(e) {
	e.preventDefault();
	var id = $("#id").val();
	var action = id == "" ? "<?=Url::toRoute('user-detail/create')?>" : "<?=Url::toRoute('user-detail/update')?>";
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