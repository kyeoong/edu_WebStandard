<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
double[] temp = {9.8, 30.2, 24.7, 23.7, 23.1};
for (int i = 0; i < temp.length; i++) {
	out.println(temp[i]);
	if( i != (temp.length -1)) { // 인덱스 마지막에 , 안찍기 -->> -1
		out.print(", ");
	}
}

%>