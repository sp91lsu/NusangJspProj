<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/4_myInfo/css/profile.css">


<div class="section1">

	<h2 id="profile">프로필 수정</h2>

	<!-- 프로필 사진 영역 -->
	<c:choose>
		<c:when test="${empty user.picture}">
			<img src="/upload/profile.png" alt="..." id="profileImg">
		</c:when>
		<c:otherwise>
			<img src="/upload/${user.picture}" alt="..." id="profileImg">
		</c:otherwise>
	</c:choose>
</div>

<div class="section2">

	<!-- 닉네임 & 닉네임변경버튼 -->
	<div class="nicknameSec">
		<form>
			<input class="nickName" name="nickName" type="text" id="userNickname" value=${user.nickname } />

			<button type="button" id="nicknameChange" class="btn btn-success btn-sm">닉네임 변경</button>
		</form>
	</div>
	<c:choose>
		<c:when test="${user.evaluation_cnt > 0 }">
			<div class="star-box">

				<input type="hidden" id="star_cnt" value="${user.star_cnt }">
				<input type="hidden" id="eval_num" value="${user.evaluation_cnt }">
				
				 <span class="star star_left"></span> 
				 <span class="star star_right"></span>
				  <span class="star star_left"></span>
<span class="star star_right"></span> <span class="star star_left"></span>
 <span class="star star_right"></span> <span class="star star_left"></span> 
 <span class="star star_right"></span> <span class="star star_left"></span>
  <span class="star star_right"></span>
			</div>
		</c:when>
		<c:otherwise>
		평가 없음
		</c:otherwise>
	</c:choose>
	<script>
		$("#nicknameChange").click(function() {
			var userNickname = $("#userNickname").val();
			$.ajax({
				url : "/myinfo/nickname_change?nickName=" + userNickname,
				success : function(data) {
					if (data == "success") {
						alert("닉네임이 변경 되었습니다.")
					} else if (data == "fail1") {
						alert("닉네임은 한글만 2자 이상 6자 이하로 변경 가능합니다.")
					} else {
						alert("이미 사용중인 닉네임 입니다.")
					}
					location.href = "/myinfo/profile"
				}
			})
		})
	</script>
	<!-- 사진변경 & 저장 & 지우기 버튼 -->
	<div class="btnSec">
		<form action="/myinfo/image_change" name = "form" method="post" enctype="multipart/form-data" onsubmit="return changeImgChk()">

			<input type="file" id="file" name="file" accept=".gif, .jpg, .png" />
			<button type="button" id="potoSubmit"></button>

			<!--보여지는 버튼 -->
			<button type="button" class="btn btn-sm btn-secondary" id="btn-upload">사진 변경</button>

			<button type="button" id="commit" class="btn btn-success btn-sm" onclick="saveImg()">저장하기</button>
		</form>

		<form action="/myinfo/image_delete">
			<button type="submit" class="btn btn-sm btn-secondary" id="deleteBtn">사진 지우기</button>
		</form>
	</div>


</div>

<script type="text/javascript">
var form = document.forms.form;
function saveImg(){
	var result = confirm("변경 된 사진을 저장 하시겠습니다?");
	
	if(result== true){
		form.submit();
	}else{
		
	}
	
}
	var chkE
	$(function() {
		$('#btn-upload').click(function(e) {
			e.preventDefault();
			$('#file').click();
		});
	});

	function changeValue(obj) {
		var file = $('#file');
		console.log(file.val);
		//$("#profileImg").attr("src",file.files[0].name);
	}
	$("#file").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#profileImg").attr("src", e.target.result);
				chkE = e.target.result;
				console.log("오잉 : " + e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	// 사진변경없이 서브밋 시도 막기
	function changeImgChk() {
		if (chkE == null)
			return false;
		else
			return true;
	}

	var eval_num = Number($("#eval_num").val());
	var star_cnt = (Number($("#star_cnt").val()) / eval_num);

	console.log("받은 평가 갯수 : " + eval_num);
	console.log("총 받은 점수 : " + Number($("#star_cnt").val()));
	
	var object_cnt = 0;
	for (var i = 0.5; i <= star_cnt; i += 0.5) {
		$(".star").eq(object_cnt).addClass("on");
		console.log("object_cnt" +object_cnt)
		object_cnt++;
	}
</script>