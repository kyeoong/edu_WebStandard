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
int num = (int)request.getAttribute("num");
// int num = Integer.parseInt(request.getAttribute("num").toString()); // integer는 string을 인자로 받으므로 toString으로 변환 필요

for(int i = 1 ; i <= 9 ; i++) {
	out.println(num +" * "+ i +" = " + (num*i)+"<br>");
}
%>
</body>
</html>