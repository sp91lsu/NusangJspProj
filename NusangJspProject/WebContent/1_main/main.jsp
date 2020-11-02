<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nusang.controller.assistance.ConAsist"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너근마켓</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/1_main/css/postCard.css">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/1_main/css/main_detailSearch.css">
</head>

<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<!-- 검색 섹션 -->
	<div style="background: #EEE; width: 100%; margin-top: -50px; min-width:1000px;">
		<!-- 타이틀 -->
		<h1 class="mt-5" id="titleAddress" align="center"
			style="padding-top: 50px;">
			<span
				style="font-family: 'Do Hyeon', sans-serif; font-size: 50px; color: #1DDB16">너의
				근처</span> ${location.getAddress() } 판매목록
		</h1>
		
		<!-- 검색 존 -->
		<div id="searchZone" class="input-group w-50 container mt-4">
			<!-- 검색 바 -->
			<input id="searchBar" type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
			<!-- 찾기버튼 -->
			<button id="searchBtn" class="btn btn-dark " type="button" style="background: #10620A;">찾기</button>
			<!-- <span class="input-group-btn"></span> -->
			
			<!-- 상세검색 -->
			<c:if test="${user != null }">
				<!-- 상세검색 버튼 -->
				<button id="detailSearchBtn" class="btn btn-success" onclick="doDisplay()">상세검색
					<i id="caretdown" class="fas fa-caret-down"></i>
					<i id="caretup" class="fas fa-caret-up"></i>
				</button>
				
				<!-- 폼 시작 -->
				<form name="detailSearchForm" id="detailSearchForm" action="/search" method="post"> <!-- /1_main/mainGetParamTest.jsp    /search-->
				<!-- 상세검색 팝업창 -->
				<div id="detailSearch-pop" class="detailSearch-pop">
						<!-- 헤더 -->
						<div id="popHeader" class="d-flex">
							<span id="popHtext" class="mr-auto">상세검색</span>
							<i id="closeBtn" class="fas fa-times"></i>
						</div>
							<!-- 검색어 -->
							<input type="hidden" class="form-group" id="searchWord" name="searchWord">
							
							<!-- 카테고리 -->
							<jsp:include page="/0_common/data.jsp"></jsp:include>
							<% String cate[] = (String[])request.getAttribute("arr_cate"); %>
							<span class="popIndex ">카테고리</span>&nbsp;&nbsp;&nbsp;
							<label><input id="chooseAll" type="checkbox" checked="checked">모두선택</label>
							<div class="d-flex flex-wrap">
								<c:forEach var="ct" items="<%=cate%>">
									<div class="form-group form-check">
									  <label class="form-check-label">
									    <input type="checkbox" class="form-check-input" name="category" value="${ct }" checked="checked">${ct }
									  </label>
									</div>
								</c:forEach>
							</div>
							<hr>
							<!-- 정렬 -->
							<span class="popIndex">정렬</span>
							<div>
								<div class="form-group form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="order" value="postno" checked="checked">최신 순
								  </label>
								</div>
								<div class="form-group form-check-inline">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="order" value="heartcnt">관심 순
								  </label>
								</div>
							</div>
							<hr>
							<!-- 가격범위 -->
							<span class="popIndex">가격범위</span>
								<div class="form-group d-flex ml-3 mr-3 align-items-center">
									<input type="text" class="form-control" name="price_min">&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="text" class="form-control" name="price_max">
								</div>
							<hr>
							<!-- 동네범위 -->
							<span class="popIndex">동네범위</span>
							<c:set var="arr" value='<%=new String[] { "1", "3", "5", "10" }%>' />
							<div>
								<c:forEach items="${arr}" var="num">
									<div class="form-group form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="view_distance" value="${num }">${num }km
									  </label>
									</div>
								</c:forEach>
							</div>
							<hr>
							<!-- 버튼들 -->
							<div class="d-flex justify-content-end">
								<button>기본값</button>
								<button></button>
								<button></button>
								<button id="submitBtn" type="submit">검색</button>
							</div>
					</div>
					</form>
			</c:if>
		</div>
	</div>
	
	<!-- 포스트 섹션 -->
	<div class="container" style="min-height: 1000px; min-width:1000px;">

		<!-- 글쓰기버튼 -->
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-dark" id="btnPost"
				style="background: #10620A;"
				onclick="location.href='/post/moveMkPost'">글쓰기
			</button>
		</div>

		<!-- 포스트 리스트 -->
		<div id="postListSection"
			class="d-flex flex-wrap align-content-start justify-content-center"
			style="padding-top: 50px;">
			<c:forEach var="post" items="${postList}">

				<div id="postCard" style = "margin-bottom: 30px;">
					<c:choose>
						<c:when test="${!empty post.post_picture.getList()[0]}">
							<img id="card_img" alt="product image"
								src="/upload/${post.post_picture.getList()[0]}"
								class="rounded-bottom"
								style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA;">
						</c:when>
						<c:otherwise>
							<img id="card_img" alt="default image" src="/img/noImg.png"
								class="rounded-bottom"
								style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA">
						</c:otherwise>
					</c:choose>
					<div style="box-shadow: 0px 0px 3px 1px #EAEAEA;">
						<h6 id="card_title"
							style="padding-top: 20px; padding-bottom: 5px; font-family: 'Noto Sans KR', sans-serif; font-size: 15px; padding-left: 7px;">
							<c:choose>
								<c:when test="${post.title.length() > 12 }">${fn:substring(post.title,0,12)}<span
										style="font-weight: bold">...</span>
								</c:when>
								<c:otherwise>${post.title }</c:otherwise>
							</c:choose>

						</h6>
						<h6 id="card_price" style="padding-left: 7px;">${post.productname }
							<br>
							<div style = "padding-top: 10px; padding-bottom: 5px;">
							<fmt:formatNumber value="${post.price }" pattern="#,###" />원
							</div>
						</h6>
						<h6 id="card_addr" style="font-family: 'Noto Sans KR', sans-serif; font-size:12px; padding-left:7px; ">${post.location.getAddress()}
						
						<c:choose>
							<%-- <c:when test="${post.sellstate == 0 }"><input type = "button" value = "판매중" style = "margin-left: 30px;"></c:when> --%>
							<c:when test="${post.sellstate == 0 }"><button style = "margin-left: 28px; cursor: default;">판매중</button></c:when>
							<c:when test="${post.sellstate == 1 }"><button style = "margin-left: 28px; cursor: default; background: #1DDB16;">예약중</button></c:when>
							<c:when test="${post.sellstate == 2 }"><button style = "margin-left: 15px; cursor: default; background: black;color: white;">판매 완료</button></c:when>
						</c:choose>
						
						</h6> 
						<h8 id="post_comment" style=" padding-left:7px;">댓글
						[${post.replyList.size()}]</h8> <h8>·</h8> <h8 id="post_interest">관심
						[${post.watchList.size() }]</h8> <h8>·</h8> <h8 id="post_view">조회 [${post.viewcnt }]</h8>
						<button id="viewBtn" class="btn btn-success"
							style="width: 190px; margin-top: 10px; background: #23A41A; padding-left: 0px;"
							onclick="location.href='/post/readPost?postno=${post.postno}'">
							글보기</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
	
	
	<script type="text/javascript" src="/1_main/js/main_detailSearch.js"></script>
</body>
</html>

