<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String cate[] = new String[]{"디지털/가전", "가구/인테리어", "유아동/유아도서", "생활/가공식품", "스포츠/레저", "여성잡화", "여성의류", "남성패션/잡화", "게임/취미",
		"뷰티/미용", "반려동물용품", "도서/티켓/음반", "기타 중고물품"};

	request.setAttribute("arr_cate", cate);
%>