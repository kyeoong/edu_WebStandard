<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>제품정보</h2>
	<%-- <jsp:useBean id="pt" class="och08.Product" scope="request"></jsp:useBean> --%>
	<jsp:useBean id="pt" class="och08.Book" scope="request"></jsp:useBean>      		<!--  이어서 쓸 경우 아이디는 똑같이 맞춰서 써야한다  -->
	코드 : 	<jsp:getProperty 	property="code" 	name="pt"/><p>
	name : 	<jsp:getProperty 	property="name" 	name="pt"/><p>
	price : <jsp:getProperty 	property="price" 	name="pt"/><p>
	writer : <jsp:getProperty 	property="writer" 	name="pt"/><p>      				<!--   12번 Line 이랑 Pair -->
	
	
	<%-- 
	
	1 >> book1.jsp에서 필드명과 클래스 변수명이 동일하지 않은 경우 													 		=> 페이지 에러는 아니고 null 값이 나온다
	2 >> productinfo.jsp에서 <jsp:useBean id="pt" class="och08.Book"> 에서 book 클래스에 없는 property를 쓰면    		=> 페이지 에러
	3 >> class에서 getter 메소드를 막아두면 <jsp:getProperty 를 이용하지 못한다 / getProperty는 class에서 getter를 연결시켜준다 	=> 페이지 에러
	
	--%>
</body>
</html>