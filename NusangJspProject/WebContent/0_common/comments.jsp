<%@page import="com.nusang.dto.Post"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	댓글
	<div class="addComments">
		 <c:forEach var="reply" items="${post.replyList}">
			<div class='d-flex'>
				<div style='width:70px'>
					<img src='/img/logo.png' style='width: 70px; height: 70px'>
				</div>
						
				<div style='width: 630px'>
					<div>
						${reply.userno}
					</div>
							
					<div>
						${reply.textbody}
						<br>
						${reply.regdate}
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div>
		<textarea rows="3" id= "replyComments"cols="70" placeholder="댓글을 입력하세요"><c:out value="${content}"/></textarea>
		<input type="button" id="addComments" value="등록">
	</div>
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
					let today = new Date();
					let year = today.getFullYear(); // 년도
					let month = today.getMonth() + 1;  // 월
					let date = today.getDate();  // 날짜
					let hours = today.getHours(); // 시
					let minutes = today.getMinutes();  // 분
					let time = year+'.'+month+"."+date+" "+hours+":"+minutes;
					
					$(".addComments").append(
							"<div class='d-flex'>" +
							"<div style='width:70px'>" +
							"<img src='/img/logo.png' style='width: 70px; height: 70px'>" +
						"</div>" +
						
						"<div style='width: 630px'>" +
							"<div>" +
								"${user.username} " +
							"</div>" +
							
							"<div>" +
								$("#replyComments").val() + 
								"<br>" +
				      			time +
							"</div>" +
						"</div>" +
					"</div>"
					);
					$("#replyComments").val("");
				}
			}
		});
	})
</script>