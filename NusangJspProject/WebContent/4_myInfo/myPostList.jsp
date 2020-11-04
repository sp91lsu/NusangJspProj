<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type= "text/css" href="/4_myInfo/css/myPostList.css" />

<div class="container">
	<h2>내 게시글</h2>
	<br> <br>
	<c:forEach var="post" items="${myPostList }">

		<div class = "cardbox" style = "width:12rem; float: left; ">
		<div class = "card">

			<c:choose>
				<c:when test="${!empty post.post_picture.getList()[0]}">
					<img id="card_img" alt="product image" src="/upload/${post.post_picture.getList()[0]}" class="rounded-bottom">
				</c:when>
				<c:otherwise>
					<img id="card_img" alt="default image" src="/img/noImg.png" class="rounded-bottom">
				</c:otherwise>
			</c:choose>
			<div class = "textBox">
				<h5 class = "productname">${post.productname}</h5>
				<p class = "price"><fmt:formatNumber value="${post.price }" pattern="#,###" />원</p>
				<p class = "getStateStr">${post.getStateStr() }</p>
			</div>
				<a href="/post/readPost?postno=${post.postno }" class="move btn btn-warning">상품보러가기</a>
		</div>
		</div>
	
	</c:forEach>

	
	<br> <br>


</div>