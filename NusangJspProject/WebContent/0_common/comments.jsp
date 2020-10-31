<%@page import="com.nusang.dao.PostDao"%>
<%@page import="com.nusang.dto.Post"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	댓글
	<div class='addComments'>
		<c:forEach var='reply' items='${post.replyList}'>
			<div class='comment'>
				<hr>
				<div class = 'commentSection d-flex'>
					<div class='cProfile'>
						<img src='/img/logo.png'>
					</div>
					
					<input type='hidden' id='replyno' value='${reply.replyno}'>
					<div class='cContent'>
						<div class='cHeader d-flex'>
							<div>
								${reply.user.nickname}
							</div>
	
							<c:choose>
								<c:when test='${user.userno==post.user.userno}'>
									<!--내가 쓴 댓글이면-->
									<ul class='d-flex c_ud'>
										<div>
											<li class='c_update'>댓글 수정</li>
										</div>
	
										<div id='c_delete'>
											<li>댓글 삭제</li>
										</div>
									</ul>
								</c:when>
	
								<c:otherwise>
									<!--내 댓글이 아니면-->
									<div></div>
	
									<div></div>
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
			</div>
		</c:forEach>
	</div>

	<div class='writeComments'>
		<textarea  rows='3' cols='95' id='replyComments' placeholder='댓글을 입력하세요'></textarea>
		<input type='button' id='addComments' value='등록' style='float: right'>
	</div>
</div>

<script>
function ud(){
	/*댓글 수정*/
	var commentdetach;
	var commentlocation;
	$(".c_update").click(function(){
		var textcopy =$(this).closest(".cContent").children(".cSection").text().trim();
		 commentlocation = $(this).closest(".comment");
		var updatecomment = commentlocation.append(
				"<div>" +
					"<textarea rows='3' cols='95' id='replyComments'" +
						"placeholder='댓글을 입력하세요'>" +
					"</textarea>" +
					"<div style='height: 30px' >" +
						"<input type='button' id='cancleComment' value='취소'>" + 
						"<input type='button' id='updateComment' value='수정'>" +
					"</div>" +
				"<div>"
				);
		$("#replyComments").val(textcopy);
		
		commentdetach= $(this).closest(".commentSection").detach();
		
		
		/*수정 버튼*/
		$("#updateComment").click(function(){
			console.log("수정버튼 클릭!!");
		})
		
		/*취소 버튼*/
		$("#cancleComment").click(function(){
			var cancle = $(this).closest(".comment").children("div").remove();
			commentlocation.append(commentdetach);
		})
	})
	/*댓글 삭제*/
	$(".comment #c_delete").click(function () {
		var comment =$(this).closest(".comment");
		var replyno = comment.children(".commentSection").children("#replyno");
		console.log(replyno.val());
		
		 $.ajax({
			url : "/post/deleteComment",
			type : "POST",
			data : {
				"replyno" : replyno.val()
			},
			success : function(data){
				if (data != -1) {//성공일때
					console.log(replyno.val()+"번 댓글 삭제");
					comment.remove();
				}
			}
		}) 
	})
}
ud();

/*댓글 추가*/
	$("#addComments").click(function(){
		$.ajax({
			url : "/post/addComments",
			type : "POST",
			data : {
				"postno" : <%=request.getParameter("postno")%>,
				"replyText" : $("#replyComments").val()
			},
			success : function(data) {
				if (data > 0) {//성공일때
					let today = new Date();
					let year = today.getFullYear(); // 년도
					let month = today.getMonth() + 1;  // 월
					let date = today.getDate();  // 날짜
					let hours = today.getHours(); // 시
					let minutes = today.getMinutes();  // 분
					let time = year+'.'+month+"."+date+" "+hours+":"+minutes;
					
					$(".addComments").append(
							"<div class='comment'>" + 
								"<hr>" + 
								"<div class = 'commentSection d-flex'>" + 
									"<div class='cProfile'>" + 
										"<img src='/img/logo.png'>" + 
									"</div>" + 
							
									"<input type='hidden' id='replyno' value="+ data+">" + 
									"<div class='cContent'>" + 
										"<div class='cHeader d-flex'>" + 
											"<div>" + 
												"${user.nickname}" + 
											"</div>" + 
							
													"<ul class='d-flex c_ud'>" + 
														"<div>" + 
															"<li class='c_update'>댓글 수정</li>" + 
														"</div>" + 
							
														"<div id='c_delete'>" + 
															"<li>댓글 삭제</li>" + 
														"</div>" + 
													"</ul>" + 
										"</div>" + 
							
										"<div class='cSection'>" + 
											$("#replyComments").val() +
										"</div>" + 
							
										"<div class='cFooter'>" + 
											time +
										"</div>\r\n" + 
									"</div>" + 
								"</div>" + 
							"</div>"
					);
					$("#replyComments").val("");
					ud();
				}
			}
		});
	})
</script>