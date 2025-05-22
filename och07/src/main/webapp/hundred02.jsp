<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int sum = 0;
	for(int i =1 ; i<=100; i++) {
		sum += i;
	}
	
	request.setAttribute("sum1", sum);  // 영역이 다름을 배우기  --> request, pageContext
	pageContext.setAttribute("sum2", sum);
	
	RequestDispatcher rd = request.getRequestDispatcher("hunResult2.jsp");  	 // 페이지 영역이 바뀌는 지 보려면 껐다 켰다 할것 (19,20 Line)
	rd.forward(request, response);

%>

	sum1 : ${sum1} <p>  <!-- 같은 페이지에서는 출력됨 -->
 	sum2 : ${sum2}
</body>
</html>