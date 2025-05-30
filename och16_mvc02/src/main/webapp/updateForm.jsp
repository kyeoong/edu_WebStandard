<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">

</style>
</head>
<body>
	<form action="updatePro.do" method="post">
		<input type="hidden" name="num" value="${board.num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<table border="1">
			<caption>게시판 수정</caption>
			<tr><td>번호</td><td>${board.num }</td></tr>
			<tr><td>제목</td>
				<td><input type="text" name="subject" required="required"
							value="${board.subject }"></td></tr>
			<tr><td>작성자</td>
				<td><input type="text" name="writer" required="required"
							value="${board.writer }"></td></tr>
			<tr><td>이메일</td>
				<td><input type="text" name="email" required="required"
							value="${board.email }"></td></tr>
			<tr><td>암호</td>
				<td><input type="text" name="passwd" required="required"
							value="${board.passwd }"></td></tr>
			<tr><td>내용</td>
				<td><input type="text" name="content" required="required"
							value="${board.content }"></td></tr>
			<tr><td colspan="2"><input type="submit" value="수정완료"></td></tr>
		</table>
	</form>
</body>
</html>