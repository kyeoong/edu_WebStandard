<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
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
<%!      
	// Method , Member변수   --> init
	private PrintWriter pw;
	String date;
	
	public void jspInit() {  // jspInit() 약속
		GregorianCalendar gr = new GregorianCalendar();
		date = String.format("%TF %TT", gr, gr);
		String fileName = "c:/log/" + date.replaceAll(":","")+".txt"; // : 있으면 파일 생성 안되서 제거
		try {
		 pw = new PrintWriter(new FileWriter(fileName, true));
		} catch (Exception e ) {
			System.out.println("대박");
		}
		
		
	}
%>
<%
	// doGet / doPost
	String name = request.getParameter("name");
	System.out.println(name+"사회활동");
	String msg = name +"님 방가	";
	// Browser 화면 출력
	out.println(msg + "<p> 현재 시간 : " + date);
	// File 출력
	pw.println(msg + "\r\n 현재 시간 : " + date + "\r\n");		

%>
<%!
	//Method, Member변수 -> Destroy()
	public void jspDestroy() {
		System.out.println("greet 유언활동");
		pw.flush();
		if(pw != null)
			pw.close();
	}
%>
</body>
</html>