$(document).on('click', '#wechat-contr', function () {
    $.ajax({
        url: LOGIN_JUMP,
        type: "GET",
        dataType:'json',
        success: function(res){
            window.location = res['data']
        }
    })
})