<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:formatNumber value="100000" 		groupingUsed="true"/><br>
	<fmt:formatNumber value="3.1415923" 	pattern="#.###"/><br>
	<fmt:formatNumber value="3.1"		 	pattern="#.##"/><br>
	<fmt:formatNumber value="3.1" 			pattern="#.00"/><br>
	<fmt:formatNumber value="123456789." 	pattern="#,###.00"/><br>
	<fmt:formatNumber value="250000" 		type="currency" currencySymbol="$"/><br>   currency : 화폐
	<fmt:formatNumber value="0.75" 			type="percent"/><br>

											100,000
											3.142
											3.1
											3.10
											123,456,789.00
											\250,000
											75%
</body>
</html>