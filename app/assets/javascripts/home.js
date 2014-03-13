
$(function(){
	$('.tooltips').hover(
		function(){
			$(this).tooltip('show');
		}, function(){
			$(this).tooltip('hide');
		}
	);

	$('#load-your-board').click(function(){
		var row = '<div class="row your-board-row" style="display:none"> \
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
		var count = $(".your-board > div").length;
		if(count < 3) {
			$('html, body').animate({
		        scrollTop: $(".your-board-row:last-child").offset().top
		    }, 500);

			$(row).appendTo($('.your-board'));
			$(".your-board-row:last-child").stop().slideDown('slow');
		}
	});

	$('#hide-your-board').click(function(){
		var count = $(".your-board > div").length;
		if(count > 1) {
			$('html, body').animate({
		        scrollTop: $(".your-board-row:nth-last-child(2)").offset().top
		    }, 500);
			$(".your-board-row:last-child").stop().slideUp('slow', function(){
				$(".your-board-row:last-child").remove();
			});
		}
	});

	$('#load-trending').click(function(){
		var row = '<div class="row trending-row" style="display:none"> \
				<div class="col-sm-6 col-md-6 col-lg-6"> \
					<a href="#" class="thumbnail"> \
						<caption> \
							<h3>Nowt 1</h3> \
							<p>nowt description</p> \
						</caption> \
					</a> \
				</div> \
				<div class="col-sm-6 col-md-6 col-lg-6"> \
					<a href="#" class="thumbnail"> \
						<caption> \
							<h3>Nowt 2</h3> \
							<p>nowt description</p> \
						</caption> \
					</a> \
				</div> \
			</div>'; 
		var count = $(".trending > div").length;
		if(count < 5) {
			$('html, body').animate({
		        scrollTop: $(".trending-row:last-child").offset().top
		    }, 500);

			$(row).appendTo($('.trending'));
			$(".trending-row:last-child").stop().slideDown('slow');
		}
	});

	$('#hide-trending').click(function(){
		var count = $(".trending > div").length;
		if(count > 1) {
			$('html, body').animate({
		        scrollTop: $(".trending-row:nth-last-child(2)").offset().top
		    }, 500);
			$(".trending-row:last-child").stop().slideUp('slow', function(){
				$(".trending-row:last-child").remove();
			});
		}
	});



	$('#load-interest').click(function(){
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
		var count = $(".interest > div").length;
		if(count < 3) {
			$('html, body').animate({
		        scrollTop: $(".interest-row:last-child").offset().top
		    }, 500);

			$(row).appendTo($('.interest'));
			$(".interest-row:last-child").stop().slideDown('slow');
		}
	});

	$('#hide-interest').click(function(){
		var count = $(".interest > div").length;
		if(count > 1) {
			$('html, body').animate({
		        scrollTop: $(".interest-row:nth-last-child(2)").offset().top
		    }, 500);
			$(".interest-row:last-child").stop().slideUp('slow', function(){
				$(".interest-row:last-child").remove();

			});

		}
	});

});