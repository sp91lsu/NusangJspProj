<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/3_account/css/signUp.css" />
</head>

<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container" id = "container">
		<h1 class="display-4 text-center mt-5">회원가입</h1>
		<form name="joinForm" action = "/user/signup" method="post" onsubmit = "return joinSubmit();">
			<div class="form-group w-50 container">
				<label for="username">아이디</label>
				<div class="d-flex flex-row">
					<input name="userid" type="text" class="form-control "
						placeholder="첫글자는 영어, 4글자 이상" id="userid">
						<div class = "marginLeft">
					<button type="button" id="idChkBtn" class="btn btn-primary">중복확인</button>
					</div>
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
				<label for="username">이름</label>
				<div class="d-flex flex-row">
				 <input name="username" type="text"
					class="form-control" placeholder="한글만 2~6자" id="username">
					<div class = "marginLeft" >
					<button type="button" id="nameChkBtn" class="btn btn-primary">중복확인</button>
					</div>
					</div>
			</div>

			<div class="form-group w-50 container">
				<label for="email">e-mail</label> <input name="email" type="text"
					class="form-control" placeholder="중간에@섞어서" id="email">
			</div>

			<div class="form-group w-50 container" align = "center">
				<button type="submit" id="btn-login" 
					class="btn btn-success btn-lg">회원가입</button>
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
	      var namePattern = /^[가-힣]{2,6}$/; //한글만 2~6자
	
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
	    if(idchk == false){
	    	alert("아이디 중복확인 하세요.");
	    	return false;
	    }
	    if(nameChk == false){
	    	alert("닉네임 중복확인 하세요.");
	    	return false;
	    }
	    if(userid != useridchk){
	    	alert("아이디 중복확인 하세요.")
	    	return false;
	    }
	    if(username != userNameChk){
	    	alert("닉네임 중복확인 하세요.")
	    	return false;
	    }
	    alert("회원가입을 축하드립니다♥");
	    return true;
	}
	
	var idchk = false;
	let useridchk = "";
	$("#idChkBtn").click(function() {
		useridchk = $("#userid").val();
		$.ajax({
			url : "/user/idChk?uid=" + useridchk,
			success : function(data) {
				if(data == "0"){
					alert("아이디를 입력해 주세요.");
					idchk = false;
				}else if(data == "1"){
					alert("사용가능한 아이디 입니다.");
					idchk = true;
				}		
				else{
					alert("중복된 아이디 입니다.");
					idchk = false;
				}
			}
		})
	})
	
	var nameChk = false;
	let userNameChk = "";
	$("#nameChkBtn").click(function(){
		userNameChk = $("#username").val();
		$.ajax({
			url : "/user/nameChk?uName=" + userNameChk,
			success : function(data){
				if(data == "0"){
					alert("닉네임을 입력해주세요");
					nameChk = false;
				}else if(data == "1"){
					alert("사용가능한 닉네임 입니다.");
					nameChk = true;
				}else if(data == "2"){
					alert("중복된 닉네임 입니다.")
					nameChk = false;
				}else{
					alert("닉네임은 한글만 2자 이상 6자 이하로 사용 가능합니다.")
					nameChk = false;
				}
			}
		})
	})
</script>