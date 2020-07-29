var state = true;
$('#check').click(function (e) {
    if (state == true) {
        $(this).parent().removeClass('text-success').addClass('text-primary');
        $('#submit').attr("disabled", !state);
        state = false
    } else {
        $(this).parent().removeClass('text-primary').addClass('text-success');
        $('#submit').attr("disabled", !state);
        state = true
    }
});

$('#submit').click(function (e) {
    var id = $.getUrlParam('id');
    $.ajax({
        url: APPLY + "&id=" + id,
        type: 'post',
        dataType: 'json',
        data: {
            'name': $('#name').val(),
            'birthday': $('#birthday').val(),
            'native_place': $('#native_place').val(),
            'occupation': $("#occupation option:selected").text(),
            'income': $("#income option:selected").text(),
            'cars_and_houses': $("#cars_and_houses option:selected").text(),
            'marital_status': $("#marital_status option:selected").text(),
            'education': $("#education option:selected").text(),
            'character': $("#character option:selected").text(),
            'gender': $("#gender option:selected").text(),
            'height': $('#height').val(),
            'mobile': $('#mobile').val(),
            'hobby': $('#hobby').val(),
            'mate_require': $('#mate_require').val(),
        },
        success: function (data) {
            if (data['state'] == 0) {
                window.location.href = USER_PAY + "&id=" + id;
            } else {
                $.triggerModalBox(data['msg']);
            }
        }
    });
});