<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1db6aaded4b028f19067fca5394bb829"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/4_post/css/createPost.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	<div id="body" class="d-flex justify-content-center">
		<form name="createPostForm" action="/post/createPost" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data" style="width: 800px; background: #EAEAEA; margin-top: 30px; margin-left: 20px; border-radius: 20px 20px 20px 20px; padding: 0 20px 0 20px;">

			<input type="hidden" name="map_latitude" id="latitude" value="${location.latitude }"> <input type="hidden" name="map_longtitude" id="longtitude" value="${location.longtitude }">
			<%-- 결제관련 인풋 --%>
			<input type="hidden" name="pm_merchant_uid" id="pm_merchant_uid" /> <input type="hidden" name="pm_paymenttype" id="pm_paymenttype" /> <input type="hidden" name="pm_imp_uid" id="pm_imp_uid" /> <input type="hidden" name="pm_paid_amount" id="pm_paid_amount" />
			<div style="font-family: 'Noto Sans KR', sans-serif; margin-top: 25px;">
				<%-- 이미지 --%>
				상품 사진
				<button class="btn btn-secondary btn-sm" type="button" id="btnAdd">사진 추가</button>
				<div id="files"></div>


				<div id="imgPreview"></div>
				<br>
				<%-- 글제목 --%>
				<div style="margin-top: -5px;">
					제목 <input type="text" name="title" style="width: 300px;" required="required" />
				</div>
				<div style="margin-top: 20px;">
					상품명 <input type="text" name="productName" required="required" />
				</div>
				<%-- 카테고리 --%>
				<jsp:include page="/0_common/data.jsp"></jsp:include>
				<%
					String cate[] = (String[]) request.getAttribute("arr_cate");
				%>

				<br> 카테고리
				<div class="dropdown">
					<button id="cateDrop" class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
						선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<c:forEach var="ct" items="<%=cate%>">
							<li class="dropdown-item" href="#" onclick="changeCateName('${ct}')">${ct}</li>
						</c:forEach>
					</ul>
				</div>
				<span></span> <input type="hidden" name="category" value="" required="required"> <br>

				<script type="text/javascript">
					function changeCateName(choice) {
						$("#cateDrop").text(choice);
						$("input[name='category']").attr('value', choice);
					}
				</script>

				<%-- 가격 --%>
				<div style="margin-top: 20px;">
					가격 <input type="number" name="price" required="required" /><br>
				</div>
				<%-- 글내용 --%>
				<div style="margin-top: 20px;">
					<label for="bodytext">내용</label><br>
					<textarea name="bodytext" class="form-control" rows="5" required="required"></textarea>
					<br>
				</div>
				<%-- 지도 : 거래장소 설정 --%>
				<h4 style="margin-bottom: 10px;">
					<img id="l_icon" src="/img/location_icon.png">만날 장소를 지정해 주세요
				</h4>
				<div align=center>
					<div id="map" style="width: 650px; height: 400px;"></div>
				</div>
				<script>
					// 마커가 표시될 위치입니다 
					var position = new kakao.maps.LatLng($("#latitude").val(),
							$("#longtitude").val());

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : position
					});

					// 마커가 지도 위에 표시되도록 설정합니다

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(position.getLat(),
								position.getLng()), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);
					map.setCenter(position);
					marker.setMap(map);

					kakao.maps.event.addListener(map, 'click', function(
							mouseEvent) {

						// 클릭한 위도, 경도 정보를 가져옵니다 
						var latlng = mouseEvent.latLng;

						// 마커 위치를 클릭한 위치로 옮깁니다
						marker.setPosition(latlng);
						$("#latitude").val(latlng.getLat())
						$("#longtitude").val(latlng.getLng())
						console.log($("#latitude").val());
						console.log($("#longtitude").val());

					});
				</script>
				<div id="dealingSpot"></div>
				<div align=center style="margin-top: 20px; margin-bottom: 20px;">
					<button type="button" class="btn btn-success btn-lg" onclick="location.href = '/main/index'">목록으로</button>
					&nbsp;&nbsp;&nbsp; <input id="buyBtn" class="btn btn-primary btn-lg" type="button" value="등록" />
				</div>
		</form>
	</div>
	</div>


	<jsp:include page="../0_common/modalOneBtn.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_createPost", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("게시글 등록 결제", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("결제가 완료되었습니다.", "UTF-8")%>' />
	</jsp:include>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>


</body>
<script type="text/javascript" src="/4_post/js/createPost.js">
	
</script>

</html>




