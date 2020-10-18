<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container">

		<form action="/auth/loginProc" method="post">
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
				height="38px" src="../img/kakaoBtn.png"></a>
		</form>

	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>


</body>
</html>

