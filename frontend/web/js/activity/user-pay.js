$('#goPay').on('click', function (e) {
    $.ajax({
        url: USER_PAY,
        type: "POST",
        dataType: 'json',
        data: {id: $.getUrlParam('id')},
        success: function (res) {
            if (!res['state']) {
                $.triggerModalBox(res['msg'],'确定',function (e) {
                    window.location.href = "<?= Url::toRoute('site/index', true) ?>";
                });
            } else {
                $.triggerModalBox(res['msg']);
            }
        }
    })
});