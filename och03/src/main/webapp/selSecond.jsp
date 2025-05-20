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
String[] col = {"red", "orange", "yellow", "green", "blue", "navy", "violet", "black"};
int n = (int)(Math.random()*8);

String pgm = request.getParameter("pgm") + ".jsp";
System.out.println("pgm->"+pgm);  // color1.jsp, gugu1.jsp, response.jsp

// 1. Page 이동 선언
RequestDispatcher rd = request.getRequestDispatcher(pgm);

if(pgm.equals("color1.jsp")) {
	request.setAttribute("color", col[n]);  // ("속성이름", 저장할값)
} else if(pgm.equals("gugu1.jsp")) {
	request.setAttribute("num", n+2);  // 넘겨주는 값이 객체
} else if(pgm.equals("response.jsp")) {
	// 필요시 Setting
}

// 2. Page 이동
rd.forward(request, response);


%>
</body>
</html>