<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.NAME }의 주소는?  <!-- ("mapView.jsp?NAME=Park") 이렇게 form문 처럼 보내줬으니까 param.NAME 쓸 수 있는 것이다 -->
	${Address[param.NAME] } <p>   

	${Address.Jasica } <p>
	${Address.Susan }  <p>
	${Address["박"] }  <p> <!--  왠만하면 한글로 하지 말고 해야하면 [] 사용하라 -->
						  <%-- 	${Address.박 }  ${Address."박" }  ==>> 안됨 --%>
</body>
</html>