<%@page import="com.nusang.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Single+Day&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="/css/header.css">

<nav class="navbar navbar-expand-lg navbar-light"
	style="background: #FFF;; border-bottom: 3px solid #333">
	<a class="navbar-brand col-4"
		style="box-sizing: border-box; margin: 0;" href="/main"><img
		src="../img/ngmk_logo.png" style="width: 100px; height: 100px;" /></a> <a
		class="navbar-brand col-4 text-center"
		style="box-sizing: border-box; margin: 0;" href="/main"><h1
			style="font-family: 'Do Hyeon', sans-serif; font-size: 60px; color: #00B700">너근
			마켓</h1></a>
	<div class="navbar-brand col-4 text-right "
		style="box-sizing: border-box; margin: 0;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<c:choose>
			<c:when test="${user != null}">
				<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-family: 'Noto Sans KR', sans-serif;">
					<div class="navbar-nav pull-right" style="margin-left: -10%">

						<li class="nav-item"><a class="nav-link"
							href="/myinfo/profile" style="color: #22741C">${user.nickname}
								<span style="color: black">님</span>
						</a></li>
						<li class="nav-item"><button id="logoutBtn" type="button"
								class="btn btn-secondary btn-sm"
								onclick="location.href='/3_account/logout.jsp'">로그아웃</button></li>
						<li class="nav-item"><div class="dropdown">
								<button class="btn btn-outline-dark dropdown-toggle btn-sm"
									type="button" id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">${user.location != null ? user.location.name3 : '위치를 설정해주세요' }</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="/myinfo/search">위치 설정</a>
								</div>
							</div></li>
						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-outline-dark dropdown-toggle btn-sm"
									type="button" id="dropdownMenuButton2" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">검색반경:
									${user.view_distance}km</button>
								<c:set var="numbers"
									value='<%=new String[] { "1", "3", "5", "10" }%>' />
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<c:forEach var="num" items="${numbers }">
										<a class="dropdown-item"
                                            onclick="sendNum('${num}')">${num}km</a>
									</c:forEach>
								</div>
							</div>
						</li>
					</div>
				</div>

			</c:when>

			<c:otherwise>
				<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-family: 'Noto Sans KR', sans-serif;">
					<div class="navbar-nav pull-right" style="margin-left: 35%">
						<li class="nav-item p-2"><button type="button"
								class="btn btn-success btn-sm" style="background: #10620A;"
								onclick="location.href='../3_account/login.jsp'">로그인</button></li>
						<li class="nav-item p-2"><button type="button"
								class="btn btn-outline-dark btn-sm"
								onclick="location.href='../3_account/signUp.jsp'">회원가입</button></li>
					</div>
				</div>
			</c:otherwise>

		</c:choose>
	</div>
</nav>

<script type="text/javascript" src="/0_common/js/header.js"></script>
