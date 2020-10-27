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
		<form name="joinForm" action = "/user/signup" method="post" onsubmit = "return joinSubmit();">
			<div class="form-group w-50 container">
				<label for="username">아이디</label>
				<div class="d-flex flex-row bg-secondary">
					<input name="userid" type="text" class="form-control "
						placeholder="첫글자는 영어  6글자 이상" id="userid">
					<button type="button" id="idChkBtn" class="btn btn-primary">중복확인</button>
				</div>
			</div>
			<div class="form-group w-50 container">
				<label for="password">패스워드</label> <input name="password"
					type="password" class="form-control" placeholder="영어+특수문자+숫자를 섞어서 (8~16)자리"
					id="password">
			</div>

			<div class="form-group w-50 container">
				<label>패스워드 확인</label> <input name="passwordChk" type="password"
					class="form-control" placeholder="패스워드와 동일하게 " id="passwordChk">
			</div>

			<div class="form-group w-50 container">
				<label for="username">닉네임</label> <input name="username" type="text"
					class="form-control" placeholder="한글만 2~5자" id="username">
			</div>

			<div class="form-group w-50 container">
				<label for="email">e-mail</label> <input name="email" type="text"
					class="form-control" placeholder="중간에@섞어서" id="email">
			</div>

			<div class="form-group w-50 container">
				<button type="submit" id="btn-login" 
					class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>

<script>

	function joinSubmit(){
		var frm = document.forms.joinForm;
		var userid = frm.userid.value.trim();
		var password = frm.password.value.trim();
		var passwordChk = frm.passwordChk.value.trim();
		var username = frm.username.value.trim();
		var email = frm.email.value.trim();
		
			
		  var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{5,19}$/; //첫글자는 영어 6글자 이상
	      var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //영어+특수문자+숫자를 섞어서 (8~16)자리
	      var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	      var namePattern = /[가-힣]{2,5}/; //한글만 2~5자
	
		if(!idPattern.test(userid)){
			alert("아이디를 형식에 맞게 입력하세요.");
			return false;
		}
	    if(!pwPattern.test(password)){
			alert("비밀번호를 형식에 맞게 입력하세요.");
			return false;
		}
	    
	    if(password != passwordChk){
			alert("입력한 비밀번호와 다릅니다.");
			return false;
		}
	    if(!namePattern.test(username)){
			alert("닉네임을 형식에 맞게 입력하세요.");
			return false;
		}
	    
	    if(!emailPattern.test(email)){
			alert("이메일을 형식에 맞게 입력하세요.");
			return false;
		}
	    
	    return true;
	}
	
	

	$("#idChkBtn").click(function() {
		let username = $("#userid").val();
		$.ajax({
			url : "/user/idChk?uid=" + username,
			success : function(data) {
				alert(data);
			}
		})
	})
</script>