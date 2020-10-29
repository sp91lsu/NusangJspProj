<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<div class="container" style = "margin-left: 100px;">
	<h2>구매신청 현황</h2>
	<br><br>

	<table class="table">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">no.</th>
	      <th scope="col">구매품목</th>
	      <th scope="col">가격</th>
	      <th scope="col">진행상태</th>
	      <th scope="col">날짜</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  	<c:forEach var="reservation" items="${user.reservationList}">
		    <tr>
		      <th scope="row">1</th>
		      <td>1</td>
		      <td>${reservation.reser_price}</td>
		      <td>${reservation.state}</td>
		      <td>${reservation.regdate}</td>
		    </tr>
		</c:forEach>
	  </tbody>
	</table>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>