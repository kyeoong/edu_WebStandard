<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html>           <!-- <!--    객체 선언 하려면 fmt -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--      Date date 1 = new Date()             -->
<c:set var="date1" value="<%=new Date() %>"></c:set>
<body>
	오늘 날짜 : <fmt:formatDate value="${date1 }"/><p>
	현재 시간 : <fmt:formatDate value="${date1 }" type="time"/><p>
	
	기본이 날짜형이고
	시간은 type="time" 쓴다
</body>
</html>