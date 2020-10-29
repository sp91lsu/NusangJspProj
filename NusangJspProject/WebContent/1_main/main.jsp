<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nusang.controller.assistance.ConAsist"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너근마켓</title>
<link rel="stylesheet" type="text/css" href="/1_main/css/postCard.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Single+Day&display=swap" rel="stylesheet">
</head>
<script>
				/* 	 	$("#1km").click(function(){
							var onekm = $("#1km").val();
							$.ajax({
								url : "/myinfo/distance",
							
								
							})
						})
						 */
			
	function func1(number) {
		$("#dropdownMenu2").text(number+"km");
		location.href="<%= ConAsist.SERVLET_MYINFODISTANCE %>?num="+number;
		
	}
</script>

<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div style = "background: #EEE; width: 100%; margin-top : -50px;  ">
		<h1 class="mt-5" id="titleAddress" align = "center" style = "padding-top: 50px;"><span style = "font-family: 'Do Hyeon', sans-serif;font-size:50px; color: #1DDB16">너의 근처</span> ${location.getAddress() } 판매목록</h1>
		<div class="input-group w-50 container mt-4 ">
			<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!"> <span class="input-group-btn">
				<button class="btn btn-dark " type="button" style = "background: #10620A;">찾기</button>
			</span>
			<div class="dropdown">
						  <button class="btn btn-info dropdown-toggle btn-sm" type="button" id="dropdownMenu2"
						   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    반경 설정
						  </button>
						  <c:set var="arr" value='<%= new String[]{"1","3","5","10"} %>'/>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						  	<c:forEach items="${arr}" var="num">
							    <button class="dropdown-item" type="button" id = "${num }km" value = "${num }" onclick = "func1('${num }')">${num }km</button>
						  	</c:forEach>
						  </div>
						</div>
						
		</div>
		<div id="cate-post" class="d-flex">
			<div id="cate" class="mr-auto"></div>
			<button type="button" class="btn btn-dark" id="btnPost"  style = "background: #10620A;" onclick="location.href='/post/moveMkPost'">글쓰기</button>
		</div>
	</div>
	<div class="container" style="min-height: 1000px;">
		
		<!-- 카테고리, 글쓰기버튼 -->
		
		<div id="postListSection" class="d-flex flex-wrap align-content-start justify-content-center" style = "margin-top: 50px;">
			<c:forEach var="post" items="${postList}">
				<div id="postCard">
					<img id="card_img" alt="default image" src="/img/puppy.jpg" class ="rounded-bottom" style = "height:150px; margin-bottom:0px;">
					<div style = "box-shadow: 0px 0px 3px 1px #EAEAEA">
					<h6 id="card_title" style = "padding-top : 20px">${post.title }</h6>
					<h6 id="card_price">${post.price }원</h6>
					<h7 id="card_addr">${post.location.getAddress()}</h6><br>
					<h8 id="post_comment">댓글 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_interest">관심 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_view">조회 [cnt]</h8>
					<button id = "viewBtn" class="btn btn-success" style = "width:190px; margin-top:10px;" onclick="location.href='/post/readPost?postno=${post.postno}'"> 글보기</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>
					
