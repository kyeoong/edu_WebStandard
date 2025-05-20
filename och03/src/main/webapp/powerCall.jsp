<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
2^8 = <%=power(2,8) %><p>

<%! // !추가하면 메소드 추가 사용 가능
	// x의 y승 표현하는 메소드
	int power(int x, int y){
		int result = 1;
		
		for(int i = 0 ; i <y ; i++){
			result *= x;
		}
		
		return result;
}
%>
</body>
</html>