<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <form action="oraDeptInput1.jsp" method="post"> -->
	<form action="oraDeptInput2.jsp" method="post">
		부서코드 :	<input type="number" name="deptno" 	required="required"><p>
		부서명 : 	<input type="text" 	 name="dname" 	required="required"><p>
		근무지 : 	<input type="text" 	 name="loc" 	required="required"><p>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>