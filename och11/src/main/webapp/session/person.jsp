<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기가 1번 폼</title>
<style type="text/css">
	table 	 {background-color: pink;}
	tr:hover {background-color: orange;}
</style>
</head>
<body>
<h2>회원가입</h2>
<form action="personAgree.jsp">
	<table border="1">
		<tr><td>아이디</td> <td><input  type="text" 	 	name="id"  			required="required"></td></tr>
		<tr><td>암호 </td> <td><input  type="password"  	name="password"  	required="required"></td></tr>
		<tr><td>이름 </td> <td><input  type="text" 		name="name"  		required="required"></td></tr>
		<tr><td><input type="submit" value="확인"></td>
		<td><input type="reset" value="취소"></td></tr>
	</table>
</form>
</body>
</html>