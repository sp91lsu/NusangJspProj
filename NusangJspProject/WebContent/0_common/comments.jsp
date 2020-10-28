<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/comment.css">

댓글
<div>
	<div class="addComments">
        		
	</div>
			
	<textarea rows="3" id= "replyComments"cols="70"></textarea>
	<input type="button" id="addComments" value="등록">
</div>

<script>
	$("#addComments").click(function(){
		$.ajax({
			url : "/post/addComments",
			type : "POST",
			data : {
				"postno" : <%= request.getParameter("postno") %>,
				"replyText" : $("#replyComments").val()
			},
			success : function(data) {
				if (data != -1) {//성공일때
					$(".addComments").append(
							"<div>" +
		         			"<img src='/img/logo.png' style='width: 50px; height: 50px'>" +
		         			"${user.username}: " +
		         			$("#replyComments").val() + 
						"</div>"
					);
				}
			}
		});
	})
</script>