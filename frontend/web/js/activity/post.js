
$('#applyBtn').on('click', function (e) {
    $.ajax({
        url: VERIFY_USER,
        type: "GET",
        dataType: 'json',
        data: {
            id: $.getUrlParam('id')
        },
        success: function (res) {
            $.triggerModalBox(res['msg'], '去登陆', LOGIN);
        }
    })
});

$('#likes').on('click', function (e) {
    $.ajax({
        url: LINKES_INCREASE,
        type: "POST",
        dataType: 'json',
        data: {id: $.getUrlParam('id')},
        success: function (res) {
            if (res['state'] == 100) {
                $.triggerModalBox(res['msg'], '去登陆', LOGIN);
            } else if (res['state'] == 1) {
                $.triggerModalBox(res['msg']);
            }
        }
    })
});