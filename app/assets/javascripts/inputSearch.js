$('.dropdown a').click(function () {
    var value = $(this).text();
    var input = $('#big-search-box');
    input.val(input.val() + value + ', ');
    return false;
});