<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
$this->title = '个人中心';
$urlManager = Yii::$app->urlManager;
$avatar_url = (new \frontend\service\UserService())->generaterUrl($this->params['user_info']['avatar_url'] ?? '');

\common\services\StaticServices::includeAppJsStatic('@web/js/user-info/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">

        <div class="form-group">
            <?= Html::label('头像', 'avatar') ?>
            <?= Html::img($avatar_url ?? '', ['class' => 'img-circle',"id"=>"showimg","style"=>"width: 60px;height: 60px;margin-left: 10px;margin-top: 10px"]) ?>
            <?= Html::tag('p', "点击按钮即可上传.", ['class' => 'help-block']) ?>
        </div>

        <div class="form-group">
            <?= Html::label('真实姓名', 'name') ?>
            <?= Html::input('text', '', $data['name'] ?? '', ['class' => 'form-control','id'=>'name',"placeholder"=>"真实姓名"]) ?>
        </div>

        <div class="form-group">
            <label for="birthday">生日</label>
            <?= Html::label('生日', 'birthday') ?>
            <?= Html::input('date', '', $data['birthday'] ?? '', ['class' => 'form-control','id'=>'birthday',"placeholder"=>"生日"]) ?>
        </div>

        <div class="form-group">
            <?= Html::label('性别', 'gender') ?>
            <div class="input-group btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-outline-primary <?= isset($data['gender']) == 1 ? 'active' : '' ?>" id="gender1">
                    <?= Html::input('radio', 'options', isset($data['gender'])? '1' : '0') ?>
                    <i class="icon ion-ios-male"></i>
                    男性
                </label>
                <label class="btn btn-outline-primary <?= isset($data['gender']) == 0 ? 'active' : '' ?>" id="gender2">
                    <?= Html::input('radio', 'options', isset($data['gender'])? '0' : '1') ?>
                    <i class="icon ion-ios-female"></i>
                    女性
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="height">身高</label>
            <?= Html::label('身高', 'height') ?>

            <div class="input-group">
                <?= Html::input('number', '', $data['height'] ?? '', ['class' => 'form-control','id'=>'height',"placeholder"=>"身高"]) ?>
            </div>
        </div>

        <div class="form-group">
            <?= Html::label('籍贯', 'native_place') ?>
            <?= Html::input('native_place', '', $data['native_place'] ?? '', ['class' => 'form-control','id'=>'native_place',"placeholder"=>"籍贯"]) ?>
        </div>

        <div class="form-group">
            <?= Html::label('联系方式', 'mobile') ?>
            <div class="input-group">
                <?= Html::input('number', '', $data['mobile'] ?? '', ['class' => 'form-control','id'=>'mobile',"placeholder"=>"联系方式"]) ?>
            </div>
            <p class="help-block">请正确填写联系方式.</p>
        </div>

        <div class="form-group">
            <?= Html::label('职业', 'occupation') ?>
            <select class="form-control" id="occupation">
                <?php if (isset($data['occupation'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['occupation'] == '学生' ? 'selected' : null ?>>学生</option>
                    <option <?= $data['occupation'] == '老师' ? 'selected' : null ?>>老师</option>
                    <option <?= $data['occupation'] == '公务员' ? 'selected' : null ?>>公务员</option>
                    <option <?= $data['occupation'] == '白领' ? 'selected' : null ?>>白领</option>
                    <option <?= $data['occupation'] == '其它' ? 'selected' : null ?>>其它</option>
                <?php else: ?>
                    <option selected>学生</option>
                    <option>学生</option>
                    <option>老师</option>
                    <option>公务员</option>
                    <option>白领</option>
                    <option>其它</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <?= Html::label('月收入', 'income') ?>
            <select class="form-control" id="income">
                <?php if (isset($data['income'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['income'] == '1万～5万' ? 'selected' : null ?>>1万～5万</option>
                    <option <?= $data['income'] == '5万～10万' ? 'selected' : null ?>>5万～10万</option>
                    <option <?= $data['income'] == '10万～20万' ? 'selected' : null ?>>10万～20万</option>
                    <option <?= $data['income'] == '20万～100万' ? 'selected' : null ?>>20万～100万</option>
                <?php else: ?>
                    <option selected>1万～5万</option>
                    <option>1万～5万</option>
                    <option>5万～10万</option>
                    <option>10万～20万</option>
                    <option>20万～100万</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <?= Html::label('有无车和房', 'cars_and_houses') ?>
            <select class="form-control" id="cars_and_houses">
                <?php if (isset($data['cars_and_houses'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['cars_and_houses'] ? 'selected' : null ?>>有</option>
                    <option <?= $data['cars_and_houses'] ? 'selected' : null ?>>无</option>
                <?php else: ?>
                    <option selected>有</option>
                    <option>有</option>
                    <option>无</option>
                <?php endif; ?>
            </select>
        </div>

        <div class="form-group">
            <?= Html::label('婚姻状况', 'marital_status') ?>
            <select class="form-control" id="marital_status">
                <?php if (isset($data['marital_status'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['marital_status'] == '已婚' ? 'selected' : null ?>>已婚</option>
                    <option <?= $data['marital_status'] == '未婚' ? 'selected' : null ?>>未婚</option>
                    <option <?= $data['marital_status'] == '单身' ? 'selected' : null ?>>单身</option>
                <?php else: ?>
                    <option selected>未婚</option>
                    <option>已婚</option>
                    <option>未婚</option>
                    <option>单身</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <?= Html::label('学历', 'education') ?>
            <select class="form-control" id="education">
                <?php if (isset($data['education'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['education'] == '高中' ? 'selected' : null ?>>高中</option>
                    <option <?= $data['education'] == '大专' ? 'selected' : null ?>>大专</option>
                    <option <?= $data['education'] == '本科' ? 'selected' : null ?>>本科</option>
                    <option <?= $data['education'] == '硕士' ? 'selected' : null ?>>硕士</option>
                    <option <?= $data['education'] == '博士' ? 'selected' : null ?>>博士</option>
                <?php else: ?>
                    <option selected>博士</option>
                    <option>高中</option>
                    <option>大专</option>
                    <option>本科</option>
                    <option>硕士</option>
                    <option>博士</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <?= Html::label('性格', 'character') ?>
            <select class="form-control" id="character">
                <?php if (isset($data['character'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['character'] == '开放' ? 'selected' : null ?>>开放</option>
                    <option <?= $data['character'] == '完美' ? 'selected' : null ?>>完美</option>
                    <option <?= $data['character'] == '浪漫' ? 'selected' : null ?>>浪漫</option>
                    <option <?= $data['character'] == '活跃' ? 'selected' : null ?>>活跃</option>
                    <option <?= $data['character'] == '智慧' ? 'selected' : null ?>>智慧</option>
                <?php else: ?>
                    <option selected>活跃</option>
                    <option>开放</option>
                    <option>完美</option>
                    <option>浪漫</option>
                    <option>活跃</option>
                    <option>智慧</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <?= Html::label('爱好', 'hobby') ?>
            <?= Html::textarea('textarea', Html::encode($data['hobby'] ?? ''), ['class' => 'form-control','id'=>'hobby"','placeholder'=>'爱好']) ?>
        </div>

        <div class="form-group">
            <?= Html::label('择偶要求', 'mate_require') ?>
            <?= Html::textarea('textarea', Html::encode($data['mate_require'] ?? ''), ['class' => 'form-control','id'=>'mate_require"','placeholder'=>'择偶要求','rows'=>3]) ?>
        </div>
        <?= Html::button('保存', ['class' => 'btn btn-outline-primary btn-lg btn-block mt-2',"id"=>'submit']) ?>
    </div>
</div>