<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nusang.dto.Payment_Market"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.nusang.dao.UserDao"%>
<%@page import="com.nusang.dto.User"%>
<%@page import="lombok.val"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type ="text/css" href = "/4_myInfo/css/paymentList.css" />

<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_MarketList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "paymentList"; %>

<div class="container">
	<h2>결제내역</h2>
	<br> <br>

	<table class="table">
		<thead class="thead">
			<tr>
				<th scope="col">no.</th>
				<th scope="col">결제번호</th>
				<th scope="col">결제내용</th>
				<th scope="col">결제금액</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<% int listCnt = fromRow+1; %>
		<tbody>
			<c:forEach var="payment" items="<%=selectList%>">
				<tr>
					<th scope="row"><%= listCnt++ %></th>
					<td>${payment.imp_uid}</td>
					<td>${payment.name}</td>
					<td><fmt:formatNumber value="${payment.price }" pattern="#,###" />원
					<c:choose>
						<c:when test="${payment.state == 0 }"><span class = "blue">환불</span></c:when>
						<c:when test="${payment.state == 1 }"><span class = "red">결제</span></c:when>
					</c:choose>
					</td>
					<td><fmt:formatDate value="${payment.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
