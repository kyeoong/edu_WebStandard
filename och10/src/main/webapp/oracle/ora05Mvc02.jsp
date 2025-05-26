<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp는 비즈니스 로직을 거는 것이 아니고 view에 관한 코드를 쓰는 곳이다</title>
<style type="text/css">
	tr:hover {
	background-color: red;
	}
		/* 
		1601	노경민	DEVELOPER	3000   -->> get(0)
		1602	홍길동1					   -->> get(1)
		3000	유상진	SQL	3500		   -->> get(2)
		 */
</style>

</head>
<body>

	<h2>EL 표기법과 JSTL을 이용한 Model 2 View</h2>
	<table width ="100%" bgcolor="yellow" border="1">		
		<tr bgcolor="pink">
			<th>사번</th><th>이름</th><th>업무</th><th>급여</th>
		</tr> 
		<c:forEach var="emp" items="${al }">  <!--  한 row로 넘겨와서 emp에 담긴다 -->
			<tr><td>${emp.empno }</td><td>${emp.ename }</td>
				<td>${emp.job }</td><td>${emp.sal }</td>
			</tr>		
		</c:forEach>
		
	
	</table>
</body>
</html>