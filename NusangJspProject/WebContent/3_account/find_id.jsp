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
		<div class="form-group w-50 container">
			<label for="name">이름 :</label> <input name="username"  type="text"
				class="form-control" placeholder="찾고자 하는 아이디의 이름을 입력하세요." id="username">
		</div>

		<div class="form-group w-50 container">
			<label for="email">이메일:</label> <input name="email" type="email"
				class="form-control" placeholder="찾고자 하는 아이디의 이메일을 입력하세요."
				id="email">
		</div>

		<div class="form-group w-50 container">
			<input class="w-50 container" type="button" id="findBtn"
				value="아이디 찾기"><br>
		</div>
	</div>
	<script type="text/javascript">
		$("#findBtn").click(function() {

			$.ajax({
				url : "/user/findId",
				type : "POST",
				data : {
					username : $("#username").val(),
					email : $("#email").val()
				},
				success : function(res){
					
					alert(res);
				}
			})
		})
	</script>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>