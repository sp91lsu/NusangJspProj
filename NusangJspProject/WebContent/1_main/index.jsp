<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너근마켓</title>
</head>
<body>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div class="input-group w-50 container">
		<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
		<span class="input-group-btn">
			<button class="btn btn-secondary" type="button">찾기</button>
		</span>
	</div>
	<div class="container">
		<div id="body">indexBody</div>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</body>
</html>