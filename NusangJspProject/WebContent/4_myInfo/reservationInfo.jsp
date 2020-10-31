<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.reservationList}" />
<%@include file="pagination.jsp"%>
<%! String pageName = "reservationInfo"; %>
      
<div class="container" style = "margin-left: 100px;">
	<h2>구매신청 현황</h2>
	<br><br>

	<table class="table" style = "text-align: center;">
	  <thead class="thead" style = "background: #003E00; color: white;">
	    <tr>
	      <th scope="col" style = "text-align: center;">no.</th>
	      <th scope="col" style = "text-align: center;">구매품목</th>
	      <th scope="col" style = "text-align: center;">가격</th>
	      <th scope="col" style = "text-align: center;">진행상태</th>
	      <th scope="col" style = "text-align: center;">날짜</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  
	  <% int listCnt = fromRow+1; %>
	  	<c:forEach var="reservation" items="<%=selectList %>">
		    <tr>
		      <th scope="row" style = "text-align: center;"><%= listCnt++ %></th>
		      <td>${reservation.post.productname }</td>
		      <td>${reservation.reser_price}</td>
			  <td>
			      <c:choose>
			      	<c:when test="${reservation.state == 0}">
			      	구매신청중
			      	</c:when>
			      	<c:otherwise>
			      	예약완료
			      	</c:otherwise>
			      </c:choose>
		      </td>
              <td>${reservation.regdate}</td>
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