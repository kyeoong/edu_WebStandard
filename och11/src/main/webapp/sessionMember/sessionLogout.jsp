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
// 	String id = (String)session.getAttribute("id");
	String id = session.getAttribute("id").toString();
	System.out.println("Logout session id -> " + id);
	session.invalidate();


%>
<script type="text/javascript">
	alert("로그아웃되었습니다");
	location.href="sessionMain.jsp";
</script>
</body>
</html>