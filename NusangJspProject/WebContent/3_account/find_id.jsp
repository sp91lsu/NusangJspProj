<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/find_id.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container">
		<h1 class="display-4 text-center mt-5">아이디 찾기</h1>
		<form action="" method="post"><!-- action값 설정! -->
			<div class="form-group w-50 container">
				<label for="name">이름 :</label> <input name="username"
					type="text" class="form-control" placeholder=""
					id="name">
			</div>
			
			<div class="form-group w-50 container">
				<label for="email">이메일:</label> <input name="password"
					type="password" class="form-control" placeholder=""
					id="email">
			</div>
			
			<div class="form-group w-50 container">
			<input class = "w-50 container"type="submit" value="아이디 찾기"><br>			
			</div>
		</form>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>