<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<h2>결제내역</h2>
	<br><br><br>
	
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">no.</th>
					<th scope="col">결제금액</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>1000</td>
					<td>2020-01-11</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>2000</td>
					<td>2020-06-28</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>3000</td>
					<td>2020-12-25</td>
				</tr>
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