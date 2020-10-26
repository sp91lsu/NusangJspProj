<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	
	
	<c:forEach var="no" begin="7" end="12" step="1">
		<button onclick="location.href='/post/readBuyer?postno=${no}'">글보기 postno${no }</button>
	</c:forEach>
</body>
</html>	