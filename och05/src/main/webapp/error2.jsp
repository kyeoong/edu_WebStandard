<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>  
<%response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지</h1>
나은 서비스를 위해서 준비중입니다<p>
메세지 : <%=exception.getMessage() %><br>
클래스 : <%=exception.getClass() %>
</body>
</html>