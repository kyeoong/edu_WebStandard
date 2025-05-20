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
int num1 = Integer.parseInt(request.getParameter("num1")); // form문으로 나오면 request.getParameter 파라미터 받는다
int num2 = Integer.parseInt(request.getParameter("num2"));

int add = (num1 + num2);
System.out.println("덧셈 : " + add);   // 콘솔창에서 보여주는 것이다, 브라우저 아니다
int min = num1 - num2;
int mul = num1 * num2;
int div = num1 / num2;

//Page 이동방법 (*) 필수
// 순서1. 파라메타 저장
request.setAttribute("add", add); // request객체에 request.setAttribute으로 파라미터 넣기
request.setAttribute("min", min); // request.getAttribute("min") 으로 꺼내기
request.setAttribute("mul", mul);
request.setAttribute("div", div);
// 순서2. Page 이동 선언
RequestDispatcher rd = request.getRequestDispatcher("calResult.jsp"); // 파라미터 4개 들고간다
// 순서3. 진짜 이동
rd.forward(request, response); // request, response 가지고 calResult.jsp 이동

%>
</body>
</html>