<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL 우승자</h2>
우승자 1 ${winner[0] } <p>
우승자 2 ${winner[1] } <p>
우승자 3 ${winner[2] } <p>

<h2>Java 우승자</h2>
<%
	String[] win = (String[])request.getAttribute("winner");
	// String 일때 toString 나머지는 (객체)로 casting
	for(int i = 0 ; i < win.length ; i++){
		out.println((i+1) + "등 : " + win[i] + "<p>" );
	}
	
%>
</body>
</html>