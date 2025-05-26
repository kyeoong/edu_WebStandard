<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.rmi.server.RemoteStub"%>
<%@page import="och10.Professor"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	
	// 1. pno Get 하여 해당 pno의
	// 2. profno, name, sal, hiredate (pno에 맞는) Select
	int pno = Integer.parseInt(request.getParameter("pno"));
	String sql = "Select profno, name, sal, hiredate From PROFESSOR where profno = " + pno;
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
    // 3.  Professor DTO --> professor 인스턴스
    Professor professor = new Professor();
    if(rs.next() ) {
    	professor.setProfno(pno);
    	professor.setName(rs.getString(2));
    	professor.setSal(rs.getInt(3));
    	professor.setHiredate(rs.getDate(4));
    	
    	// 4. setAttribute("professor", professor);
    	request.setAttribute("professor", professor);
    }
    
    rs.close();
    st.close();
    conn.close();
    // 5. myProfResult.jsp 이동
	RequestDispatcher rd = request.getRequestDispatcher("myProfResult.jsp");
    rd.forward(request, response);
%>
</body>
</html>