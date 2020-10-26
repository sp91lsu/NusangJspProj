<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/profile.css">


<div class="container justify-content-center" style="width: 50%">
	<div class="card" style="width: 20rem;">
		<img src=${user.picture} class="card-img-top" alt="..."
			id="profileImg">
		<form action="/myinfo/image_change" method="post"
			enctype="multipart/form-data">

			<div id="update" class="d-flex row">
				<input type="file" id="file" name="file" accept=".gif, .jpg, .png"
					style="display: none" />
				<button type="button" id="potoSubmit" style="display: none"></button>

				<button type="button" class="btn btn-lg btn-primary" id="btn-upload">사진
					변경</button>
				<!--보여지는 버튼 -->


			</div>


			<div id="update" class="d-flex row" style="padding-right: 20px">
				<button type="submit" class="btn btn-secondary btn-lg">저장하기</button>
			</div>

		</form>

		<form action="/myinfo/nickname_change">
			<div class="card-body">
				<h5 class="card-title">
					<input name="nickName" type="text" value=${user.username } />
				</h5>
			</div>

			<button type="submit" class="btn btn-secondary btn-lg"
				style="margin-left: 10px;">닉네임 변경</button>
		</form>






	</div>


</div>




<script type="text/javascript">
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
				console.log("오잉 : " + e.target.result);
			}
			reader.readAsDataURL(input.files[0]);

		}
	}
</script>