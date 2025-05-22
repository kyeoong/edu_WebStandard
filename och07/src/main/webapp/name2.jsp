<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이름1</h2>
${param.name }
<h2>이름2(삼항연산자)</h2>
                                                       <!-- empty param.name =>>  param.name의 값이 비었으면 -->
${empty param.name ? "손님" : param.name } hello <p>    <!-- 파라미터 값이 참이면 "손님" , 아니면 param.name  -->
</body>
</html>