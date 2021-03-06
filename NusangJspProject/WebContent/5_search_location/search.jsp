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

	<div class="container" style="min-height: 400px">
		<h1 class="display-4 text-center mt-5">위치 설정</h1>(최소 동읍까지)
		 
		<div class="input-group">
			<input type="text" name="searchValue" id="searchText" class="form-control container w-50" placeholder="예:) 서울특별시 강남구 역삼동 601"> 
			<span class="input-group-btn">
				<button class="btn btn-dark " id="searchBtn" type="button">찾기</button>
			</span>
		</div>
		
		<table class="table table-hover" id="searchTable">

		</table>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>



 	<jsp:include page="../0_common/modal.jsp" flush='true'>
		<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_loc", "UTF-8")%>' />
		<jsp:param name="title" value='<%=URLEncoder.encode("위치 설정", "UTF-8")%>' />
		<jsp:param name="body" value='<%=URLEncoder.encode("현재위치로 설정하시겠습니까?", "UTF-8")%>' />
	</jsp:include> 

</body>
<script  type="text/javascript" src="/5_search_location/search.js"></script>
</html>
