<%@page import="com.nusang.dao.PostDao"%>
<%@page import="com.nusang.dto.Post"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	댓글
	<div class='addComments'>
		<c:forEach var='reply' items='${post.replyList}'>
			<div class='comment'>
				<hr>
				<div class = 'commentSection d-flex'>
					<div class='cProfile'>
						<img src='/upload/${reply.user.picture}'>
					</div>
					
					<input type='hidden' id='replyno' value='${reply.replyno}'>
					<div class='cContent'>
						<div class='cHeader d-flex'>
							<div>
								${reply.user.nickname}
							</div>
	
							<c:choose>
								<c:when test='${user.userno==reply.user.userno}'> <!--내가 쓴 댓글이면-->
									<ul class='d-flex ud_Btn'>
										<div>
											<li class='c_update'>댓글 수정</li>
										</div>
	
										<div>
											<li class='c_delete'>댓글 삭제</li>
										</div>
									</ul>
								</c:when>
	
								<c:otherwise><!--내 댓글이 아니면-->
									<div></div>
	
									<div></div>
								</c:otherwise>
							</c:choose>
						</div>
	
						<div class='cSection'>
							<c:choose>
								<c:when test="${reply.state==0}"><!--공개글-->
									<span class = 'cSecret'>
										
									</span>
									
									<span class = 'text'>
										${reply.textbody}
									</span>
								</c:when>
								
								<c:when test="${(reply.state==1) && 
								(post.user.userno == user.userno || 
								reply.user.userno == user.userno)}"><!--비공개글 && (글 작성자 || 댓글작성자)-->
									<span class = 'cSecret'>
										(비밀댓글입니다)
									</span>
									
									<span class = 'text'>
										${reply.textbody}
									</span>
								</c:when>
								
								<c:otherwise><!--내 글, 내 댓글이 아닐때-->
									<span class = 'cSecret'>
										비밀댓글입니다.
									</span>
									
									<span class = 'text'>
									
									</span>
								</c:otherwise>
							</c:choose>
						</div>
	
						<div class='cFooter'>
							<fmt:formatDate value="${reply.regdate}" pattern="yyyy.MM.dd HH:mm"/>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class='writeComments d-flex'>
		<div class = 'text'>
			<textarea  rows='3' cols='85' id='replyComments' placeholder='댓글을 입력하세요'></textarea>
		</div>
		
		<div class = 'chk_btn'>
			<input type='checkbox' id='secretmode' >비밀댓글
			<input type='button' id='addComments' class = "btn btn-secondary btn-sm" value='등록'>
		</div>
	</div>
</div>

<script>
function ud(){
	var commentdetach;
	var commentlocation;
	var replyno;
	
	$(".c_update").click(function(){ /*댓글 수정*/
		commentlocation = $(this).closest(".comment");
		replyno = $(this).closest(".comment").children(".commentSection").children("#replyno");
		var textcopy =$(this).closest(".cContent").children(".cSection").children(".text").text().trim();
		
		var updatecomment = commentlocation.append(
				"<div class='upcomment'>" +
					"<textarea rows='3' cols='85' id='replyComments'" +
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
		
		/*수정 완료*/
		$("#updateComment").click(function(){
			var updateText =$(this).closest(".upcomment").children("textarea");
			var updateText_Location =
			commentdetach.children(".cContent").children(".cSection").children(".text");
			
			if(updateText.val().trim()==""){
				alert("댓글 내용을 입력해 주세요");
				updateText.val("");
			}else{
				$.ajax({
					url: "/post/updateComment",
					type: "POST",
					data:{
						"updateText" : updateText.val(),
						"replyno" : replyno.val()
					},
					success : function name(data) {
						if(data > 0){
	 						commentlocation.append(commentdetach);
							commentlocation.children(".upcomment").remove();
							$(updateText_Location).html(updateText.val());
						}
					}
				})
			}
		})
		
		/*취소 버튼*/
		$("#cancleComment").click(function(){
			var cancle = $(this).closest(".comment").children("div").remove();
			commentlocation.append(commentdetach);
		})
	})
	/*댓글 삭제*/
	$(".c_delete").click(function () {
		commentlocation = $(this).closest(".comment");
		replyno = commentlocation.children(".commentSection").children("#replyno");
		
		 $.ajax({
			url : "/post/deleteComment",
			type : "POST",
			data : {
				"replyno" : replyno.val()
			},
			success : function(data){
				if (data != -1) {//성공일때
					commentlocation.remove();
				}
			}
		}) 
	})
}
ud();

/*댓글 추가*/
	$("#addComments").click(function(){
		if ($("#replyComments").val().trim() == "") {
			$("#replyComments").val("");
			alert("댓글을 입력해 주세요");
		}else{
			$.ajax({
				url : "/post/addComments",
				type : "POST",
				data : {
					"postno" : ${"postno"}.value,
					"replyText" : $("#replyComments").val(),
					"secretmode" : $("input[id='secretmode']:checked").length
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
						
						var secret= "";
						if($("input[id='secretmode']:checked").length==0){/*공개댓글*/
							secret="";
						}else{/*비공개 댓글*/
							secret= "(비밀댓글입니다)"
						}
						$(".addComments").append(
								"<div class='comment'>" +
								"<hr>" +
								"<div class = 'commentSection d-flex'>" +
									"<div class='cProfile'>" +
										"<img src='/upload/${user.picture}'>" +
									"</div>" +
									
									"<input type='hidden' id='replyno' value="+ data +">" +
									"<div class='cContent'>" +
										"<div class='cHeader d-flex'>" +
											"<div>" +
												"${user.nickname}" +
											"</div>" +
													"<ul class='d-flex ud_Btn'>" +
														"<div>" +
															"<li class='c_update'>댓글 수정</li>" +
														"</div>" +
					
														"<div>" +
															"<li class='c_delete'>댓글 삭제</li>" +
														"</div>" +
													"</ul>" +
										"</div>"+
					
										"<div class='cSection'>" +
											
											"<span class = 'cSecret'>" +
												secret +
											"</span>" +
									
											"<span class = 'text'>" +
												$("#replyComments").val() +
											"</span>" +
										"</div>" +
					
										"<div class='cFooter'>" +
											time +
										"</div>" +
									"</div>" +
								"</div>" +
							"</div>"
						);
						$("#replyComments").val("");/*입력내용 삭제*/
						$("input[id='secretmode']").prop("checked",false);/*체크박스 해제*/
						ud();
					}
				}
			});
		}
	})
</script>