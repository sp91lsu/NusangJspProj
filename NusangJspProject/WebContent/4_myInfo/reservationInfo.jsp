<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.reservationList}" />
<%
	String pageName = "reservationInfo";
	int curPage = 1; // 현재 페이지 (디폴트는 1 page)

// 현재 몇 페이지 인지 parameter 받아오기
String pageParam = request.getParameter("page");
if (pageParam != null && !pageParam.trim().equals("")) {
	try {
		curPage = Integer.parseInt(pageParam);
	} catch (NumberFormatException e) {
		// ※ page parameter 에러 처리
	}
}

int writePages = 3; // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
int pageRows = 5; // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
int totalPage = 0; // 총 몇 '페이지' 분량인가?


ArrayList list = (ArrayList) pageContext.getAttribute("list");
int cnt = list.size(); //글의 총 갯수
System.out.println(">>총 몇개 있는가: " + cnt);

totalPage = (int) Math.ceil(cnt / (double) pageRows); // 총 몇 페이지 분량인가?
int fromRow = (curPage - 1) * pageRows; // 몇번째  row 부터?

ArrayList selectList = new ArrayList();
getList(curPage, fromRow, pageRows, list, selectList);
%>

<%!public void getList(int curPage, int fromRow, int pageRows, ArrayList list, ArrayList selectList) {

		System.out.println(">>전체 리스트: " + list);
		for (int i = fromRow; i < fromRow + pageRows; i++) {
			if (list.size() <= i) {
				break;
			}
			selectList.add(list.get(i));
		}
		System.out.println(">>페이지에 해당하는 리스트:  " + selectList);
	}%>      
      
      
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
	<jsp:include page="pagination.jsp">
		<jsp:param value="<%=writePages%>" name="writePages" />
		<jsp:param value="<%=totalPage%>" name="totalPage" />
		<jsp:param value="<%=curPage%>" name="curPage" />
		<jsp:param value="<%=pageName%>" name="pageName"/>
	</jsp:include>
</div>