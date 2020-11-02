 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_UserList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "buyInfo"; %>

<div class="container" style = "margin-left: 100px;">
	<h2>구매내역</h2>
	<br><br>
	
	<table class="table" style = "text-align: center;">
		<thead class="thead" style = "background: #003E00; color: white;">
			<tr>
				<th scope="col" style = "text-align: center;">no.</th>
				<th scope="col" style = "text-align: center;">구매품목</th>
				<th scope="col" style = "text-align: center;">금액</th>
				<th scope="col" style = "text-align: center;">날짜</th>
				<th scope="col" style = "text-align: center;">판매자명</th>
			</tr>
		</thead>
		<% int listCnt = fromRow+1; %>
		<tbody>
			<c:forEach var="buyinfo" items="<%=selectList %>">
				<tr>
					<th scope="row"><%=listCnt++ %></th>
					<td>${buyinfo.productname}</td>
					<td>${buyinfo.price}</td>
					<td>${buyinfo.regdate}</td>
					<td>${buyinfo.business_partner.nickname}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%-- 페이징 --%>
	<jsp:include page="pagination_number.jsp">
		<jsp:param value="<%=writePages%>" name="writePages" />
		<jsp:param value="<%=totalPage%>" name="totalPage" />
		<jsp:param value="<%=curPage%>" name="curPage" />
		<jsp:param value="<%=pageName%>" name="pageName"/>
	</jsp:include>
</div>