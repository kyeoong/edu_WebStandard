<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  // 여기는 자바 
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	int add = (num1 + num2);
	System.out.println("덧셈 : " + add);   // 콘솔창에서 보여주는 것이다, 브라우저 아니다
	int min = num1 - num2;
	int mul = num1 * num2;
	int div = num1 / num2;
	
	
	
%>

<!--  Expression(표현식) -->  
덧셈 : <%=add %><p>
밸셈 : <%=min %><p>
곱셈 : <%=mul %><p>
나눗셈 : <%=div %><p>



</body>
</html>