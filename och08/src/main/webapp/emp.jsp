<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 
		1.Expresson 표기법 hiredate Disp
		2.EL 사원명 ename2 Disp
		 -->
		 
		 <%
		 String date = request.getParameter("hiredate");
		 
		 %>
		 1.Expresson 표기법 == > 입사일 : <%=date %><p>
		 2.EL        표기법 == > 사원명 : ${param.ename2 } <p>
</body>
</html>