
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 페이징처리 코드  -->
<c:set var="list" value="${user.payment_UserList}" />
<%@include file="pagination.jsp"%>
<%!String pageName = "buyInfo";%>
<link rel="stylesheet" type="text/css" href="/4_myInfo/css/buyInfo.css">
<div class="container">
	<h2>구매내역</h2>
	<br> <br>

	<table class="table">
		<thead class="thead">
			<tr>
				<th scope="col">no.</th>
				<th scope="col">구매품목</th>
				<th scope="col">금액</th>
				<th scope="col">판매자명</th>
				<th scope="col">날짜</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<%
			int listCnt = fromRow + 1;
		%>
		<tbody>
			<c:forEach var="buyinfo" items="<%=selectList%>">
				<tr>
					<th scope="row"><%=listCnt++%></th>
					<td>${buyinfo.productname}</td>
					<td><fmt:formatNumber value="${buyinfo.price }" pattern="#,###" />원</td>
					<td>${buyinfo.business_partner.nickname}</td>
					<td><fmt:formatDate value="${buyinfo.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<c:choose>

						<c:when test="${buyinfo.star_cnt == null }">
							<td><input type="hidden" id="ph_userno" value="${buyinfo.ph_userno }">
								<button class="evaluationBtn">평가하기</button></td>
						</c:when>
						<c:otherwise>
							<td>평가 완료</td>
						</c:otherwise>
					</c:choose>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%-- 페이징 --%>
	<jsp:include page="pagination_number.jsp">
		<jsp:param value="<%=writePages%>" name="writePages" />
		<jsp:param value="<%=totalPage%>" name="totalPage" />
		<jsp:param value="<%=curPage%>" name="curPage" />
		<jsp:param value="<%=pageName%>" name="pageName" />
	</jsp:include>
</div>


<jsp:include page="../0_common/modal_star.jsp" flush="true">
	<jsp:param name="modalId" value='<%=URLEncoder.encode("modal_star", "UTF-8")%>' />
	<jsp:param name="title" value='<%=URLEncoder.encode("평가하기", "UTF-8")%>' />
	<jsp:param name="body" value='<%=URLEncoder.encode("", "UTF-8")%>' />
</jsp:include>


<script>
	var cur_ph_userno;

	$('.evaluationBtn').click(function(e) {

		cur_ph_userno = $(this).siblings("#ph_userno").val();
		let
		modal = $('#modal_star');

		$(modal).modal("show");

		let
		modalY = $('#modal_star #modalY');
		console.log($(modalY).text())
		$(modalY).click(function(e) {
			var star_cnt = $("#star_evaluation").val();

			$.ajax({

				url : "/myinfo/evaluation",
				type : "POST",
				data : {

					"star_cnt" : star_cnt,
					"ph_userno" : cur_ph_userno
				},
				success : function(res) {

					if (res > 0) {
						alert("평가 완료");
						location.reload();
					} else {
						alert("평가 실패");
					}
				}

			})

			$(modal).modal('hide').data('bs.modal', null);
		});
	});
</script>


