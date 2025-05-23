<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="code" value="1112" scope="request"/>
	<c:set var="name" value="온도계" scope="request"></c:set>
	<c:set var="price" value="16,000원" scope="request"></c:set>     이렇게 변수 선언하고 scope하면 페이지 이동해서도 파라메타로 받아서 el식 표현 가능하다
	위에 setAttribute랑 똑같은 거다
	<jsp:forward page="set2Result.jsp"></jsp:forward>
</body>
</html>