<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	날짜 : <fmt:formatDate type="date" value="${date }" pattern="YYYY/MM/dd(E)"/><p> 
	시간 : <fmt:formatDate type="time" value="${date }" pattern="hh:mm:ss(a)"/>
	
	날짜 : 2025/05/23(금)
	시간 : 09:51:40(오전)
</body>
</html>