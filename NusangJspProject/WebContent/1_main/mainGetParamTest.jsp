<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container text-center">
    <h1>받아온 요청 파라미터</h1>
    <div class="container">
    <%
   	request.setCharacterEncoding("UTF-8");
    /* Map params = request.getParameterMap(); */
 
    /* String[] categorys = (String[])params.get("category"); */
    String searchWord0 = request.getParameter("searchWord");
    searchWord0 = searchWord0.trim();
    String searchWord = "'"+searchWord0;
    searchWord = searchWord.replaceAll("( )+", "|");
    searchWord += "'";
    out.println("<h2>검색어</h2>");
    out.println(searchWord+"<br/>");
    
    String[] arr_categories = request.getParameterValues("category");
	String categories = "(";
	for (String ct : arr_categories) {
		categories += "'" + ct + "',";
	}
	categories = categories.substring(0, categories.length()-1);
	categories += ")";
    out.println("<h2>카테고리</h2>");
    out.println(categories+"<br/>");
    
    /* String[] order = (String[])params.get("order"); */
    String order = request.getParameter("order");
    out.println("<h2>정렬</h2>");
    out.println(order+"<br/>");
    
    String price_min = request.getParameter("price_min");
    out.println("<h2>가격범위</h2>");
    out.println(price_min+"<br/>");
    String price_max = request.getParameter("price_max");
    out.println(price_max+"<br/>");
    
    String distance = request.getParameter("view_distance");
    out.println("<h2>동네범위</h2>");
    out.println(distance+"<br/>");
    %>
    </div>
</div>
</body>
</html>