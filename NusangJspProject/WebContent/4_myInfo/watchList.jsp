<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/4_myInfo/css/watchList.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<div class="container">
	<h2>관심목록</h2>
	<br>
	<br>

	<c:forEach var="watch" items="${user.watchList }">
	<div class = "watchBox">
		<div class = "watch">

			<c:choose>
				<c:when test="${!empty watch.post.post_picture.getList()[0]}">
					<img id="card_img" alt="product image" src="/upload/${watch.post.post_picture.getList()[0]}" class="rounded-bottom">
				</c:when>
				<c:otherwise>
					<img id="card_img" alt="default image" src="/img/noImg.png" class="rounded-bottom">
				</c:otherwise>
			</c:choose>
			<div  class = "textBox" style = "font-family: 'Noto Sans KR', sans-serif; margin-left: 5px;" >
				<h5 class = "productname" style = "margin-top:10px;">${watch.post.productname}</h5>
				<p class = "price" style = "font-weight: bold;"><fmt:formatNumber value="${watch.post.price }" pattern="#,###" />원</p>
				<p class = "getStateStr" style = "margin-top:-5px;">${watch.post.getStateStr() }</p>
			</div>
				<button class = "move btn btn-warning" onclick = 'location.href="/post/readPost?postno=${watch.post.postno }"'>상품보러가기</button>
		</div>
		</div>
	</c:forEach>

	<br>
	<br>

	<!-- <nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	</ul>
</nav> -->
</div>