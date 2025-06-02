<%@page import="java.io.FileWriter"%>
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
	// member.html   parameter 가져오기
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
	String hob = "";
	for(int i = 0 ; i<hobby.length; i++){
		hob += hobby[i]+" ";
	}
	// HW01. "/WEB-INF/file/"+id+".txt"로 만들기
	
	/* request.setAttribute("id", id);
	request.setAttribute("password", password);
	request.setAttribute("name", name);
	request.setAttribute("hobby", hobby);
	request.setAttribute("gender", gender); 
	
	setAttribute는 A.jsp → B.jsp로 forward할 때 사용
	
	*/
	
	String msg = "회원정보\r\n아이디 : "+ id +"\r\n 암호 : " + password + "\r\n이름 : " + name + "\r\n취미 : " + hob + "\r\nt성별 : " + gender ;
	
	String real = application.getRealPath("/WEB-INF/file/"+id+".txt");
	System.out.println(real);
	FileWriter fw = new FileWriter(real);
	
	fw.write(msg);
	fw.close();
%>

<h2>회원정보</h2>
아이디 : <%=id %><br>
암호 : <%=password %><br>
이름 : <%=name %><br>
취미 : <%=hob %><br>
성별 : <%=gender %>

</body>
</html>