<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '活动申请';
?>

<div class="appContent">

    <div class="card mt-2 mb-3">
        <div class="card-body">
            <h5 class="card-title">Inputs</h5>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Default Input">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password Input">
            </div>
            <div class="form-group">
                <textarea rows="3" class="form-control" placeholder="Textarea"></textarea>
            </div>
            <button type="button" class="btn btn-primary">Send</button>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Select</h5>
            <select class="form-control" id="exampleFormControlSelect1">
                <option>Please select...</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
            </select>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Checkboxes</h5>
            <div class="custom-control custom-checkbox mb-1">
                <input type="checkbox" class="custom-control-input" id="customControl1" checked />
                <label class="custom-control-label" for="customControl1">Apple</label>
            </div>
            <div class="custom-control custom-checkbox mb-1">
                <input type="checkbox" class="custom-control-input" id="customControl2">
                <label class="custom-control-label" for="customControl2">Watermelon</label>
            </div>
            <div class="custom-control custom-checkbox mb-1">
                <input type="checkbox" class="custom-control-input" id="customControl3">
                <label class="custom-control-label" for="customControl3">Grape</label>
            </div>

        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Radios</h5>
            <div class="custom-control custom-radio mb-1">
                <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked />
                <label class="custom-control-label" for="customRadio1">Apple</label>
            </div>
            <div class="custom-control custom-radio mb-1">
                <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                <label class="custom-control-label" for="customRadio2">Watermelon</label>
            </div>
            <div class="custom-control custom-radio mb-1">
                <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
                <label class="custom-control-label" for="customRadio3">Grape</label>
            </div>
        </div>
    </div>
    <div class="card mb-3">

        <div class="card-body">
            <h4>活动申请 <small>请填写相关信息</small></h4>
        </div>
    </div>
    <div class="card mb-3">
    <div class="progress">
            <div class="progress-bar progress-bar-danger stepColor1" style="width: 20%">
            </div>
            <div class="progress-bar progress-bar-warning stepColor2 sr-only" style="width: 20%">
            </div>
            <div class="progress-bar progress-bar-info stepColor3 sr-only" style="width: 20%">
            </div>
            <div class="progress-bar progress-bar-danger stepColor4 sr-only" style="width: 20%">
            </div>
            <div class="progress-bar progress-bar-warning stepColor5 sr-only" style="width: 20%">
            </div>
        </div>
    </div>
    <div class="card mb-3">
        <div class="step1">
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
                <select class="form-control" id="gender">
                    <option>男生</option>
                    <option>女生</option>
                </select>
            </div>

            <div class="form-group">
                <label for="height">身高</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="height" placeholder="身高">
                    <div class="input-group-addon">CM</div>
                </div>
            </div>

            <div class="form-group">
                <label for="native_place">籍贯</label>
                <input type="native_place" class="form-control" id="native_place" placeholder="籍贯">
            </div>

        </div>

        <div class="step2 sr-only">
            <div class="form-group">
                <label for="mobile">联系方式</label>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">+86</span>
                    <input type="number" class="form-control" id="mobile" placeholder="联系方式">
                </div>
                <p class="help-block">请正确填写联系方式.</p>
            </div>
            <div class="form-group">
                <label for="occupation">职业</label>
                <select class="form-control" id="occupation">
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
                    <option>1万～5万</option>
                    <option>5万～10万</option>
                    <option>10万～20万</option>
                    <option>20万～100万</option>
                </select>
            </div>
        </div>

        <div class="step3 sr-only">
            <div class="form-group">
                <label for="cars_and_houses">有无车和房</label>
                <select class="form-control" id="cars_and_houses">
                    <option>有</option>
                    <option>无</option>
                </select>
            </div>

            <div class="form-group">
                <label for="marital_status">婚姻状况</label>
                <select class="form-control" id="marital_status">
                    <option>已婚</option>
                    <option>未婚</option>
                    <option>单身</option>
                </select>
            </div>
            <div class="form-group">
                <label for="education">学历</label>
                <select class="form-control" id="education">
                    <option>高中</option>
                    <option>大专</option>
                    <option>本科</option>
                    <option>硕士</option>
                    <option>博士</option>
                </select>
            </div>

        </div>

        <div class="step4 sr-only">
            <div class="form-group">
                <label for="character">性格</label>
                <select class="form-control" id="character">
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
                <textarea class="form-control" id="hobby" placeholder="爱好"></textarea>
            </div>


        </div>

        <div class="step5 sr-only">
            <div class="form-group">
                <label for="mate_require">择偶要求</label>
                <textarea class="form-control" id="mate_require" placeholder="择偶要求"></textarea>
            </div>
            <!-- has-success -->
            <div class="checkbox has-error">
                <label>
                    <input type="checkbox"> 我保证以上都是真实信息
                </label>
            </div>

            <button type="submit" disabled="disabled" class="btn btn-default" id="submit">提交</button>
        </div>

        <nav>
            <ul class="pager">
                <li class="previous">
                    <a><span aria-hidden="true">&larr;</span> 上一步</a>
                </li>
                <li class="next">
                    <a>下一步 <span aria-hidden="true">&rarr;</span></a>
                </li>
            </ul>
        </nav>

    </div>

</div>

<script type="text/javascript">
    window.onload = ()=>{
        $('#submit').click(function(e) {
            var occupation = $("#occupation option:selected").text();
            var income = $("#income option:selected").text();
            var cars_and_houses = $("#cars_and_houses option:selected").text();
            var marital_status = $("#marital_status option:selected").text();
            var education = $("#education option:selected").text();
            var character = $("#character option:selected").text();
            var gender = $("#gender option:selected").text();
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
                url: 'index.php?r=site/apply',
                type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
                dataType: 'json',
                data: data,
                success: function(data) {
                    console.log(data);
                }
            });
        });


    }
</script>