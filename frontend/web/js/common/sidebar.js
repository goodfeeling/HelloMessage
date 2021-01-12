$('.avatar').on('click', function (e) {
    window.location.href = IDENTITY ? LOGIN : USER_INFO;
})