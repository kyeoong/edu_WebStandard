<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--    자바 코딩으로 바꾸면 :   Person person = new Person(); -->
	<jsp:useBean id="person" class="och08.Person"></jsp:useBean>
	<%--    자바 코딩으로 바꾸면 :  person.setName("<%=name %>") --%>
	<jsp:setProperty property="name" 	name="person"/>          <!--  하나씩 저장하는 법 -->
	<jsp:setProperty property="gender" 	name="person"/>
	<jsp:setProperty property="age" 	name="person"/>
	
	<h2>인적 사항</h2>
	<!--    자바 코딩으로 바꾸면 :  person.getName() -->
	이름 : <jsp:getProperty property="name" 		name="person"/><p>
	성별 : <jsp:getProperty property="gender" 	name="person"/><p>
	나이 : <jsp:getProperty property="age" 		name="person"/>
</body>
</html>