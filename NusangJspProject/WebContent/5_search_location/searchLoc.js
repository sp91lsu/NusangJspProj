(function() {

	$("#searchBtn").click(
			function() {

				$("#searchTable").empty();

				$.ajax({
					url : "/api/search_location?searchValue="
							+ $("#searchText").val(),

					success : function(data) {

						$.each(JSON.parse(data), function(key, documents) {

							if (key == 'documents') {

								$.each(documents, function(key, value) {
									let
									address = value.address;
									$("#searchTable").append(
											"<tbody class='searchTab'><tr><td>"
													+ address.address_name
													+ "</td></tr></tbody>");

								});

							}
						});

						console.log($('.searchTab'));
						$('.searchTab').click(function() {
							$(this).children("tr").children("td").text();
						})
					},
					error : function(request, status, error) {
						alert(status);
					}
				});
			});

	function setLocation(locName) {
		
		
		$.ajax({
			url : "/api/search_location?searchValue=" + $("#searchText").val(),

		});
	}
})()