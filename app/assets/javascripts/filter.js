$(document).ready(function(){
	var sort = "#"+$("#hidden-sort-input").val();
	var category = "#"+$("#hidden-category-input").val();
	var time = "#"+$("#hidden-time-input").val();

	$(sort).addClass("filter-active");
	$(category).addClass("filter-active");
	$(time).addClass("filter-active");
});