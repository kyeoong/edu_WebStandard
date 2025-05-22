<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="ee" class="och08.Emp" scope="request"></jsp:useBean>
	사번 : <jsp:getProperty property="empno" name="ee"/><p>
	이름 : 
	업무 : 
	급여 : 
	입사일 : 
</body>
</html>