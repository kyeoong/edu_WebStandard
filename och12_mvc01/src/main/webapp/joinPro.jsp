<%@page import="och12_mvc01.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	Bean 설정
	Bean에 모든 parameter Setting 
-->
<jsp:useBean id="member" class="och12_mvc01.Member" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	//String id = request.getParameter("id");
	//String name = request.getParameter("name");
	//Member member2 = new Member();
	//member2.setId(id);
	//member2.setName(name);
	
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);
	if(result>0) {
%>	
	<script type="text/javascript">
		alert("회원가입 축하!! 이제 고생 좀 해");
		location.href="loginForm.jsp";
	</script>
<%	}  else {   %>
	<script type="text/javascript">
		alert("헐 실패야 똑바로 해 ~");
		location.href="joinForm.jsp";
	</script>
<%     }        %>
</body>
</html>