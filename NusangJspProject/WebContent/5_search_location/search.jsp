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
</body>
</html>
<script src="search.js">
	
</script>