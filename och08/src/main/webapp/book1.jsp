<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>									<!-- scope의 기본은 scope="page" 라서 값을 넘겨주면 초기화 된다 그래서 request 변경 -->
	<jsp:useBean id="pt" class="och08.Book" scope="request"></jsp:useBean> 		<!--  자바 코딩을 불러서 쓸 수 있다 --> 
	<jsp:setProperty property="*" name="pt"/>    			<!-- "*"가 전체를 쓰겠다 전제 조건 = 클래스 변수와 필드(html) 변수 이름이 동일할때 -->	<!-- 반드시 내가 정의한 id를 name에 써야한다 -->
	<jsp:forward page="productInfo.jsp"></jsp:forward>       <!-- 페이지 이동, 리퀘스트디스패처 -->
</body>
</html>