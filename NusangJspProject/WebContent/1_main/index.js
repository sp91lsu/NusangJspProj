(function() {

	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {

				getLocationName(position.coords.longitude,
						position.coords.latitude);
			}, function(error) {
				console.error(error);
			}, {
				enableHighAccuracy : false,
				maximumAge : 0,
				timeout : Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다. 현재 사이트에서 위치 허용 설정을 해주세요');
		}
	}
	getLocation();

	// 현재위치 불러오기

	function getLocationName(longitude, latitude) {
		$.ajax({
			url : "/api/kakao_locale_api",
			type : "POST",
			data : {
				"longitude" : longitude,
				"latitude" : latitude
			},

			success : function(data) {
				$("#titleAddress").html(data + " 근처 판매 목록");
			},
			error : function(request, status, error) {
				alert(status);
			}
		});
	}

})()
