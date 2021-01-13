<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
<link rel="stylesheet" type="text/css" href="/1_main/css/main.css">
</head>

<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<!-- 검색 섹션 -->
	<div class="d-flex flex-column align-items-center" style="background: #EEE; width: 100%; margin-top: -50px;padding-bottom:30px; min-width:1000px;">
		<!-- 타이틀 -->
		<h1 class="mt-5" id="titleAddress" align="center"
			style="padding-top: 50px;">
			<span
				style="font-family: 'Do Hyeon', sans-serif; font-size: 50px; color: #1DDB16">너의
				근처</span> ${location.getAddress() } 판매목록
		</h1>
		
		
		
		<!-- 검색 존 -->
		<div id="searchZone" class="d-flex justify-content-center pt-4">
			<!-- 중앙구역 -->
			<div id="searchMid" class="input-group">
				
				<!-- 검색 바 -->
				<input id="searchBar" type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
				<!-- 찾기버튼 -->
				<button id="searchBtn" class="btn btn-dark " type="button" style="background: #10620A;">찾기</button>
				<!-- 상세검색(필터) -->
				<c:if test="${user != null }">
					<div id="isUser"></div>
					<!-- 상세검색 버튼 -->
					<button id="detailSearchBtn" class="btn btn-success" onclick="doDisplay()">필터
						<i id="caretdown" class="fas fa-caret-down"></i>
						<i id="caretup" class="fas fa-caret-up"></i>
					</button>
					
					<!-- 폼 시작 -->
					<form name="detailSearchForm" id="detailSearchForm" action="/search" method="post">
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
								<label class="checkbox">
									<input id="chooseAll" type="checkbox" checked="checked">
									<span class="success" style=""></span>
									<label for="chooseAll">모두선택</label>
								</label>
								<div class="d-flex flex-wrap">
									<c:forEach var="ct" items="<%=cate%>" varStatus="status">
										<div class="form-group form-check">
										  <label class="form-check-label checkbox align-items-center" style="padding-left: 0;">
										    <input type="checkbox"  class="form-check-input" id="chk${status.count }" name="category" value="${ct }" checked="checked">
										    <span class="success" style=""></span>
										    <label for="chk${status.count }" style="margin-bottom:0rem;">${ct }</label>
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
									    <input type="radio" id="od1" class="form-check-input" name="order" value="postno" checked="checked">
									    <label for="od1"></label>최신 순
									  </label>
									</div>
									<div class="form-group form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" id="od2" class="form-check-input" name="order" value="heartcnt">
									    <label for="od2"></label>관심 순
									  </label>
									</div>
								</div>
								<hr>
								<!-- 가격범위 -->
								<span class="popIndex">가격범위</span>
									<div class="form-group d-flex ml-3 mr-3 align-items-center">
										<input type="number" class="form-control" name="price_min" value="0" required="required">&nbsp;&nbsp;~&nbsp;&nbsp;
										<input type="number" class="form-control" name="price_max" value="999999999" required="required">
									</div>
								<hr>
								<!-- 동네범위 -->
								<span class="popIndex">동네범위</span>
								<c:set var="arr" value='<%=new String[] { "1", "3", "5", "10" }%>' />
								<input id="distance" type="hidden" value="${user.view_distance }">
								<div>
									<c:forEach items="${arr}" var="num">
										<div class="form-group form-check-inline">
										  <label class="form-check-label">
										    	<input type="radio" class="form-check-input" id="dong${num }" name="view_distance" value="${num }">
										    	<label for="dong${num }">${num }km</label>
										  </label>
										</div>
									</c:forEach>
								</div>
								<hr>
								<!-- 버튼들 -->
								<div id="btns" class="d-flex justify-content-end">
									<button id="submitBtn" type="button" class="btn btn-success">검색</button>
								</div>
						</div>
					</form>
				</c:if>
			</div>
			<!-- 오른쪽구역 -->
			<div id="searchRight" class="d-flex justify-self-end">
				<!-- 글쓰기버튼 -->
				<button type="button" class="btn btn-dark " id="btnPost"
					style="background: #10620A;"
					onclick="location.href='/post/moveMkPost'">글쓰기
				</button>
			</div>
		</div>
	</div>
	
	<!-- 포스트 섹션 -->
	<div id="postSection" class="container d-flex flex-column align-items-center">
		<!-- 포스트 랩퍼 -->
		<div id="postWrapper">
			<div id=postSection_top class="d-flex justify-content-end"></div>
	
			<!-- 포스트 리스트 섹션 -->
			<div id="postListSection"
				class="d-flex flex-wrap align-content-start justify-content-center"
				style="padding-top: 50px;">
				<!-- 포스트 리스트 -->
				
		 	</div><!-- 포스트 리스트 섹션 끝 -->
		 </div><!-- 포스트 랩퍼 끝 -->
	</div><!-- 포스트 섹션 끝 -->
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
	
	
	<script type="text/javascript" src="/1_main/js/main_detailSearch.js"></script>
	<script type="text/javascript" src="/1_main/js/main_ajax.js"></script>
</body>
</html>

