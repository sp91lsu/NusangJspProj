<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content {
	width: 600px;
}
</style>
</head>
<body>
	<div id="body" class="d-flex justify-content-center">
		<div id="content">
			<!-- 상품 이미지 -->
			<div id="demo" class="carousel" data-ride="carousel">
				<!-- indicator -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- carousel inner -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://www.w3schools.com/bootstrap4/la.jpg"
							alt="Los Angeles" width="500" height="270">
					</div>
					<div class="carousel-item">
						<img src="https://www.w3schools.com/bootstrap4/chicago.jpg"
							alt="Chicago" width="500" height="270">
					</div>
					<div class="carousel-item">
						<img src="https://www.w3schools.com/bootstrap4/ny.jpg"
							alt="New York" width="500" height="270">
					</div>

					<!-- pref, next -->
				</div>
				<a class="carousel-control-prev" data-slide="prev" href="#demo">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" data-slide="next" href="#demo">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>