<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		Cookie cook2 = new Cookie("name",URLEncoder.encode("중앙정보","UTF-8"));  // 쿠키 이름 name 이고 값은 중앙정보인데 한글이라 인코더 해줄것
		response.addCookie(cook2);

%>
쿠키저장 성공 <p>
<a href="cookView2.jsp">쿠키보기</a>
</body>
</html>