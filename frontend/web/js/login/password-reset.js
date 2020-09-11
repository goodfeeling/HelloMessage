$('#submit').on('click',function(e){
    $.ajax({
        url: RESET_PW,
        type: "POST",
        dataType: 'json',
        data: {
            password: $('#password').val(),
            repassword: $('#repassword').val(),
            verify_str: $.getUrlParam('verify_str')
        },
        success: function (res) {
            window.location.href = BASE_URL;
        }
    })
});