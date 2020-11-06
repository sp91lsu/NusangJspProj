<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/3_account/css/find_pw.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container" id="container">
		<h1 class="display-4 text-center mt-5">비밀번호 찾기</h1>
		<form action="" method="post">
			<!-- action값 설정! -->
			<div class="form-group w-50 container">
				<label for="name">이름 </label> <input name="username" type="text" class="form-control" placeholder="찾고자 하는 계정의 이름을 입력해주세요." id="username">
			</div>

			<div class="form-group w-50 container">
				<label for="id">아이디</label> <input name="userid" type="text" class="form-control" placeholder="찾고자 하는 계정의 아이디를 입력해주세요." id="userid">
			</div>

			<div class="form-group w-50 container">
				<label for="email">이메일</label> <input name="email" type="text" class="form-control" placeholder="찾고자 하는 계정의 이메일을 입력해주세요." id="email">
			</div>

			<div class="form-group w-50 container">
				<input class="w-50 container btn btn-primary" type="button" id="pwfindBtn" value="비밀번호 찾기"><br>
			</div>
		</form>

	</div>

	<script>
		$("#pwfindBtn").click(function() {

			$.ajax({
				url : "/user/findPw",
				type : "POST",
				data : {
					username : $("#username").val(),
					userid : $("#userid").val(),
					email : $("#email").val()
				},
				success : function(res) {

					if (res == 1) {
						alert("해당 메일로 비밀번호를 보냈습니다.");
						location.href = "/3_account/login.jsp"
					} else {
						alert("정보와 일치하는 사용자가 없습니다.");

					}
					
				}
			})

		})
	</script>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>