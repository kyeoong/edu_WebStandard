<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
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
	
	// Procedure Call      empno 넣으면 , sal을 돌려 받겠다
	String sql = "{Call Emp_Info3(? , ?)}";
	CallableStatement cs = conn.prepareCall(sql);
	
	//Parameter
	int empno = Integer.parseInt(request.getParameter("empno"));
	System.out.println("empno >> " + empno);
	
	// 급여   받겠다       프로시저의 두 번째 매개변수 (OUT 파라미터, 급여) 등록
	cs.registerOutParameter(2, Types.DOUBLE); 
	// 사번   값 넣겠다    첫 번째 매개변수 (IN 파라미터, 사번) 세팅
	cs.setInt(1, empno);
	cs.execute();       
	// 뭐가 IN이고 뭐가 OUT인지는 프로시저 정의에서 확인
	/* 
	create or replace PROCEDURE Emp_Info3
		(p_empno IN emp.empno%TYPE, p_sal OUT emp.sal%TYPE )
	is
		-- %TYPE 데이터형 변수 선언
		v_empno emp.empno%TYPE;
		v_ename emp.ename%TYPE;
	
	BEGIN
	    dbms_output.enable;
	    -- %type 데이터형 변수 사용
	    SELECT empno, ename, sal
	    INTO v_empno, v_ename, p_sal
	    FROM emp
	    WHERE empno = p_empno;
	    -- 결과값 출력
	    DBMS_OUTPUT.PUT_LINE('사원 번호 : ' || v_empno );
	    DBMS_OUTPUT.PUT_LINE('사원 이름 : ' || v_ename );
	    DBMS_OUTPUT.PUT_LINE('사원 급여 : ' || p_sal );
	END;
	
	 */
	out.println("급여 : " + cs.getDouble(2));
	cs.close();
	conn.close();


%>
</body>
</html>