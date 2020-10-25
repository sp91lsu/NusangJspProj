<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너근마켓</title>
</head>


<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>


	<div class="container border border-dark mt-4 overflow-auto rounded-lg" style="height: 600px;">
		
		<div class="input-group w-50 container mt-4 ">
			<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!"> <span class="input-group-btn">
				<button class="btn btn-dark " type="button">찾기</button>
			</span>
		</div>
		<h1 class="mt-5" id="titleAddress"></h1>

		<!-- 카테고리, 글쓰기버튼 -->
		<div id="cate-post" class="d-flex">
			<div id="cate" class="mr-auto"></div>
			<button type="button" id="btnPost" onclick="location.href='/post/moveMkPost'">글쓰기</button>
		</div>
		
		<c:forEach var="i" begin="0" end="5">
			<div class="list-group mt-3">
				<a href="#" class="list-group-item list-group-item-action active bg-dark border-dark">XX동 다이소 책상 2000원</a> <a href="#" class="list-group-item list-group-item-action"> 2000원에 급처합니다. </a>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>
<script src="index.js">
	
</script>
