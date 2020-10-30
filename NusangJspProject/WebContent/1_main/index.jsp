<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	/* function getLocation() {
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
	getLocation(); */

	// 현재위치 불러오기, 
	var longtitude = "127.036399";
	var latitude = "37.500915";
	
	
	function getLocationName(longitude, latitude) {
		$.ajax({
			url : "/api/kakao_locale_api",
			type : "POST",
			data : {
				"longitude" : longitude,
				"latitude" : latitude
			},

			success : function(data) {
				/* $("#titleAddress").html(data + " 근처 판매 목록"); */

				location.href = "/main";
			},
			error : function(request, status, error) {
				alert(status);
			}
		});
	}
	getLocationName(longtitude,latitude);
</script>