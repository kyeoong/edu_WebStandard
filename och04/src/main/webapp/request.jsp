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
	String protocol = request.getProtocol();
	String server = request.getServerName();
	int port = request.getServerPort();
	String clientIp = request.getRemoteAddr();
	String clienHost = request.getRemoteHost();
	String methodType = request.getMethod();
	String url = new String(request.getRequestURL());
	String uri = request.getRequestURI();
	String mediaTypecontextPath = request.getContextPath(); // ***
	String browser = request.getHeader("User-Agent");
	String mediaType = request.getHeader("Accept");
%>
	<h2>Request내장 객체 예제2</h2>
	프로토콜명 : <%=protocol %><P>
	접속한 서버명 :  <%=server %><P>
	접속한 서버의 포트 번호 : <%=port %><P>
	클라이언트의 IP :  <%=clientIp %><P>
	클라이언트의 호스트명 :  <%=clienHost %><P>
	현재 페이지의 method방식 :  <%=methodType %><P>
	요청한 현재 페이지의 경로(URL) : <%=url %><P>
	요청한 현재 페이지의 경로(URI) : <%=uri %><P>
	웹어플리케이션에서의 컨텍스트 경로 :  <%=mediaTypecontextPath%><P>
	사용한 웹 브라우조 :  <%=browser %><P>
	웹 브라우저가 지원하는 매체(media)의 타입 :  <%=mediaType %><P>
</body>
</html>