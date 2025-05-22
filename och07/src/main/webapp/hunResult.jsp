<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 1부터 100까지의 합</h1>
<h5> 1. Expression --> sum1</h5>
	   <%
	   String sum1 = request.getAttribute("sum1").toString();  // getAttribute는 Object 타입으로 리턴되었기 때문에 toString() 해준것이다
	   
	   %> 
	   
	   <%=sum1 %>
	   <p>
	   
<h5> 2. EL         --> sum2</h5>
       ${sum2} <p>
</body>
</html>