<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*" %>
<%@ page import="com.nusang.dto.Post" %>

<%@ page import="com.nusang.ajax.AjaxPostListJSON" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.core.JsonProcessingException"%>
<%@ page import="com.fasterxml.jackson.databind.JsonMappingException"%>
<%@ page import="com.fasterxml.jackson.databind.DeserializationFeature"%>


<%
	String jsonString = request.getParameter("json");
	List<Post> postlist = null;
	if(jsonString != null){
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		System.out.println("jsonString: "+jsonString);
		AjaxPostListJSON ajaxJSON = null;
		try {
			ajaxJSON = mapper.readValue(jsonString, AjaxPostListJSON.class);
			System.out.println("통과");
		} catch (JsonMappingException e1) {
			e1.printStackTrace();
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		postlist = ajaxJSON.getList();
	}
%>
<c:set var="postList" value="<%= postlist %>"/>

<!-- 포스트 리스트 -->
<c:choose>
	<c:when test="${fn:length(postList)==0}"><!-- 검색결과 없을때 -->
		<div id="whenPostZero" class="d-flex justify-content-center align-items-center">
			<span>검색결과가 없습니다.</span>				
		</div>
	</c:when>
	<c:otherwise><!-- 검색결과 있을때 -->
		<c:forEach var="post" items="${postList}">
			<!-- 각 포스트 카드 1개 -->
			<div id="postCard" style = "margin-bottom: 30px;">
				<!-- 상품 이미지 -->
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
				<!-- 상품 정보 -->
				<div style="box-shadow: 0px 0px 3px 1px #EAEAEA;">
					<!-- 제목 -->
					<h6 id="card_title"
						style="padding-top: 20px; padding-bottom: 5px; font-family: 'Noto Sans KR', sans-serif; font-size: 15px; padding-left: 7px;">
						<c:choose>
							<c:when test="${post.title.length() > 12 }">${fn:substring(post.title,0,12)}<span
									style="font-weight: bold">...</span>
							</c:when>
							<c:otherwise>${post.title }</c:otherwise>
						</c:choose>

					</h6>
					<!-- 가격 -->
					<h6 id="card_price" style="padding-left: 7px;">${post.productname }
						<br>
						<div style = "padding-top: 10px; padding-bottom: 5px;">
						<fmt:formatNumber value="${post.price }" pattern="#,###" />원
						</div>
					</h6>
					<!-- 주소 -->
					<h6 id="card_addr" style="font-family: 'Noto Sans KR', sans-serif; font-size:12px; padding-left:7px; ">${post.location.getAddress2()}
					
					<c:choose>
						<c:when test="${post.sellstate == 0 }"><input type = "button" value = "판매중" style = "float:right; margin-right:7px;height:20px; margin-top:-3px;cursor:default;border-radius:3px;border:0;outline:0;background: #D5D5D5; "></c:when>
						<c:when test="${post.sellstate == 1 }"><input type = "button" value = "예약중" style = "float:right; margin-right:7px;height:20px; margin-top:-3px; cursor:default;border-radius:3px;border:0;outline:0;background: #FFBB00;"></c:when>
						<c:when test="${post.sellstate == 2 }"><input type = "button" value = "판매완료" style = "float:right; margin-right:7px;height:21px; margin-top:-3px;cursor:default;border-radius:3px;border:0;outline:0;background: black;color: white;"></c:when>
					</c:choose>
					
					</h6> 
					<h8 id="post_comment" style=" padding-left:7px;font-size: 2px;">댓글
					[${post.replyList.size()}]</h8> <h8>·</h8> <h8 id="post_interest" style = "font-size: 2px;">관심
					[${post.watchList.size() }]</h8> <h8>·</h8> <h8 id="post_view" style = "font-size: 2px;">조회 [${post.viewcnt }] · </h8><span style = "font-size: 10px;font-weight: bold;">${post.calcTime() }</span>
					<button id="viewBtn" class="btn btn-success"
						style="width: 190px; margin-top: 10px; background: #23A41A; padding-left: 0px;"
						onclick="location.href='/post/readPost?postno=${post.postno}'">
						글보기</button>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose><!-- 포스트 리스트 끝 -->



