<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${param.name }님이 좋아하는 동물은</h1>
	${paramValues.pet[0] } ${paramValues.pet[1] } ${paramValues.pet[2] }
	<!-- form문은 파라미터이고
		 파라미터 배열은 벨류쯔 paramValues 를 쓴다 
		 현재까지 100개면 100개 이렇게 뽑아야 한다-->
	
</body>
</html>