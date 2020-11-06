<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/3_account/css/login.css" />
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container" id = "container">
		<h1 class="display-4 text-center mt-5">로그인</h1>
		<form action="/user/login" method="post">
			<div class="form-group w-50 container">
				<label for="userid">아이디</label> <input name="userid" type="text"
					class="form-control" placeholder="" id="userid" required="required">
			</div>

			<div class="form-group w-50 container">
				<label for="password">패스워드</label> <input name="password"
					type="password" class="form-control" placeholder="" id="password"
					required="required">
			</div>

			<div class="form-group w-50 container">
				<button id="btn-login" class="btn btn-primary">로그인</button>
				<a
					href="https://kauth.kakao.com/oauth/authorize?client_id=7ac03576a3ef2b30b8b6545b6b0daf1c&redirect_uri=http://localhost:8787/user/kakaologin&response_type=code"><img
					height="38px" src="../img/kakaoLoginBtn.png">
				</a>
				 <a
					href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=h3YOPfhFkTcn5ls8RX3g&state=STATE_STRING&redirect_uri=http://localhost:8787/user/naverlogin"><img
					height="38px" src="../img/naverLoginBtn.PNG">
				</a>
					<a id = "find_id" href="find_id.jsp">아이디 찾기</a>
					<a id = "find_pw" href="find_pw.jsp">비밀번호 찾기</a>
			</div>
					
		</form>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>
