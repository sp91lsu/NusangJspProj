<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.nusang.dto.User"%>
<%@page import="com.nusang.dto.Post"%>
<%@page import="com.nusang.controller.assistance.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<style>
.info {
	position: relative;
	top: 5px;
	left: 5px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	font-size: 12px;
	padding: 5px;
	background: #fff;
	list-style: none;
	margin: 0;
}

.info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .label {
	display: inline-block;
	width: 50px;
}

.number {
	font-weight: bold;
	color: #00a0e9;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/4_post/css/readPost.css">
<link rel="stylesheet" type="text/css" href="../css/comments.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">
	<input type="hidden" id="postno" value="${post.postno }">


	<jsp:include page="../0_common/header.jsp"></jsp:include>

	
	<!-- 센터 영역 -->
	<div id="body" class="d-flex justify-content-center">
		<div id="content" style="width: 800px;">

			<!-- 유저 섹션 -->
			<div id="Section-sellerInfo" class="d-flex ">
				<!-- 프로필 -->
				<div id="profile" class="d-flex mr-auto" style="width: 240px; border-right: 1px solid lightgray;">
					<div id="profile_left">


						<img style="border-radius: 70%; overflow: hidden; height: 70px; width: 70px;" src='/upload/${post.user.picture}'>

					</div>

					<div id="profile_right">
						<div>
							<h5 id="profile_name">${post.user.nickname}</h5>
						</div>

						<div>
							<h6 id="profile_addr">${post.location.getAddress()}</h6>
						</div>
					</div>
				</div>

				<!-- <button id="button11">버튼</button> -->
				<c:choose>
					<c:when test="${post.sellstate == 0 }">
						<div class="d-flex mr-auto" style="font-size: 30px; margin-top: 30px;">판매중</div>
					</c:when>
					<c:when test="${post.sellstate == 1 }">
						<c:if test="${user.userno != post.user.userno }">
							<div class="d-flex mr-auto" style="font-size: 30px; margin-top: 30px;">예약중</div>
						</c:if>
						<div align="center" style="margin-top: 23px; margin-right: 30px;">
							<span style="font-weight: bold; font-size: 20px;">구매 예약자 </span><br> <span style="color: #22741C; font-size: 20px;"> ${post.getReserUser().nickname }</span>
						</div>
						<c:if test="${user.userno == post.user.userno }">
							<button class="btn btn-dark btn-sm" id="sellPostBtn" value="${post.getCurReservation().reserno }">판매하기</button>
							<button class="cancel_reser btn btn-danger btn-sm" value="${post.getCurReservation().reserno }">등록취소</button>
						</c:if>
					</c:when>
					<c:when test="${post.sellstate == 2 }">
						<div style="font-size: 30px; margin-right: 340px; margin-top: 30px;">판매 완료</div>
					</c:when>
				</c:choose>
				<!-- 버튼 영역 as 구매자or판매자 -->
				<c:if test="${post.sellstate != 2}">
					<div id="buyer_seller" class="d-flex align-items-center">
						<c:choose>
							<c:when test="${user.userno == post.user.userno}">
								<!--내 글이면(판매자)-->
								<div class="dropdown">
									<!-- 거래신청 현황 드롭다운메뉴 -->
									<c:choose>
										<c:when test="${empty post.reservationList}">
											<button id="status" class="btn dropdown-toggle" type="button" data-toggle="dropdown">
												거래신청 현황 <span class="caret"></span>
											</button>
										</c:when>
										<c:otherwise>
											<button id="status" class="btn dropdown-toggle reserStatus" type="button" data-toggle="dropdown" style="box-sizing: border-box; border: 2px solid green;">
												거래신청 현황 <span class="caret"></span>
											</button>
										</c:otherwise>
									</c:choose>
									<ul id="resvList" class="dropdown-menu" style="background: #F6F6F6;">
										<c:forEach var="resv" items="${post.reservationList}">
											<li class="dropdown-item">
												<!-- nclick="mkResv()" --> <input type="hidden" value="${resv.reser_price}"> ${resv.user.nickname} : <span>${resv.reser_price}</span>원 <c:choose>

													<c:when test="${resv.state == 0}">
														<button class="resvBtn btn btn-warning btn-sm" style="margin: 0 0 5px 10px" value="${resv.reserno }">구매자 등록</button>

													</c:when>
													<c:when test="${resv.state == 1}">
													 예약됨
													</c:when>
												</c:choose>

											</li>
										</c:forEach>
									</ul>
								</div>

								<div id="btnArea">
									<!-- 글 수정,삭제버튼 -->
									<button id="uptPost" class="btn btn-primary btn-sm" onclick="location.href='<%= ConAsist.SERVLET_UPDATEPOST %>?postno=${post.postno}'">글 수정</button>
									<button id="delPost" class="btn btn-secondary btn-sm" onclick="chkDelete('${post.postno}')">글 삭제</button>

								</div>
							</c:when>

							<c:otherwise>
								<!-- 구매자 -->
								<div id="buyerBtn" class="d-flex flex-column">
									<%
										request.setAttribute("post", request.getAttribute("post"));
									%>

									<c:choose>
										<c:when test="${user.getReservation(post.postno) != null }">
											나의 예약신청 금액 : ${user.getReservation(post.postno).reser_price}
											<button id="delete_reservation" class="btn btn-danger" style="margin-top: 10px;" value="${user.getReservation(post.postno).reserno }">예약 취소</button>
										</c:when>
										<c:otherwise>
											<input type="number" id="reser_price">
											<button id="buy_reservationBtn" class="btn btn-primary btn-sm" style="margin-top: 3px;">가격 제시</button>
											<button id="buy_reservationBtn_submit" style="display: none;"></button>
										</c:otherwise>

									</c:choose>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
			</div>

			<hr class="m-0">
			<c:choose>
				<c:when test="${post.user.evaluation_cnt > 0 }">
					<div class="star-box">

						<input type="hidden" id="star_cnt" value="${post.user.star_cnt }"> <input type="hidden" id="eval_num" value="${post.user.evaluation_cnt }"> <span class="star star_left"></span> <span class="star star_right"></span> <span class="star star_left"></span> <span class="star star_right"></span> <span class="star star_left"></span> <span class="star star_right"></span> <span class="star star_left"></span> <span class="star star_right"></span> <span class="star star_left"></span> <span
							class="star star_right"></span>
					</div>
				</c:when>
				<c:otherwise>
		평가 없음
		</c:otherwise>
			</c:choose>
			<script type="text/javascript">
				var eval_num = Number($("#eval_num").val());
				var star_cnt = (Number($("#star_cnt").val()) / eval_num);

				console.log("받은 평가 갯수 : " + eval_num);
				console.log("총 받은 점수 : " + Number($("#star_cnt").val()));
				
				var object_cnt = 0;
				for (var i = 0.5; i <= star_cnt; i += 0.5) {
					$(".star").eq(object_cnt).addClass("on");
					console.log("object_cnt" +object_cnt)
					object_cnt++;
				}
			</script>
			<!-- 상품 관련 섹션 -->
			<div id="Section-post" class="d-flex">
				<!-- 상품 내용 -->
				<div class="mr-auto">
					<!-- 글제목 -->
					<h4 id="post_title">${post.title}</h4>
					<!-- 상품명 -->
					<h4>${post.productname}</h4>
					<!-- 카테고리 & 시간 -->
					<div id="post_cate-time" class="d-flex" style="margin-top: 10px;">
						<h6 id="post_category">${post.category}</h6>
						<h6>&nbsp·&nbsp</h6>
						<h6 id="post_time">${post.calcTime() }</h6>
					</div>
					<!-- 가격 -->
					<div style="padding-top: 5px; padding-bottom: 5px;">
						<h5 id="post_price" style="font-weight: bold;">
							<fmt:formatNumber value="${post.price }" pattern="#,###" />
							원
						</h5>
					</div>
					<!-- 글 내용 -->
					<p id="post_writing">${post.bodytext}</p>

					<!-- 댓글,관심,조회 -->
					<div id="post_co&in&vi" class="d-flex">
						<%-- <h8 id="post_comment">댓글 [${post.replyList.size() }]</h8> --%>
						<!-- 	<h8>·</h8> -->
						<input type="hidden" id="watchCnt" value="${post.watchList.size() }">
						<h8 id="post_interest">관심 [${post.watchList.size() }]</h8>
						<h8>·</h8>
						<h8 id="post_view">조회 [${post.viewcnt }]</h8>
					</div>
				</div>

				<!-- 찜하기 버튼 -->
				<input type="hidden" id="isWatchPost" value="${ user.findWatch(post.postno) != null }"> <input type="hidden" id="watchno" value="${ user.findWatch(post.postno) != null }"> 찜하기 <i id="heart_icon" style="cursor: pointer; margin: 5px 0 0 5px;"></i> <br>
				<hr class="m-0">
				<br>
			</div>

			<!-- 상품 이미지 -->
			<div id="Section-prodImg">
				<div id="myCarousel" class="carousel slide">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<c:forEach var="name" items="${post.post_picture.getList()}" varStatus="status">
							<c:if test="${!empty name && status.count == 1}">
								<li class="item${status.count} active"></li>
							</c:if>
							<c:if test="${!empty name && status.count != 1}">
								<li class="item${status.count}"></li>
							</c:if>
						</c:forEach>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<c:set var="imgCkh" value="0" />
						<c:forEach var="name" items="${post.post_picture.getList()}" varStatus="status">
							<c:if test="${!empty name && status.count == 1}">
								<div class="carousel-item active">
									<img src="/upload/${name }" alt="..">
								</div>
							</c:if>
							<c:if test="${!empty name && status.count != 1}">
								<div class="carousel-item">
									<img src="/upload/${name }" alt="..">
								</div>
							</c:if>
							<c:if test="${empty name}">
								<c:set var="imgCkh" value="${imgCkh + 1}" />
								<c:if test="${imgCkh eq 5}">
									<div class="carousel-item active">
										<img src="/img/noImg.png" alt="..">
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#myCarousel"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#myCarousel"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>

				<script>
					$(document).ready(function() {
						// Activate Carousel
						$("#myCarousel").carousel();

						// Enable Carousel Indicators
						$(".item1").click(function() {
							$("#myCarousel").carousel(0);
						})
						$(".item2").click(function() {
							$("#myCarousel").carousel(1);
						})
						$(".item3").click(function() {
							$("#myCarousel").carousel(2);
						})
						$(".item4").click(function() {
							$("#myCarousel").carousel(3);
						})
						$(".item5").click(function() {
							$("#myCarousel").carousel(4);
						})

						// Enable Carousel Controls
						$(".carousel-control-prev").click(function() {
							$("#myCarousel").carousel("prev")
						})
						$(".carousel-control-next").click(function() {
							$("#myCarousel").carousel("next")
						})

					});
				</script>
			</div>
			<br>

			<!-- 지도 -->
			<h3 style="margin-bottom: 5px;">
				<img id="l_icon" src="/img/location_icon.png">여기에서 만나요
			</h3>
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eef850b20845c897933701b883df3a35"></script>
			<input type="hidden" id="latitude" value="${post.location.latitude }"> <input type="hidden" id="longtitude" value="${post.location.longtitude }"> <br>
			<script type="text/javascript">
				var la = $('#latitue').val();
				var lo = $('#longtitude').val();
				console.log("latitue: "+la);
				console.log("longtitude: "+lo);
			</script>
			<!-- 댓글 섹션 -->
			<jsp:include page="../0_common/comments.jsp?postno=${post.postno}"></jsp:include>
		</div>
	</div>

	<!-- 우측 고정 영역 -->
	<div id="fixed">
		<div id="f_head">유사 상품</div>
		<div class="test111"></div>
		<div class="test111"></div>
		<div class="test111"></div>
	</div>
	
	<jsp:include page="../0_common/modal.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_sell", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("판매", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("판매시 되돌릴 수 없습니다. 정말로 판매하시겠습니까?", "UTF-8")%>' />
	</jsp:include>


	<jsp:include page="../0_common/modal.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_refund", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("환불", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("10분 이내 게시글 삭제시 환불처리됩니다. 삭제하시겠습니까?", "UTF-8")%>' />
	</jsp:include>

	<jsp:include page="../0_common/modal.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_reservation", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("구매 예약 신청", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("구매 예약 신청하시겠습니까?", "UTF-8")%>' />
	</jsp:include>

	<jsp:include page="../0_common/modal.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_delete_reservation", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("구매 예약 취소", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("구매 예약을 취소하시겠습니까?", "UTF-8")%>' />
	</jsp:include>

	<input id="userLongtitude" type="hidden" value="${user.location != null ? user.location.longtitude : location.longtitude}">
	<input id="userLatitude" type="hidden" value="${user.location != null ? user.location.latitude : location.latitude}">
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/4_post/js/readPost2.js"></script>
	<script src="/4_post/js/readPost_Map.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="/4_post/js/readPost.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>