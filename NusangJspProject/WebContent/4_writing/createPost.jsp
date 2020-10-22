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
	<div id="body">
		<form name="frm" action="createOk.do" method="post" onsubmit="return chkSubmit()">
			이미지 추가 <button type="button"></button>
			작성자:
			<input type="text" name="name"/><br>
			제목:
			<input type="text" name="subject"/><br>
			내용:<br>
			<textarea name="content"></textarea>
			<br><br>
			<input type="submit" value="등록"/>
			</form>
			<br>
			<button type="button" onclick="location.href='list.do'">목록으로</button>
		
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>