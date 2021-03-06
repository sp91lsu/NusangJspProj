<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/4_myInfo/css/reservationInfo.css" />
      
<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.reservationList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "reservationInfo"; %>
      
<div class="container">
	<h2>구매신청 현황</h2>
	<br><br>

	<table class="table">
	  <thead class="thead">
	    <tr>
	      <th scope="col">no.</th>
	      <th scope="col">구매품목</th>
	      <th scope="col">예약가격</th>
	      <th scope="col">진행상태</th>
	      <th scope="col">날짜</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  
	  <% int listCnt = fromRow+1; %>
	  	<c:forEach var="reservation" items="<%=selectList %>">
				<tr>
					<th scope="row"><%=listCnt++%></th>
					<td>${reservation.post.productname }</td>
					<td><fmt:formatNumber value="${reservation.reser_price }"
							pattern="#,###" />원</td>
					<td><c:choose>
							<c:when test="${reservation.state == 0}">
			      	구매신청중
			      	</c:when>
							<c:otherwise>
			      	예약완료
			      	</c:otherwise>
						</c:choose></td>
					<td><fmt:formatDate value="${reservation.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><button class="btn btn-warning btn-sm" onclick="location.href = '/post/readPost?postno=${reservation.post.postno}'">상품보기</button></td>
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