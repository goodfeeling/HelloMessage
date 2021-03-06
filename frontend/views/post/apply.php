<?php
use \common\services\StaticServices;

/* @var $this yii\web\View */

$this->title = '活动申请';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/post/apply.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
<div id="appCapsule">
    <div class="appContent">
        <div class="form-group">
            <label for="name">真实姓名</label>
            <input type="text" class="form-control" id="name" placeholder="真实姓名">
        </div>

        <div class="form-group">
            <label for="birthday">生日</label>
            <input type="date" class="form-control" id="birthday" placeholder="生日">
        </div>

        <div class="form-group">
            <label for="gender">性别</label>
            <div class="input-group btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-outline-primary active">
                    <input type="radio" name="options" id="option1" checked>
                    <i class="icon ion-ios-male"></i>
                    男性
                </label>
                <label class="btn btn-outline-primary">
                    <input type="radio" name="options" id="option2">
                    <i class="icon ion-ios-female"></i>
                    女性
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="height">身高</label>
            <div class="input-group">
                <input type="number" class="form-control" id="height" placeholder="身高">
            </div>
        </div>

        <div class="form-group">
            <label for="native_place">籍贯</label>
            <input type="native_place" class="form-control" id="native_place" placeholder="籍贯">
        </div>

        <div class="form-group">
            <label for="mobile">联系方式</label>
            <div class="input-group">
                <input type="number" class="form-control" id="mobile" placeholder="联系方式">
            </div>
            <p class="help-block">请正确填写联系方式.</p>
        </div>
        <div class="form-group">
            <label for="occupation">职业</label>
            <select class="form-control" id="occupation">
                <option>请选择...</option>
                <option>学生</option>
                <option>老师</option>
                <option>公务员</option>
                <option>白领</option>
                <option>其它</option>
            </select>
        </div>

        <div class="form-group">
            <label for="income">月收入</label>
            <select class="form-control" id="income">
                <option>请选择...</option>
                <option>1万～5万</option>
                <option>5万～10万</option>
                <option>10万～20万</option>
                <option>20万～100万</option>
            </select>
        </div>
        <div class="form-group">
            <label for="cars_and_houses">有无车和房</label>
            <select class="form-control" id="cars_and_houses">
                <option>请选择...</option>
                <option>有</option>
                <option>无</option>
            </select>
        </div>

        <div class="form-group">
            <label for="marital_status">婚姻状况</label>
            <select class="form-control" id="marital_status">
                <option>请选择...</option>
                <option>已婚</option>
                <option>未婚</option>
                <option>单身</option>
            </select>
        </div>
        <div class="form-group">
            <label for="education">学历</label>
            <select class="form-control" id="education">
                <option>请选择...</option>
                <option>高中</option>
                <option>大专</option>
                <option>本科</option>
                <option>硕士</option>
                <option>博士</option>
            </select>
        </div>


        <div class="form-group">
            <label for="character">性格</label>
            <select class="form-control" id="character">
                <option>请选择...</option>
                <option>开放</option>
                <option>完美</option>
                <option>较真</option>
                <option>认知</option>
                <option>成就</option>
                <option>力量</option>
                <option>浪漫</option>
                <option>活跃</option>
                <option>随和</option>
                <option>智慧</option>
                <option>多面</option>
                <option>多变</option>
            </select>
        </div>
        <div class="form-group">
            <label for="hobby">爱好</label>
            <textarea rows="3" class="form-control" id="hobby" placeholder="爱好"></textarea>
        </div>
        <div class="form-group">
            <label for="mate_require">择偶要求</label>
            <textarea rows="3" class="form-control" id="mate_require" placeholder="择偶要求"></textarea>
        </div>
        <!-- has-success -->
        <div class="checkbox">
            <label class="text-success">
                <input id="check" type="checkbox"> 我保证以上都是真实信息
            </label>
        </div>
        <button type="button" disabled class="btn btn-primary btn-lg btn-block" id="submit">提交</button>
    </div>
</div>

