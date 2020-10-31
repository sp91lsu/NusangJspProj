<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nusang.dto.Payment_Market"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.nusang.dao.UserDao"%>
<%@page import="com.nusang.dto.User"%>
<%@page import="lombok.val"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_MarketList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "paymentList"; %>

<div class="container" style="margin-left: 100px;">
	<h2>결제내역</h2>
	<br> <br>

	<table class="table" style = "text-align: center;">
		<thead class="thead" style = "text-align: center; background :#003E00; color: white;">
			<tr>
				<th scope="col" style = "text-align: center;">no.</th>
				<th scope="col" style = "text-align: center;">결제번호</th>
				<th scope="col" style = "text-align: center;">결제내용</th>
				<th scope="col" style = "text-align: center;">결제금액</th>
				<th scope="col" style = "text-align: center;">날짜</th>
			</tr>
		</thead>
		<% int listCnt = fromRow+1; %>
		<tbody>
			<c:forEach var="payment" items="<%=selectList%>">
				<tr>
					<th scope="row" style = "text-align: center;"><%= listCnt++ %></th>
					<td>${payment.imp_uid}</td>
					<td>${payment.name}</td>
					<td>${payment.price}</td>
					<td>${payment.regdate}</td>
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
