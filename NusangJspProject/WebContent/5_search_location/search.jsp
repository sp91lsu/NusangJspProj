<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container">
		<h1 class="display-4 text-center mt-5 ">위치 검색</h1>
		<div class="input-group">
			<input type="text" name="searchValue" id="searchText" class="form-control container w-50" placeholder="시/도, 시/군/구, 동읍"> <span class="input-group-btn">
				<button class="btn btn-dark " id="searchBtn" type="button">찾기</button>
			</span>
		</div>
		<table class="table table-hover" id="searchTable">

		</table>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>



	<jsp:include page="../0_common/modal.jsp" flush="true">
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_loc", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("위치 설정", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("현재위치로 설정하시겠습니까?", "UTF-8")%>' />
	</jsp:include>

	//우리가 쓸 페이지
	<button id="modalBtn_1" class="btn">button</button>

	<script>
		$('#modalBtn_1').click(function(e) {
			
			let modal = $('#modal_loc');
			 
			$(modal).modal("show");
			
			let modalY = $('#modal_loc #modalY');
			console.log($(modalY).text())
			$(modalY).click(function(e) {
				console.log("fdasfsda")
				$(modal).modal('hide').data('bs.modal', null);
				//여기에서 예를 눌렀을 떄 수행해야함
			});
		});
	</script>
</body>




<script type="text/javascript" src="searchLoc.js"></script>
</html>