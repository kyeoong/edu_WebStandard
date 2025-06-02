<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판</h1>
<%      /*  스크립틀릿 */    // 태그 안쓰기 위해서 jsp 쓴다
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// file 만들기
	String msg = "제목 : " + title + "\r\n";  // txt파일에 넣을 문자열이니까 Windows 스타일 줄바꿈: \r\n
	msg += "작성자 : " + writer + "\r\n";
	msg += "내용 : " + content + "\r\n";
	Date date = new Date();
	long fileName = date.getTime(); // long 타입 숫자로 받겠다잉, getTime -->> 1970년 1월 1일부터 흐른 밀리초를 숫자로 줘
	String real = application.getRealPath("/WEB-INF/out/"+fileName+".txt");  // 뷰단은 폴더 , 서버는 패키지 라고 한다 => 둘 다 디렉토리
	System.out.println(real);// getRealPath  --> 실제 .metadate안에 ~ path에 간다
	FileWriter fw = new FileWriter(real);
	fw.write(msg);
	fw.close();
			
	// 화면 보여주기		
	out.println("제목 : " + title + "<br>");
	out.println("작성자 : " + writer + "<br>");
	out.println("내용 : " + content + "<br>");
	
%>
</body>
</html>