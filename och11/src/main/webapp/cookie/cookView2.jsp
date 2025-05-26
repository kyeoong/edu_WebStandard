<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
		Cookie cooks[] = request.getCookies();
		if(cooks != null) {
			for(int i = 0 ; i<cooks.length; i++) {
				if(cooks[i].getName().equals("name")) {
					out.println("cookie 값 : " + URLDecoder.decode(cooks[i].getValue(),"utf-8"));
				}
			}
		}

%>
</body>
</html>