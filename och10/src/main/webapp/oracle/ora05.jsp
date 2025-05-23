<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
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
<title>여긴 MVC Model Version 1 / Version 2</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	String sql = "select empno, ename, job, sal from emp";
	System.out.println("sql=>"+sql);
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	/* select empno, ename, job, sal from emp
	7369	SMITH	CLERK	1000
	7499	ALLEN	SALESMAN	2200
	7521	WARD	SALESMAN	1250
	7566	JONES	MANAGER	2975
	7654	MARTIN	SALESMAN	1250
	7698	BLAKE	MANAGER	2850
	7782	CLARK	MANAGER	2140
	7788	SCOTT	ANALYST	3000
	7839	KING	PRESIDENT	5000
	7844	TURNER	SALESMAN	1500
	7876	ADAMS	CLERK	1100
	7900	JAMES	CLERK	950
	7902	FORD	ANALYST	3150
	7934	MILLER	CLERK	1300
	1500	홍길동		
	7937	박주현	SQL	3800
	1601	노경민	DEVELOPER	3000
	1602	홍길동1		
	3000	유상진	SQL	3500
	3100	안도건	SQL	3500
	3200	와이키	SQL	1000
	7935	김경민	Developer	3500
	7936	김경민3	DBA	3800
 */
 
	// Collection ArrayList 생성 : 복수개로 있는 것을 단순 table로는 안됨, ArrayList 로 감싸서 가져간다 
	ArrayList<Emp> al = new ArrayList<Emp>();
	if(rs.next()) {
		do {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setSal(rs.getInt(4));
			al.add(emp);
			
		}while(rs.next());
		request.setAttribute("al", al);
		rs.close();
		st.close();
		conn.close();
		/* RequestDispatcher rd = request.getRequestDispatcher("ora05Mvc01.jsp"); */
		RequestDispatcher rd = request.getRequestDispatcher("ora05Mvc02.jsp");
		rd.forward(request, response);
		
	} else {
		out.println("데이터가 없습니당");
		st.close();
		conn.close();
	}
	

%>
</body>
</html>