<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="num1" 	required="true" type="java.lang.Integer"%>
<%@ attribute name="num2"  	required="true" type="java.lang.Integer" %>
<%@ variable name-given="maximum" scope="AT_END" variable-class="java.lang.Integer" %>
<%
	int result;
	if (num1 >= num2) result = num1;
	else              result = num2;
	
%>

<c:set var="maximum" value="<%=result %>"></c:set>