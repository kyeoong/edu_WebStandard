<%@page import="och12_mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	MemberDao md = MemberDao.getInstance();

	int result = md.check(id, password);
	// 존재하는 User -->> PreparedStatement 사용
	if (result == 1) {
		session.setAttribute("id", id);         // 서버가 id를 기억하고 로그인 상태 유지
		System.out.println("Login Success ~");
		response.sendRedirect("main.jsp");      // 로그인 성공 후 메인 페이지로 이동
		// Password 틀리면
	} else if (result == 0) {
		session.setAttribute("id", "");  // session에 id가 아무것도 안들어간 상태가 되어 <%@ include file="memberCheck.jsp"  실행되어  loginForm.jsp 로 이동하게 한다
%>		
	<script type="text/javascript">
		alert("암호 몰라?");
		history.go(-1);
	</script>
<%  } else   { %>
<script type="text/javascript">
		alert("User 미존재(-1) 넌 누구냐 수상한데?");
		history.go(-1);
	</script>
<%  }          %>
</body>
</html>