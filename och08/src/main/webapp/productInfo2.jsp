<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pt" class="och08.Clothing" scope="request"></jsp:useBean>
	코드 		: <jsp:getProperty property="code" name="pt"/><p>
	name 	: <jsp:getProperty property="name" name="pt"/><p>
	price 	: <jsp:getProperty property="price" name="pt"/><p>
	색깔 		: <jsp:getProperty property="color" name="pt"/><p>
</body>
</html>