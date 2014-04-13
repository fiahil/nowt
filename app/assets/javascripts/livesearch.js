$( document ).ready(function(){

	$("#big-search-box").bind("keyup", function() {
		if( $(this).val().length != 0 ) {

			var form = $("#live-search-form"); // grab the form wrapping the search bar.

			var url = "/livesearch"; // live_search action.   
			var formData = form.serialize(); // grab the data in the form   
			$.get(url, formData, function(html) { // perform an AJAX get

				$("#live-search-results").html(html); // replace the "results" div with the results

			});
     
	    } else {

			var form = $("#live-search-form"); // grab the form wrapping the search bar.

			var url = "/emptySearch"; // live_search action.   
			var formData = form.serialize(); // grab the data in the form   
			$.get(url, formData, function(html) { // perform an AJAX get

				$("#live-search-results").html(html); // replace the "results" div with the results

			});
		}
	});  

    $("#user_tag_tokens").tokenInput("/tags.json", {
    	crossDomain: false,
    	prePopulate: $("#user_tag_tokens").data('pre'),
    	theme: "facebook",
    	preventDuplicates: true

    });	

    $("#post_tag_tokens").tokenInput("/tags.json", {
    	crossDomain: false,
    	prePopulate: $("#post_tag_tokens").data('pre'),
    	theme: "facebook",
    	preventDuplicates: true

    });	

    $("#post_update_tag_tokens").tokenInput("/tags.json", {
    	crossDomain: false,
    	prePopulate: $("#post_update_tag_tokens").data('pre'),
    	theme: "facebook",
    	preventDuplicates: true

    });	

});