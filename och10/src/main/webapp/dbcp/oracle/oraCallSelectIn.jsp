<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기서 실행</title>
</head>
<body>
<%
		//ArrayList<Emp> al 만들기
		// 1. DBCP
		// 2. emp.empno , emp.ename
		// 3. setAttribute("al", al)
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		String sql = "Select empno ,ename from emp";
		
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<Emp> al = new ArrayList<Emp>();
		if(rs.next()){
			do{
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt(1));
				emp.setEname(rs.getString(2));
				al.add(emp);
			}while(rs.next());
			
		request.setAttribute("al", al);
		}
			/*   33 - 41 대체
			while(rs.next()){
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt(1));
				emp.setEname(rs.getString(2));
				al.add(emp);
			}
			request.setAttribute("al", al);
			 */
		rs.close();
		st.close();
		conn.close();
		
		System.out.println("al.size() --> " + al.size());
%>
		<h2>보고싶은 사원 번호를 선택하세요</h2>
		<form action="oraCallEmpInfo.jsp">
			<select name="empno">
				<c:forEach var="emp1" items="${al}">
					<option value="${emp1.empno }"> ${emp1.empno } ${emp1.ename }</option>
				</c:forEach>
			</select><p>
			<input type="submit" value="선택완료">
		</form>
</body>
</html>