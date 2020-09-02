$('#gender1').click(function (e) {
    $(this).children().attr('value', '1');
    $('#gender2').children().attr('value', '0')
})

$('#gender2').click(function (e) {
    $(this).children().attr('value', '1');
    $('#gender1').children().attr('value', '0')
})

$('#showimg').click(function(e){
    window.location = AVATAR
})

$('#submit').click(function (e) {
    $.ajax({
        url: USER_INFO,
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
            'gender': $('#gender1').children().attr('value'),
            'height': $('#height').val(),
            'mobile': $('#mobile').val(),
            'hobby': $('#hobby').val(),
            'mate_require': $('#mate_require').val(),
        },
        success: function (data) {
            if (data['state'] == 0) {
                $.triggerModalBox(data['msg']);
                $('.wx-main-btn').on('click', function (e) {
                    if (data['state'] == 0) {
                        location.reload();
                    }
                });
            } else {
                $.triggerModalBox(data['msg']);
            }
        }
    });
});