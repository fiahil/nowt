$(document).ready(function(){
	$('.cbp-vimenu > li a').click(function(){
		$('.cbp-vimenu > li a').removeClass("modal-category-active");
		$(this).addClass("modal-category-active");
		$('#post_category').val($(this).attr('title')); 	
	});

	$('.cbp-mc-submit').click(function(){
		$("#myModal").modal("hide");
	})
});