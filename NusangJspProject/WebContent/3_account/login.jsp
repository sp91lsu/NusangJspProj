<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container">

		<form action="/user/login" method="post">
			<div class="form-group">
				<label for="username">userName :</label> <input name="username"
					type="text" class="form-control" placeholder="Enter username"
					id="username">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input name="password"
					type="password" class="form-control" placeholder="Enter password"
					id="password">
			</div>


			<button id="btn-login" class="btn btn-primary">로그인</button>
			<a
				href="https://kauth.kakao.com/oauth/authorize?client_id=7ac03576a3ef2b30b8b6545b6b0daf1c&redirect_uri=http://localhost:8787/user/kakaologin&response_type=code"><img
				height="38px" src="../img/kakaoLoginBtn.png"></a> <a
				href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=h3YOPfhFkTcn5ls8RX3g&state=STATE_STRING&redirect_uri=http://localhost:8787/user/naverlogin"><img
				height="38px" src="../img/naverLoginBtn.PNG"></a>
		</form>

	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>


</body>
</html>
<script src="login.js">
	
</script>
