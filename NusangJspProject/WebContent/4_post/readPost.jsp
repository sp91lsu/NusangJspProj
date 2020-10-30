<%@page import="com.nusang.dto.User"%>
<%@page import="com.nusang.dto.Post"%>
<%@page import="com.nusang.controller.assistance.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/4_post/css/readPost.css">
<link rel="stylesheet" type="text/css" href="../css/comments.css">
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	<script type="text/javascript" src="/4_post/js/readPost2.js"></script>

	<div id="body" class="d-flex justify-content-center">
		<div id="content">

			<!-- 유저 섹션 -->
			<div id="Section-sellerInfo" class="d-flex ">
				<!-- 프로필 -->
				<div id="profile" class="d-flex mr-auto">
					<div id="profile_left">
						<i id="profile_img" class="fas fa-user-circle fa-4x"></i>
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
				<button id="button11">버튼</button>
				<!-- 버튼 영역 as 구매자or판매자 -->
				<div id="buyer_seller" class="d-flex align-items-center">
					<c:choose>
						<c:when test="${user.userid == post.user.getUserid()}">
							<!--내 글이면(판매자)-->
							<div class="dropdown">
								<!-- 거래신청 현황 드롭다운메뉴 -->
								<button id="status" class="btn dropdown-toggle" type="button" data-toggle="dropdown">
									거래신청 현황 <span class="caret"></span>
								</button>
								<ul id="resvList" class="dropdown-menu">
									<c:forEach var="resv" items="${post.reservationList}">
										<li class="dropdown-item" href="#" ><!-- nclick="mkResv()" -->
										
											<input type="hidden" value="${resv.reser_price}">
											${resv.user.nickname} : <span></span>원 
											<button class="resvBtn btn btn-primary">예약</button>
										</li>
									</c:forEach>
								</ul>
							</div>

							<div id="btnArea">
								<!-- 글 수정,삭제버튼 -->
								<button id="uptPost" class="btn btn-primary" onclick="location.href='<%= ConAsist.SERVLET_UPDATEPOST %>?postno=${post.postno}'">글 수정</button>
								<button id="delPost" class="btn btn-primary" onclick="chkDelete('${post.postno}')">글 삭제</button>

							</div>
						</c:when>


						<c:otherwise>
							<!-- 구매자 -->
							<div id="buyerBtn" class="d-flex flex-column">
								<div>
									거래상태 현황 <br> :${post.sellstate}
								</div>
								<%
									request.setAttribute("post", request.getAttribute("post"));
								%>
								<input type="number" id="reser_price"> <input type="hidden" id="reser_postno" value="${post.postno }">
								<button id="buy_reservationBtn" class="btn btn-primary"">가격 제시</button>

							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<hr class="m-0">

			<!-- 상품 관련 섹션 -->
			<div id="Section-post" class="d-flex">
				<!-- 상품 내용 -->
				<div class="mr-auto">
					<!-- 글제목 -->
					<h4 id="post_title">${post.title}</h4>
					<!-- 카테고리 & 시간 -->
					<div id="post_cate-time" class="d-flex">
						<h6 id="post_category">${post.category}</h6>
						<h6>·</h6>
						<h6 id="post_time">시간정보</h6>
					</div>
					<!-- 가격 -->
					<h5 id="post_price">${post.price}원</h5>
	
					<!-- 글 내용 -->
					<p id="post_writing">${post.bodytext}</p>
	
					<!-- 댓글,관심,조회 -->
					<div id="post_co&in&vi" class="d-flex">
						<h8 id="post_comment">댓글 [cnt]</h8>
						<h8>·</h8>
						<h8 id="post_interest">관심 [cnt]</h8>
						<h8>·</h8>
						<h8 id="post_view">조회 [cnt]</h8>
					</div>
				</div>
				
				<!-- 찜하기 버튼 -->
				<div id="wishitem" style="padding-top:135px;">
					찜하기
					<button>
						<i class="fas fa-heart"></i>
					</button>
				</div>

				<br>
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
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1db6aaded4b028f19067fca5394bb829"></script>
			<input type="hidden" id="latitude" value="${post.location.latitude }"> <input type="hidden" id="longtitude" value="${post.location.longtitude }">
			<script src="/4_post/js/readPost_Map.js?v=<%=System.currentTimeMillis()%>"></script>
			<script src="/4_post/js/readPost.js?v=<%=System.currentTimeMillis()%>"></script>
			<br>

			<!-- 댓글 섹션 -->
			<jsp:include page="../0_common/comments.jsp?postno=${post.postno}"></jsp:include>
		</div>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>