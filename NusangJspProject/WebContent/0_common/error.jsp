<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="error" value="${requestScope.error}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="container" style="min-height: 500px;">
		<br>
		<div id="body">${error}</div>
	</div>

	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</body>

</html>


