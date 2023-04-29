function addReportToggle() {
	const registerPage = document.querySelector(".patient-reports");
	registerPage.classList.toggle("active");
	if (registerPage.classList.contains("active")) {
		document.body.style.overflow = "hidden";
	} else {
		document.body.style.overflow = "initial";
	}
}
	
	$(function() {
		
		/*--first time load--*/
		ajaxlist(page_url=false);
		
		/*-- Search keyword--*/
		$(document).on('click', "#searchBtn", function(event) {
			ajaxlist(page_url=false);
			event.preventDefault();
		});
		
		/*-- Reset Search--*/
		// $(document).on('click', "#resetBtn", function(event) {
		// 	$("#search_key").val('');
		// 	ajaxlist(page_url=false);
		// 	event.preventDefault();
		// });
		
		/*-- Page click --*/
		// $(document).on('click', ".pagination li a", function(event) {
		// 	var page_url = $(this).attr('href');
		// 	ajaxlist(page_url);
		// 	event.preventDefault();
		// });
		
		/*-- create function ajaxlist --*/
		function ajaxlist(page_url = false)
		{
			var search_key = $("#search_key").val();
			
			var dataString = 'search_key=' + search_key;
			var base_url = "<?php echo site_url() ?> Welcome/opd";
			
			if(page_url == false) {
				var page_url = base_url;
			}
			
			$.ajax({
				method: "POST",
				url: page_url,
				data: dataString,
				success: function(response) {
					console.log(response);
					$("#ajaxContent").html(response);
				}
			});
		}
	});
