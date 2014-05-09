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
	 	var title_value = $.trim($("#modal-title").val());
	 	var descrip_value = $.trim($("#modal-description").val());
	 	

	 	if(title_value.length > 0 && descrip_value.length > 0 ){
	 		$(".modal-prev").removeClass("modal-active");
	 		$(".modal-next").addClass("modal-active");
	 	} else {
	 		if(title_value.length == 0){
	 			$("#modal-title").addClass("modal-error");

	 		}
	 		if(descrip_value.length == 0){
	 			$("#modal-description").addClass("modal-error");
	 		}
	 	}
	 });

	 $("#nowt-modal-prev-btn").click(function(){
	 	$(".modal-next").removeClass("modal-active");
	 	$(".modal-prev").addClass("modal-active");
	 });

});