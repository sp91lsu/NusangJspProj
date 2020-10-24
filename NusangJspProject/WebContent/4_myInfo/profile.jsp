<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" type="text/css" href="../css/profile.css">


<div class="container justify-content-center">
	<div class="card" style="width: 20rem;">
		<img src="../img/프로필 기본이미지.jpg" class="card-img-top" alt="...">
		<div class="card-body">
			<h5 class="card-title">${user.username}</h5>
		</div>
	</div>

	<div id="update" class="d-flex row">
		<button type="button" class="btn btn-lg btn-primary">사진 변경</button>
		<button type="button" class="btn btn-secondary btn-lg"
			style="margin-left: 10px;">닉네임 변경</button>
	</div>
</div>