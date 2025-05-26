<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="och10.Division"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql");
	
	// dno 가져온 뒤 division table 전체 가져오는 sql 문장 생성
	String dno = request.getParameter("dno");
	String sql = "Select * from division where dno = " + dno;
	
	// 1. division DTO 선언
	Division division = new Division();
	// 2. Statement & ResultSet 이용 data Get
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		/* int dno1 = rs.getInt(1);       -->>  division.setDno(dno1);  */
		String dname = rs.getString(2);
		String phone = rs.getString(3);
		String position = rs.getString("position");
		
		// 3. division DTO 에 담기
		division.setDno(rs.getInt(1));
		division.setDname(dname);
		division.setPhone(phone);
		division.setPosition(position);
		
		request.setAttribute("division", division);   // if문 안에 있는 경우, 부서번호가 없으면 division 객체를 만들 이유가 없으니까
													  // setAttribute()를 안 하는 거예요
		
	} else out.println("그런 부서 없어용");
	rs.close();
	stmt.close();
	conn.close();
	
	// request.setAttribute("division", division);    // 이거 안했어 , 꼭 해야해 -->> request.setAttribute()는 JSP에서 데이터를 다음 페이지로 넘길 때 사용하는 방법이니까!!
													  // 그리고 위치 중요한지 알아봐  -->> if문 바깥에서 쓴 경우, 
													  //						      무조건 JSP에 넘어가야 하고, 거기서 null 체크하면서 보여줄 거라면
	// 4. Page 이동 --> my04Result.jsp
	RequestDispatcher rd = request.getRequestDispatcher("my04Result.jsp");
	rd.forward(request, response);
	// 5.  my04Result.jsp에서 부서정보 보여주기
	
%>
</body>
</html>