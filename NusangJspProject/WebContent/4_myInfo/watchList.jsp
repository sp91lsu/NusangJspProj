<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" style="margin-left: 100px;">
	<h2>관심목록</h2>
	<br>
	<br>

	<c:forEach var="watch" items="${user.watchList }">

		<div class="card mr-4" style="width: 10rem; float: left;">

			<c:choose>
				<c:when test="${!empty watch.post.post_picture.getList()[0]}">
					<img id="card_img" alt="product image" src="/upload/${watch.post.post_picture.getList()[0]}" class="rounded-bottom" style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA;">
				</c:when>
				<c:otherwise>
					<img id="card_img" alt="default image" src="/img/noImg.png" class="rounded-bottom" style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA">
				</c:otherwise>
			</c:choose>
			<div class="card-body">
				<h5 class="card-title">${watch.post.productname}</h5>
				<p class="card-text">${watch.post.price }</p>
				<p class="card-text">${watch.post.getStateStr() }</p>
				<a href="/post/readPost?postno=${watch.post.postno }" class="btn btn-primary">상품보러가기</a>
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