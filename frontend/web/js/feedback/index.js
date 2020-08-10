$('#submit').click(function(e) {
    var data = {
        'title': $('#title').val(),
        'email': $('#email').val(),
        'content': $('#content').val(),
    };
    $.ajax({
        url: FEEDBACK,
        type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
        dataType: 'json',
        data: data,
        success: function(data) {
            if (data['state'] == 0) {
                $.triggerModalBox(data['msg']);
                if (data['state'] == 0 ) {
                    $('.weui-dialog__ft').on('click',function(e){
                        window.location.href = FEEDBACK;
                    });
                }
            } else {
                $.triggerModalBox(data['msg']);
            }
        }
    });
});