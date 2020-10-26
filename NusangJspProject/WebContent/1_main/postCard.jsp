<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
<% String n = request.getParameter("num"); %>
<%= n %>
 --%>
<% request.setCharacterEncoding("UTF-8"); %>
<style>
.test{
	border: 1px black solid; 
	width: 250px; 
	height: 350px;
}
</style> 
 
<c:set var="obj" value="${requestScope.param.objName}" scope="page"></c:set>

<div class="test" >${requestScope.param.objName} ${param.objName} ${obj.postno}</div>