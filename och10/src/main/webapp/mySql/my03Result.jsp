<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL 부서정보</h2>
	부서코드	: ${dno }   <p>
	부서명  	: ${dname }   <p>
	전화번호	: ${phone }   <p>
	직급     	: <%=request.getAttribute("position") %>   <p>
</body>









</html>