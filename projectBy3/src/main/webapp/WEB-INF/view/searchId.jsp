<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>패스워드 찾기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
#searchId {
	width: 300px;
	margin: 0 auto;
	height: 600px;
	align: center;
}

#body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
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
		<section id="searchId">
		<div id="searchIdForm">
			<sform:form method="post" action="searchId" modelAttribute="user">
				<fieldset>
					<sform:input path="name" placeholder="이름" />
					<br>
					<sform:input path="email" placeholder="이메일" />
					<br>
					<sform:button>찾기</sform:button>
				</fieldset>
			</sform:form>
			<fieldset>
				<legend>사용자 ID</legend>
				<input id="id" value="사용자 입니다">
			</fieldset>
			<button>회원가입</button>
			<button>돌아가기</button>
		</div>
		<label> </label>
		<div></div>
		</section>
		<!-- Footer -->
		<footer id="footer">
		<p>
			&copy; Untitled. All rights reserved. Design: <a
				href="http://templated.co">TEMPLATED</a>.
		</p>
		</footer>
	</div>
</body>
</html>