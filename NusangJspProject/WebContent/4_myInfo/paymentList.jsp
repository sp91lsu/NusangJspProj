<%@page import="java.util.ArrayList"%>
<%@page import="com.nusang.dto.Payment_Market"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.nusang.dao.UserDao"%>
<%@page import="com.nusang.dto.User"%>
<%@page import="lombok.val"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<h2>결제내역</h2>
	<br> <br> <br>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">결제번호</th>
				<th scope="col">결제금액</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="payment" items="${user.payment_MarketList}">
				<tr>
					<th scope="row">${payment.imp_uid}</th>
					<td>${payment.price}</td>
					<td>${payment.regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</div>