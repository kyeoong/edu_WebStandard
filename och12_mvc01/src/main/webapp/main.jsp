<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#header {
		width: 80%;
		margin : 0 auto;
		text-align: center;
	}
	
	#main {
		width: 80%;
		margin : 0 auto;
	}
	
	#footer {
		width: 80%;
		margin : 0 auto;
		text-align: center;
	}
</style>
<!-- 최신 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- 테마 모달, 드롭다운, 등 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div id="header">
	<h1>회원관리</h1>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<!-- 행버거 버튼  추가 -->
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
          </button>
		  <div class="container-fluid">
		    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		      <div class="navbar-nav">
		        <a class="nav-link active" aria-current="page" href="logOut.jsp">로그아웃</a>
		        <a class="nav-link" href="joinForm.jsp">회원가입</a>
		        <a class="nav-link" href="memberList.jsp">회원명단</a>
		        <a class="nav-link" href="updateForm.jsp">회원정보수정</a>
		        <a class="nav-link" href="deleteForm.jsp">회원탈퇴</a>
		      </div>
		    </div>
		  </div>
		</nav>
		
	<!-- 	
	    <a href="logOut.jsp">로그아웃</a>
		<a href="joinForm.jsp">회원가입</a>
		<a href="memberList.jsp">회원명단</a>
		<a href="updateForm.jsp">회원정보수정</a>
		<a href="deleteForm.jsp">회원탈퇴</a> 
	
     -->
		
	</div>
	<div id = "main">
		<img alt="회원이미지1" src="image/back2.jpg">
	</div>
	<div id="footer">
		<h2>푸터</h2>
		<p> 모든 저작권은 중앙정보처리 회사에 있습니다 </p>
		<p> 02-333-5678 </p>   
	</div>
</body>
</html>