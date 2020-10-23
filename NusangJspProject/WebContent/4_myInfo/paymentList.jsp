<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">no.</th>
					<th scope="col">결제금액</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>1000</td>
					<td>2020-01-11</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>2000</td>
					<td>2020-06-28</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>3000</td>
					<td>2020-12-25</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>