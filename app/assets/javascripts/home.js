
$(function(){
	$('.tooltips').hover(
		function(){
			$(this).tooltip('show');
		}, function(){
			$(this).tooltip('hide');
		}
	);

	$('#media').carousel({
    pause: true,
    interval: false,
  });

});