<%@page import="och10.Professor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기가 첫번째</title>
</head>
<body>
<%
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();

	ArrayList<Professor> al = new ArrayList<Professor>();
	String sql = "select profno, name from professor";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()) {
		Professor professor = new Professor();
		professor.setProfno(rs.getInt(1));
		professor.setName(rs.getString(2));
		al.add(professor); // 리스트에 교수 한 명 추가
		
	}
	request.setAttribute("al", al); // 안과 바 ㄲ 자꾸 헷갈려 
	// 	전체 교수 목록을 JSP로 넘기기 위해 한 번만 사용!
	//  어디서?	while문 끝난 다음에 딱 한 번만!!
	
	rs.close();
	st.close();
	conn.close();
%>
	<h2>보고 싶은 교수 번호를 선택하세요</h2>
	<form action="mySelect.jsp">
		<select name="pno">
			<c:forEach var="pro11" items="${al }">
				<option value="${pro11.profno }"> ${pro11.profno } ${pro11.name }</option>
			</c:forEach>
		</select><p>
		<input type="submit" value="선택완료">
	</form>
</body>
</html>