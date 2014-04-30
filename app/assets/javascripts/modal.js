$(document).ready(function(){
	$('#activate-nowt-modal').click(function(){
		$("#myModal").modal("show");
	})

	$('.cbp-mc-submit').click(function(){
		$("#myModal").modal("hide");
	})

	 $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        $('#post_category').val($(this).attr('title')); 
        
    });

	 $("#nowt-modal-next-btn").click(function(){
	 	$(".modal-prev").removeClass("modal-active");
	 	$(".modal-next").addClass("modal-active");
	 });

	 $("#nowt-modal-prev-btn").click(function(){
	 	$(".modal-next").removeClass("modal-active");
	 	$(".modal-prev").addClass("modal-active");
	 });

});