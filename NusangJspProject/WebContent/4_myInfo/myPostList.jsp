<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container" style="margin-left: 100px;">
	<h2>내 게시글</h2>
	<br> <br>
	<c:forEach var="post" items="${myPostList }">

		<div style = "width:12rem; float: left; ">
		<div style="width: 10rem;margin-bottom: 20px; border-radius: 15px;box-shadow: 0px 0px 7px 1px #EAEAEA;">

			<c:choose>
				<c:when test="${!empty watch.post.post_picture.getList()[0]}">
					<img id="card_img" alt="product image" src="/upload/${watch.post.post_picture.getList()[0]}" class="rounded-bottom" style="width: 10rem;height: 150px; border-radius:15px;margin-bottom: 0px;box-shadow: 0px 0px 7px 1px #EAEAEA;">
				</c:when>
				<c:otherwise>
					<img id="card_img" alt="default image" src="/img/noImg.png" class="rounded-bottom" style="width: 10rem;height: 150px;border-radius:15px; margin-bottom: 0px;box-shadow: 0px 0px 7px 1px #EAEAEA">
				</c:otherwise>
			</c:choose>
			<div style = "font-family: 'Noto Sans KR', sans-serif; margin-left: 5px;" >
				<h5 style = "margin-top:10px;">${post.productname}</h5>
				<p style = "font-weight: bold;"><fmt:formatNumber value="${post.price }" pattern="#,###" />원</p>
				<p style = "margin-top:-5px;">${post.getStateStr() }</p>
			</div>
				<a href="/post/readPost?postno=${post.postno }" class="btn btn-warning" style = "width:10rem;margin-left: -1px;">상품보러가기</a>
		</div>
		</div>
	
	</c:forEach>

	
	<br> <br>

	<!-- <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav> -->
</div>