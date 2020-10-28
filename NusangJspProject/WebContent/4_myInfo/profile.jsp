<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/css/profile.css">

<div class="section1">
	<h2>프로필 수정</h2>
	<c:choose>
		<c:when test="${empty user.picture}">
			<img src="../img/프로필 기본이미지.jpg" alt="..." id="profileImg">
		</c:when>
		<c:when test="${user.picture == '프로필 기본이미지.jpg'}">
			<img src="../img/프로필 기본이미지.jpg" alt="..." id="profileImg">
		</c:when>
		<c:otherwise>
			<img src="../upload/${user.picture}" alt="..." id="profileImg">
		</c:otherwise>
	</c:choose>
</div>

<div class="section2">
	<div class="btnSec">
		<form action="/myinfo/image_change" method="post"
			enctype="multipart/form-data" onsubmit="return changeImgChk()">

			<input type="file" id="file" name="file" accept=".gif, .jpg, .png"
				style="display: none" />
			<button type="button" id="potoSubmit" style="display: none"></button>

			<!--보여지는 버튼 -->
			<button type="button" class="btn btn-sm btn-secondary"
				id="btn-upload">사진 변경</button>

			<button type="submit" class="btn btn-sm btn-primary">저장하기</button>
		</form>

		<form action="/myinfo/image_delete">
			<button type="submit" class="btn btn-sm btn-secondary">사진
				지우기</button>
		</form>
	</div>

	<div class="nicknameSec">
		<form action="/myinfo/nickname_change">
			<h5 class="card-title">
				<input class="nickName" name="nickName" type="text"
					value=${user.username } />
			</h5>

			<button type="submit" class="btn btn-primary btn-lg">닉네임 변경</button>
		</form>
	</div>
</div>

<script type="text/javascript">
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
</script>