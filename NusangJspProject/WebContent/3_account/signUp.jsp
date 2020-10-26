<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container">
		<h1 class="display-4 text-center mt-5">회원가입</h1>
		<form method="post">
			<div class="form-group w-50 container">
				<label for="username">아이디</label>
				<div class="d-flex flex-row bg-secondary">
					<input name="userid" type="text" class="form-control "
						placeholder="" id="username">
					<button type="button" id="idChkBtn" class="btn btn-primary">중복확인</button>
				</div>
			</div>
			<div class="form-group w-50 container">
				<label for="password">패스워드</label> <input name="password"
					type="password" class="form-control" placeholder="비밀번호 8글자 이상"
					id="password">
			</div>

			<div class="form-group w-50 container">
				<label>패스워드 확인</label> <input type="password" class="form-control"
					placeholder="" id="password">
			</div>

			<div class="form-group w-50 container">
				<label for="username">닉네임</label> <input name="username" type="text"
					class="form-control" placeholder="" id="username">
			</div>

			<div class="form-group w-50 container">
				<label for="email">e-mail</label> <input name="email" type="text"
					class="form-control" placeholder="" id="email">
			</div>

			<div class="form-group w-50 container">
				<button type="submit" formaction="/user/signup" id="btn-login"
					class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>
<script>
	$("#idChkBtn").click(function() {
		let username = $("#username").val();
		$.ajax({
			url : "/user/idChk?uid=" + username,
			success : function(data) {
				alert(data);
			}
		})
	})
</script>