<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String color = request.getAttribute("color").toString(); // set썼으니까 파라메타 꺼낼때 get으로 꺼낸다

%>
<body bgcolor = "<%=color %>">
</body>
</html>