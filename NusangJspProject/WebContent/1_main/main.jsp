<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너근마켓</title>
<link rel="stylesheet" type="text/css" href="/1_main/css/postCard.css">
<script type="text/javascript" src="/1_main/main.js"></script>
</head>


<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>


	<div class="container border border-dark mt-4 overflow-auto rounded-lg" style="min-height: 1000px;">
		
		<div class="input-group w-50 container mt-4 ">
			<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!"> <span class="input-group-btn">
				<button class="btn btn-dark " type="button">찾기</button>
			</span>
		</div>
		<h1 class="mt-5" id="titleAddress" align = "center">너의 근처 ${location.getAddress() } 판매목록</h1>
		<br><hr>
		<!-- 카테고리, 글쓰기버튼 -->
		<div id="cate-post" class="d-flex">
			<div id="cate" class="mr-auto"></div>
			<button type="button" class="btn btn-dark" id="btnPost" onclick="location.href='/post/moveMkPost'">글쓰기</button>
		</div>
		
		<div id="postListSection" class="d-flex flex-wrap align-content-start justify-content-center">
			<c:forEach var="post" items="${postList}">
				<div id="postCard">
					<img id="card_img" alt="default image" src="/img/puppy.jpg">
					<h6 id="card_title">${post.title }</h6>
					<h6 id="card_price">${post.price }원</h6>
					<h7 id="card_addr">${post.user.location.name1} ${post.user.location.name2} ${post.user.location.name3}</h6><br>
					<h8 id="post_comment">댓글 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_interest">관심 [cnt]</h8>
					<h8>·</h8>
					<h8 id="post_view">조회 [cnt]</h8>
					<button class="btn btn-primary" onclick="location.href='/post/readPost?postno=${post.postno}'"> 글보기</button>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>
	
</script>
