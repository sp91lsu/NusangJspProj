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
		 
		 <hr style='margin: 3px 0px 3px 0px'>
			<div class='d-flex comment'>
				<div class='cProfile'>
					<img src='/img/logo.png'>
				</div>
							
				<div class='cContent'>
					<div class='cHeader d-flex'>
						<div>
							${reply.user.nickname}					
						</div>
						
				<c:choose>
					<c:when test='${user.userno==post.user.userno}'><!--내가 쓴 댓글이면-->
						<div>
							댓글 수정
						</div>
				
						<div>
							댓글 삭제
						</div>
					</c:when>
					
					<c:otherwise><!--내 댓글이 아니면-->
						<div>
							
						</div>
							
						<div>
							
						</div>
					</c:otherwise>
				</c:choose>
					</div>
							
					<div class='cSection'>
						${reply.textbody}
					</div>
					
					<div class='cFooter'>
						${reply.regdate}
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="writeComments">
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
							"<hr style='margin: 3px 0px 3px 0px'>" +
							"<div class='d-flex comment'>" +
								"<div class='cProfile'>" +
									"<img src='/img/logo.png'>" +
								"</div>" +
											
								"<div class='cContent'>" +
									"<div class='cHeader d-flex'>" +
										"<div>" +
											"${user.nickname}" +
										"</div>" +
										
										"<div>" +
											"댓글 수정" +
										"</div>" +
								
										"<div>" +
											"댓글 삭제" +
										"</div>" +
									"</div>" +
											
									"<div class='cSection'>" +
									$("#replyComments").val() +
									"</div>" +
									
									"<div class='cFooter'>" +
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