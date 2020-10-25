<%@page import="com.nusang.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light row ">
	<a class="navbar-brand col-4" style="box-sizing: border-box; margin: 0;" href="../1_main/index.jsp">아이콘</a> 
	<a class="navbar-brand col-4 text-center" style="box-sizing: border-box; margin: 0;" href="../1_main/index.jsp">너근마켓</a>
	<div class="navbar-brand col-4 text-right " style="box-sizing: border-box; margin: 0;" >
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="navbar-nav pull-right" style="margin-left: 35% ">
				<c:choose>
					<c:when test="${user != null}">
	
						<li class="nav-item"><a class="nav-link" href="/myinfo/profile">${user.username} 님</a></li>
						<li class="nav-item"><button id="logoutBtn" type="button" class="btn btn-primary btn-sm" onclick="location.href='/3_account/logout.jsp'">로그아웃</button></li>
						<li class="nav-item"><div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${user.location != null ? user.location.name3 : '위치를 설정해주세요' }</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="/myinfo/search">위치 설정</a>
								</div>
							</div></li>
					</c:when>
	
	
					<c:otherwise>
						<li class="nav-item p-2"><button type="button" class="btn btn-primary btn-sm" onclick="location.href='../3_account/login.jsp'">로그인</button></li>
						<li class="nav-item p-2"><button type="button" class="btn btn-primary btn-sm" onclick="location.href='../3_account/signUp.jsp'">회원가입</button></li>
					</c:otherwise>
	
				</c:choose>
			</div>
		</div>
	</div>
</nav>