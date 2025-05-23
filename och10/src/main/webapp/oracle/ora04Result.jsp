<%@page import="och10.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Expression 부서정보</h2>
	<%
		Dept dept = (Dept)request.getAttribute("dept");   // 형변환 + import 해줘야 오류 안남
	%>
	부서 코드 	: <%=dept.getDeptno() %><p>
	부서명    : <%=dept.getDname() %><p>
	근무지    : <%=dept.getLoc() %><p>
	
	<h2>EL 표기법 부서정보 (같은의미)</h2>
	부서 코드 	: ${dept.getDeptno() }<p>
	부서명    : ${dept.dname }<p>    		el  표기법은 내부적으로 getter를 해준다 따라서 private dname이라고 써도 사용가능하다
	근무지    : ${dept.loc }<p>
</body>
</html>