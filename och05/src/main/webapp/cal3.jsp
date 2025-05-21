<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>연산결과 cal3</h2>
<%
	try {
		// 1. num1, num2 parameter 받기
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		// 2. + , -, * , / 출력하기
		out.println(num1 + " + " + num2 + " = " + (num1+num2));
		out.println(num1 + " - " + num2 + " = " + (num1-num2));
		out.println(num1 + " * " + num2 + " = " + (num1*num2));
		out.println(num1 + " / " + num2 + " = " + (num1/num2));
	
	} catch (NumberFormatException e) {
		
%>
	<script type="text/javascript">
	alert("그게 숫자?");
	history.go(-1); // 이전 페이지로 이동
	</script>	
		
<% } catch(ArithmeticException e) {      %>	
   <script type="text/javascript">
   alert("0으로 못나눠");
   history.back();  // 이전 페이지로 이동
   </script>
<% } catch(Exception e) {  				 %>
	<script type="text/javascript">
	alert("에러야");
	location.href="num2.html"; // 이전 페이지로 이동
	</script>
<% }  									 %>
</body>
</html>