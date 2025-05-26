<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사원 정보</h2>
사번 : 	${emp.empno }<p>
이름 :	${emp.ename }<p>
급여 원본 : ${emp.sal}
급여 : 	<fmt:formatNumber 					value="${emp.sal }" 		groupingUsed="true"/><p>
입사일 :	<fmt:formatDate 	type="date" 	value="${emp.hiredate }" 	pattern="YYYY/MM/dd"/><p>
날짜 작성할 때 formatDate에서 pattern 속성에서 일은 dd 소문자로 작성해야 한다
</body>s
</html>