<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>  
<%@ page import = "java.lang.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/createPost.css">
</head>
<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>
	<div id="body" class="d-flex justify-content-center">
		<form class="" name="frm" action="https://www.w3schools.com/action_page.php" method="post" onsubmit="return chkSubmit()">
			<%-- 이미지 --%>
			이미지:
			<button name="addImg" type="button">이미지 추가</button>
			
			<div id="imgPreview">
			</div>
			<br>
			<%-- 글제목 --%>
			제목: 
			<input type="text" name="title"/>
			<%-- 카테고리 --%>
			<% String cate [] = new String[]{ 
	 			"디지털/가전",
	 			"가구/인테리어",
	 			"유아동/유아도서",
	 			"생활/가공식품",
	 			"스포츠/레저",
	 			"여성잡화",
	 			"여성의류",
	 			"남성패션/잡화",
	 			"게임/취미",
	 			"뷰티/미용",
	 			"반려동물용품",
	 			"도서/티켓/음반",
	 			"기타 중고물품"
		 	}; 
		 	%>
		 	<br>
		 	카테고리:
			<div class="dropdown">
			    <button id="cateDrop" class="btn dropdown-toggle" type="button" data-toggle="dropdown">선택
			    <span class="caret"></span></button>
			    <ul class="dropdown-menu">
			      <c:forEach var="ct" items="<%= cate %>">
			      	<li class="dropdown-item" href="#" onclick="changeCateName('${ct}')">${ct}</li>
			      </c:forEach>
			    </ul>
		  	</div>
		  	<span></span>
		  	<input type="hidden" name="category" value="">
		  	<br>
		  	
		  	<script type="text/javascript">
			  	function changeCateName(choice) {
					$("#cateDrop").text(choice);
					$("input[name='category']").attr('value',choice);
				}
		  	</script>
		  	
		  	<%-- 가격 --%>
		  	가격: 
			<input type="text" name="price"/><br>
		  	<%-- 글내용 --%>
			<label for="bodytext">내용:</label><br>
      		<textarea name="bodytext" class="form-control" rows="5"></textarea>
			<br>
			<%-- 지도 : 거래장소 설정 --%>
			<div id="dealingSpot">
			</div>
			
			<button type="button" onclick="location.href='list.do'">목록으로</button>
			&nbsp;&nbsp;&nbsp;
			<input type="submit" value="등록"/>
		</form>
		
	</div>
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>