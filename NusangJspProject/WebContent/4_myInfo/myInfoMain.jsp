<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../css/myInfo_sideMenu.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String sideMenu = request.getParameter("sidemenu");

	if (sideMenu == null) {
		sideMenu = "profile.jsp";
	}
	System.out.println("위치 어디냐" + sideMenu);
%>


<body>
	<jsp:include page="../0_common/header.jsp"></jsp:include>

	<div id="body" class="container" style="margin: 70px auto 0px auto; height: 500px">
		<div class="row">
			<div class="col-2 sideMenu_Btngroup"><jsp:include
					page="../0_common/myInfo_sideMenu.jsp"></jsp:include>
			</div>
			
			<div class="col-10">
				<jsp:include page="<%=sideMenu%>" flush="false"></jsp:include>
			</div>
		</div>
	</div>
	
	<jsp:include page="../0_common/footer.jsp"></jsp:include>
</body>
</html>