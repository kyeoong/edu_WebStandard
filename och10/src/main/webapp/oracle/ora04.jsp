<%@page import="och10.Dept"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>각개전투로 setAttribute 보내지 않고 DTO 단위로 보내기</title>
</head>
<body>
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	String deptno = request.getParameter("deptno");
	String sql = "select * from dept where deptno = " + deptno;
	System.out.println("sql=>"+sql);
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	// DAO : Data Access Object 	: DML 처리 Logic
	// DTO : Data Transfer Object 	: 데이터를 전달하는 단위 객체
	
	// 1. DTO 선언
	Dept dept = new Dept();
	
	if(rs.next()){  // if : 결과가 딱 한 줄일 때 (+pk, 중복되지 않아 결과가 1줄 또는 0 이다)       while : 결과가 여러줄 일 때
		int deptnoInt = (rs.getInt(1));
		String dname = rs.getString("dname");    // rs.getString(2)
		String loc = rs.getString(3);		     // 숫자는 조회되는 컬럼 순서
		out.println("부서코드 : "	+ deptno + "<p>");
		out.println("부서명 : "	+ dname  + "<p>");
		out.println("근무지 : "   + loc    + "<p>");
		
					// 1. resqest에 저장 --> deptno , dname , loc
				/* 	request.setAttribute("deptno", deptno);       이렇게 보내기도 하지만
					request.setAttribute("dname", dname);                  주로 DTO 단위로 전달
					request.setAttribute("loc", loc); */
		
		// 2. Dept DTO Setting
		dept.setDeptno(deptnoInt);
		dept.setDname(dname);
		dept.setLoc(loc);
		// 3. Dept(DTO) 로 저장
		request.setAttribute("dept", dept);
		
	} else out.println("그런 부서 없는데");
	rs.close();
	st.close();
	conn.close();	
	
		// 2. RequestDispatcher --> ora03Result.jsp Page 이동
		RequestDispatcher rd = request.getRequestDispatcher("ora04Result.jsp");
		rd.forward(request, response);
	%>
</body>
</html>