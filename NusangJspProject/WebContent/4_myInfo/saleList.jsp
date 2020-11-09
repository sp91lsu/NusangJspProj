<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/4_myInfo/css/saleList.css" />
<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_UserList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "saleList"; %>

<div class="container">
	<h2>판매내역</h2>
	<br><br>
	
	<table class="table">
		<thead class="thead">
			<tr>
				<th scope="col">no.</th>
				<th scope="col">판매품목</th>
				<th scope="col">금액</th>
				<th scope="col">구매자명</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<% int listCnt = fromRow+1; %>
		<tbody>
			<c:forEach var="sale" items="<%=selectList %>">
				<tr>
						<th scope="row"><%=listCnt++ %></th>
						<td>${sale.productname}</td>
						<td>${sale.price}</td>
						<td>${sale.business_partner.nickname}</td>
						<td><fmt:formatDate value="${sale.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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