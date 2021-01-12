$('#submit').on('click',function(e){
    $.ajax({
        url: FORGOT_PW,
        type: "GET",
        dataType: 'json',
        data: {
            to: $('#account').val()
        },
        success: function (res) {
            $.triggerModalBox(res['msg']);
        }
    })
});