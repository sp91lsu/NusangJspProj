<%@page import="com.nusang.dto.User"%>
<%@page import="com.nusang.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/4_post/css/readBuyer.css">
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	
	<div id="body" class="d-flex justify-content-center">
		<div id="content">
			<!-- 상품 이미지 -->
			<div id="Section-prodImg">
				<div id="myCarousel" class="carousel slide">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li class="item1 active"></li>
						<li class="item2"></li>
						<li class="item3"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="https://www.w3schools.com/bootstrap4/la.jpg"
								alt="Los Angeles" width="1100" height="500">
						</div>
						
						<div class="carousel-item">
							<img src="https://www.w3schools.com/bootstrap4/chicago.jpg"
								alt="Chicago" width="1100" height="500">
						</div>
						
						<div class="carousel-item">
							<img src="https://www.w3schools.com/bootstrap4/ny.jpg"
								alt="New York" width="1100" height="500">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#myCarousel"> <span
						class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#myCarousel"> <span
						class="carousel-control-next-icon"></span>
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
			
			<!-- 판매자 정보 -->		
			<div id="Section-sellerInfo">
				<div id="profile" class="d-flex">
					<div id="profile_left">
						<i id="profile_img" class="fas fa-user-circle fa-4x"></i>
					</div>
					
					<div id="profile_right">
						<div>
							<h5 id="profile_name">${post.user.username}</h5>
						</div>
						
						<div>
							<h6 id="profile_addr">${post.user.location.name1} ${post.user.location.name2} ${post.user.location.name3}</h6>
						</div>
					</div>
					
					<div>
						<c:choose>
							<c:when test="${user.userid == post.user.getUserid()}"><!--내 글이면-->
								내 글이다
							</c:when>
								
							<c:otherwise>
								내 글이 아니다
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<hr class="m-0">
			<!-- 상품 내용 -->
			<div id="Section-post">
				<h4 id="post_title">${post.title}</h4>
				<div id="post_cate-time" class="d-flex">
					<h6 id="post_category">${post.category}</h6>
					<h6>·</h6>
					<h6 id="post_time">시간정보</h6>
				</div>
				<h5 id="post_price">${post.price}원</h5>
				<p id="post_writing">${post.bodytext}</p>
				<div id="post_co&in&vi" class="d-flex">
					<h8 id="post_comment">댓글 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_interest">관심 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_view">조회 [cnt]</h8>
				</div>
			</div>
			<hr class="m-0">
			<jsp:include page="../0_common/comment.jsp"></jsp:include>
		</div>
	</div>
	
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>