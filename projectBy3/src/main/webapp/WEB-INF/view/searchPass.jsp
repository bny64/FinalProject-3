<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
#searchPass {
	width: 300px;
	margin: 0 auto;
	height: 600px;
	align: center;
}

body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
}
#pass{
	color:black;
}
</style>
</head>
<body>
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
		<h2>홈페이지 소개</h2>
		</header>
		<!-- Main -->
		<section id="searchPass">
		<div id="searchPassForm">
			<fieldset>
				<legend>회원 정보</legend>
				<label for="id">ID</label>
				 <input type="text" id="id"><br>
				<label for="name">이름</label>
				 <input type="text" id="name"><br>
				<label for="email">이메일</label>
				 <input type="text" id="email"><br>
				<button id="search">찾기</button>
			</fieldset>
			<fieldset>
				<legend>사용자 패스워드</legend>
				<input id="pass">
			</fieldset><br>
			<c:url value="/joinPage" var="joinPage"/>
			<a href="joinPage"><button>회원가입</button></a>
			<a href="index.jsp"><button>돌아가기</button></a>
		</div>
		<label> </label>
		</section>
		<!-- Footer -->
		<!-- <footer id="footer">
		<p>
			&copy; Untitled. All rights reserved. Design: <a
				href="http://templated.co">TEMPLATED</a>.
		</p>
		</footer> -->
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	<c:url value="/searchPass" var="searchPass"/>
	$("#search").on("click", function() {
		$.ajax({
			type : "post",
			url : "${searchPass}",
			data : {
				id : $("#id").val(),
				name : $("#name").val(),
				email : $("#email").val()
			},
			success : function(res) {
				if (res) {
					$("#pass").val(res);
				}
			},
			error : function(xhr, status, error) {
				alert("해당 하는 정보가 없습니다");
			}
		});
	});
</script>
</html>