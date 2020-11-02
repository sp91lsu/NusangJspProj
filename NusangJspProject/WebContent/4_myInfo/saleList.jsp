<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_UserList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "saleList"; %>

<div class="container" style = "margin-left:100px;">
	<h2>판매목록</h2>
	<br><br>
	
	<table class="table" style = "text-align: center;">
		<thead class="thead" style = "background: #003E00; color: white;">
			<tr>
				<th scope="col" style = "text-align: center;">no.</th>
				<th scope="col" style = "text-align: center;">게시글</th>
				<th scope="col" style = "text-align: center;">날짜</th>
				<th scope="col" style = "text-align: center;">구매자명</th>
			</tr>
		</thead>
		<% int listCnt = fromRow+1; %>
		<tbody>
			<c:forEach var="sale" items="<%=selectList %>">
				<tr>
						<th scope="row"><%=listCnt++ %></th>
						<td>${sale.productname}</td>
						<td>${sale.regdate}</td>
						<td>${sale.business_partner.nickname}</td>
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