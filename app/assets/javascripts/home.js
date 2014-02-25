
$(function(){
	$('.tooltips').hover(
		function(){
			$(this).tooltip('show');
		}, function(){
			$(this).tooltip('hide');
		}
	);

	$('#load-interests').click(function(){
		var row = '<div class="row interest-row" style="display:none"> \
				<div class="col-sm-4 col-md-4 col-lg-4"> \
					<a href="#" class="thumbnail"> \
						<caption> \
							<h3>Nowt 1</h3> \
							<p>nowt description</p> \
						</caption> \
					</a> \
				</div> \
				<div class="col-sm-4 col-md-4 col-lg-4"> \
					<a href="#" class="thumbnail"> \
						<caption> \
							<h3>Nowt 2</h3> \
							<p>nowt description</p> \
						</caption> \
					</a> \
				</div> \
				<div class="col-sm-4 col-md-4 col-lg-4"> \
					<a href="#" class="thumbnail"> \
						<caption> \
							<h3>Nowt 3</h3> \
							<p>nowt description</p> \
						</caption> \
					</a> \
				</div> \
			</div>'; 

		$(row).appendTo($('.interests'));
		$(".interest-row:last-child").slideDown('slow');

	});

	$('#hide-interests').click(function(){
		$(".interest-row:last-child").slideUp('slow', function(){
			$(".interest-row:last-child").remove();
		});
	});

});