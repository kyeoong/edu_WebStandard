<%@page import="och11.MemberDao"%>
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
		//id , password GET
		// MemberDao md Instance(인스턴스) 생성
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao md = new MemberDao();
		// check() -->> 정상 User 인지 확인
		int result = md.check(id, password);
		
		// RESULT  1 id, password 같을때
		//         0 ID는 같고  password x
		//        -1 ID는 x
		if(result == 1) {
			session.setAttribute("id", id);
			response.sendRedirect("sessionMain.jsp");
		} else if ( result == 0 ) {
			
%>
		<script type="text/javascript">
				alert("암호가 틀려 ! 누구냐");
				history.go(-1);
		</script>

<%		} else { %>
		<script type="text/javascript">
				alert("넌 누구냐! 15년간 만두만 주고");
				history.back();
		</script>
		
 <% 	} 	%>
</body>
</html>