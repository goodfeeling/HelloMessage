$('#home').on('click',function (e) {
    $('#home').removeClass('hidden').addClass('show');
    $('#profileb').removeClass('show').addClass('hidden')
    $('#contact').removeClass('show').addClass('hidden')
})

$('#profile').on('click',function (e) {
    $(this).removeClass('hidden').addClass('show');
    $('#home').removeClass('show').addClass('hidden')
    $('#contact').removeClass('show').addClass('hidden')
})

$('#contact').on('click',function (e) {
    $(this).removeClass('hidden').addClass('show');
    $('#profile').removeClass('show').addClass('hidden')
    $('#home').removeClass('show').addClass('hidden')
})