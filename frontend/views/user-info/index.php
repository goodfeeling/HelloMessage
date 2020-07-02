<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '个人中心';
$urlManager = Yii::$app->urlManager;
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <div class="form-group">
            <label for="name">真实姓名</label>
            <input type="text" class="form-control" value="<?= $data['name'] ?? '' ?>" id="name" placeholder="真实姓名">
        </div>

        <div class="form-group">
            <label for="birthday">生日</label>
            <input type="date" class="form-control" value="<?= $data['birthday'] ?? '' ?>" id="birthday" placeholder="生日">
        </div>

        <div class="form-group">
            <label for="gender">性别</label>
            <div class="input-group btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-outline-primary <?= $data['gender']==1 ? 'active' : '' ?>">
                    <input type="radio" name="options" value="1" id="option1" checked>
                    <i class="icon ion-ios-male"></i>
                    男性
                </label>
                <label class="btn btn-outline-primary <?= $data['gender']==0 ? 'active' : '' ?>">
                    <input type="radio" name="options" value="0" id="option2">
                    <i class="icon ion-ios-female"></i>
                    女性
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="height">身高</label>
            <div class="input-group">
                <input type="number" class="form-control" value="<?= $data['height'] ?? '' ?>" id="height" placeholder="身高">
            </div>
        </div>

        <div class="form-group">
            <label for="native_place">籍贯</label>
            <input type="native_place" class="form-control" value="<?= $data['native_place'] ?? '' ?>" id="native_place" placeholder="籍贯">
        </div>

        <div class="form-group">
            <label for="mobile">联系方式</label>
            <div class="input-group">
                <input type="number" class="form-control" value="<?= $data['mobile'] ?? '' ?>" id="mobile" placeholder="联系方式">
            </div>
            <p class="help-block">请正确填写联系方式.</p>
        </div>

        <div class="form-group">
            <label for="occupation">职业</label>
            <select class="form-control" id="occupation">
                <?php if (isset($data['occupation'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['occupation'] == '学生' ? 'selected' :null ?>>学生</option>
                    <option <?= $data['occupation'] == '老师' ? 'selected' :null ?>>老师</option>
                    <option <?= $data['occupation'] == '公务员' ? 'selected' :null ?>>公务员</option>
                    <option <?= $data['occupation'] == '白领' ? 'selected' :null ?>>白领</option>
                    <option <?= $data['occupation'] == '其它' ? 'selected' :null ?>>其它</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>学生</option>
                    <option>老师</option>
                    <option>公务员</option>
                    <option>白领</option>
                    <option>其它</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <label for="income">月收入</label>
            <select class="form-control" id="income">
                <?php if (isset($data['income'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['income'] == '1万～5万' ? 'selected' :null ?>>1万～5万</option>
                    <option <?= $data['income'] == '5万～10万' ? 'selected' :null ?>>5万～10万</option>
                    <option <?= $data['income'] == '10万～20万' ? 'selected' :null ?>>10万～20万</option>
                    <option <?= $data['income'] == '20万～100万' ? 'selected' :null ?>>20万～100万</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>1万～5万</option>
                    <option>5万～10万</option>
                    <option>10万～20万</option>
                    <option>20万～100万</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <label for="cars_and_houses">有无车和房</label>
            <select class="form-control" id="cars_and_houses">
                <?php if (isset($data['cars_and_houses'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['cars_and_houses'] ? 'selected' :null ?>>有</option>
                    <option <?= $data['cars_and_houses'] ? 'selected' :null ?>>无</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>有</option>
                    <option>无</option>
                <?php endif; ?>
            </select>
        </div>

        <div class="form-group">
            <label for="marital_status">婚姻状况</label>
            <select class="form-control" id="marital_status">
                <?php if (isset($data['marital_status'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['marital_status'] == '已婚' ? 'selected' :null ?>>已婚</option>
                    <option <?= $data['marital_status'] == '未婚' ? 'selected' :null ?>>未婚</option>
                    <option <?= $data['marital_status'] == '单身' ? 'selected' :null ?>>单身</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>已婚</option>
                    <option>未婚</option>
                    <option>单身</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <label for="education">学历</label>
            <select class="form-control" id="education">
                <?php if (isset($data['education'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['education'] == '高中' ? 'selected' :null ?>>高中</option>
                    <option <?= $data['education'] == '大专' ? 'selected' :null ?>>大专</option>
                    <option <?= $data['education'] == '本科' ? 'selected' :null ?>>本科</option>
                    <option <?= $data['education'] == '硕士' ? 'selected' :null ?>>硕士</option>
                    <option <?= $data['education'] == '博士' ? 'selected' :null ?>>博士</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>高中</option>
                    <option>大专</option>
                    <option>本科</option>
                    <option>硕士</option>
                    <option>博士</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <label for="character">性格</label>
            <select class="form-control" id="character">
                <?php if (isset($data['character'])): ?>
                    <option>请选择...</option>
                    <option <?= $data['character'] == '开放' ? 'selected' :null ?>>开放</option>
                    <option <?= $data['character'] == '完美' ? 'selected' :null ?>>完美</option>
                    <option <?= $data['character'] == '浪漫' ? 'selected' :null ?>>浪漫</option>
                    <option <?= $data['character'] == '活跃' ? 'selected' :null ?>>活跃</option>
                    <option <?= $data['character'] == '智慧' ? 'selected' :null ?>>智慧</option>
                <?php else: ?>
                    <option selected>请选择...</option>
                    <option>开放</option>
                    <option>完美</option>
                    <option>浪漫</option>
                    <option>活跃</option>
                    <option>智慧</option>
                <?php endif; ?>

            </select>
        </div>

        <div class="form-group">
            <label for="hobby">爱好</label>
            <textarea rows="3" class="form-control" id="hobby" placeholder="爱好"> <?= $data['hobby'] ?? '' ?></textarea>
        </div>

        <div class="form-group">
            <label for="mate_require">择偶要求</label>
            <textarea rows="3" class="form-control" id="mate_require" placeholder="择偶要求"> <?= $data['mate_require'] ??'' ?></textarea>
        </div>

        <button type="button" class="btn btn-primary btn-lg btn-block mt-2" id="submit">保存</button>
    </div>
</div>

<script>
    $('#submit').click(function(e) {
        var occupation = $("#occupation option:selected").text();
        var income = $("#income option:selected").text();
        var cars_and_houses = $("#cars_and_houses option:selected").text();
        var marital_status = $("#marital_status option:selected").text();
        var education = $("#education option:selected").text();
        var character = $("#character option:selected").text();
        var gender = $("#gender option:selected").text();
        console.log(gender)
        var data = {
            'name': $('#name').val(),
            'birthday': $('#birthday').val(),
            'native_place': $('#native_place').val(),
            'occupation': occupation,
            'income': income,
            'cars_and_houses': cars_and_houses,
            'marital_status': marital_status,
            'education': education,
            'character': character,
            'gender': gender,
            'height': $('#height').val(),
            'mobile': $('#mobile').val(),
            'hobby': $('#hobby').val(),
            'mate_require': $('#mate_require').val(),
        };
        $.ajax({
            url: "<?= $urlManager->createUrl(['user-info/index']) ?>",
            type: 'post',
            dataType: 'json',
            data: data,
            success: function(data) {
                if (data['state']==0) {
                    $('.wx-bd').text(data['msg']);
                    $('.wx-main-btn').text("确定");
                    $('#simpleDialog').fadeIn(200);
                    $('.wx-main-btn').on('click',function(e){
                        if(data['state'] == 0) {
                            location.reload();
                        }
                    });
                } else {
                    $('.wx-bd').text(data['msg']);
                    $('.wx-main-btn').text("确定");
                    $('#simpleDialog').fadeIn(200);
                }
            }
        });
    });
</script>