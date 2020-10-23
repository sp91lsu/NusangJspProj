(function() {

	var myPosition = null;
	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				myPosition = position;
				alert(position.coords.latitude + ' '
						+ position.coords.longitude);
			}, function(error) {
				console.error(error);
			}, {
				enableHighAccuracy : false,
				maximumAge : 0,
				timeout : Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
	}
	getLocation();

	$.ajax({
	    url: "https://dapi.kakao.com//v2/local/geo/coord2address.json",
	    Authorization: "KakaoAK 7ac03576a3ef2b30b8b6545b6b0daf1c",
	    data: "",
	    success: function(data){
	    	alert(data);
	    },
	    error: function (request, status, error){        
	    	alert(status);
	    }
	  });



	
})()
