(function() {

	$("#searchBtn").click(
			function() {
				
				$("#searchTable").empty();
				
				$.ajax({
					url : "/api/search_location?searchValue="
							+ $("#searchText").val(),

					success : function(data) {
						console.log(data);

						$.each(JSON.parse(data), function(key, documents) {

							if (key == 'documents') {
								
								
								$.each(documents, function(key, value) {
									let
									address = value.address;
									$("#searchTable").append("<tbody><tr><td>" + value.address.address_name +"</td></tr></tbody>");

								});
							}
						});

					},
					error : function(request, status, error) {
						alert(status);
					}
				});
			})

})()