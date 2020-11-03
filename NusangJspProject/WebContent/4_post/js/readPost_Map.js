(function() {

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng($(latitude).val(), $(longtitude).val()), // 지도의
		// 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	console.log($(latitude).val());
	console.log($(longtitude).val());
	// 마커가 표시될 위치입니다
	var markerPosition = new kakao.maps.LatLng($(latitude).val(), $(longtitude)
			.val());

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
	var myPosition = new kakao.maps.LatLng($("#userLatitude").val(), $(
			"#userLongtitude").val());

	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다
	drawingLine = new kakao.maps.Polyline({
		strokeWeight : 3, // 선의 두께입니다
		strokeColor : '#00a0e9', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid' // 선의 스타일입니다
	});
	drawingCircle = new kakao.maps.Circle({
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#00a0e9', // 선의 색깔입니다
		strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : '#00a0e9', // 채우기 색깔입니다
		fillOpacity : 0.2
	// 채우기 불투명도입니다
	});
	 drawingOverlay = new kakao.maps.CustomOverlay({
         xAnchor: 0,
         yAnchor: 0,
         zIndex: 1
     });       
	// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
	var linePath = [ myPosition, markerPosition ];

	// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
	drawingLine.setPath(linePath);

	
	
	function getTimeHTML(distance) {

		distance = Math.floor(distance);
	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'

	    return content;
	}
	
	// 원의 반지름을 선 객체를 이용해서 얻어옵니다
	var length = drawingLine.getLength();

	if (length > 0) {

		// 그려지고 있는 원의 중심좌표와 반지름입니다
		var circleOptions = {
			center : myPosition,
			radius : length,
		};

		// 그려지고 있는 원의 옵션을 설정합니다
		drawingCircle.setOptions(circleOptions);

		// 반경 정보를 표시할 커스텀오버레이의 내용입니다
		var radius = Math.round(drawingCircle.getRadius()), content = getTimeHTML(drawingCircle.getRadius());

		// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
		drawingOverlay.setPosition(markerPosition);

		// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
		drawingOverlay.setContent(content);

		// 그려지고 있는 원을 지도에 표시합니다
		drawingCircle.setMap(map);

		// 그려지고 있는 선을 지도에 표시합니다
		drawingLine.setMap(map);

		// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
		drawingOverlay.setMap(map);

		
	} else {

		drawingCircle.setMap(null);
		drawingLine.setMap(null);
		drawingOverlay.setMap(null);

	}
})()