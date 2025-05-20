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
// parameter 값 가져와
int num = Integer.parseInt(request.getParameter("num"));
int sum = 0;
// 1부터 num까지 합
for(int i = 1 ; i<=num ; i++) {
	sum += i;
	out.println(i + "번째 합" + sum + "<br>");
}
%>
</body>
</html>