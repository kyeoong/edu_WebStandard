<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<!-- 
			1. deptno 를 가지고 dept 조회
			2. deptno ,dname , loc : request.setAttribute
			3. oraDeptIn.jsp Page이동
			    EL : deptno ,dname , loc 
 	-->
 	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String deptno = request.getParameter("deptno");
	String sql = "Select deptno, dname, loc from dept WHERE deptno = ?";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	PreparedStatement ptmt = conn.prepareStatement(sql);
	
	ptmt.setString(1, deptno);
	
	ResultSet rs = ptmt.executeQuery();
	if(rs.next()){
		request.setAttribute("deptno", deptno);  // 어차피 optimizer로 변환해줌
		request.setAttribute("dname", rs.getString(2));   // DB에서 값 꺼낼 때는 rs.getString() or rs.getInt() 쓴다!
		request.setAttribute("loc", rs.getString("loc"));
		
		rs.close();
		ptmt.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("oraDeptIn.jsp");
	 	rd.forward(request, response);
	 	
	 	return; // forward 후에는 return으로 빠져나오기!
	 	
	}
	rs.close();
	ptmt.close();
	conn.close();
 	%>
 	<script type="text/javascript">
 		alert("없는 부서야");
 		location.href = "oraDeptUpdate.html";
 	</script>
</body>
</html>