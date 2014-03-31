
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

   $( "#add-smart-tag-btn" ).click(function() {
	  $( "#add-smart-tags" ).slideToggle("fast");
   });

});