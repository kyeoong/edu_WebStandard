<%@page import="och15_ajax.MemberDao"%>
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
	String id= request.getParameter("id");
	MemberDao memberDao = MemberDao.getInstance(); // singleTon은 getInstance 한다 new 하지 않는다
	//  singleTon은 메모리 절감 된다
	
	// member1  Read 	
	int result = memberDao.confirm(id);
    // id 존재  --> return 1
    // id 존재X --> return 0
	if(result == 0 ) {
		out.println("사용할 수 있는 ID입니다");
	} else {
		out.println("이미 있는 아이디 이므로 다른 아이디를 사용하세요");
	}
%>
</body>
</html>