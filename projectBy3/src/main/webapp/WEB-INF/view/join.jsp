<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="<%= request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
		<style>
			#main{
				width: 400px;
				margin: 0 auto;
				height: 650px;
			}
			body {
				background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
			}
		</style>
	</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h2>홈페이지 소개</h2>
					</header>
				<!-- Main -->
					<section id="main">
						<div id="joinForm">
							<sform:form method="post" action="joinPage" modelAttribute="user">
								<fieldset>
								<sform:input path="userId" placeholder="ID"/><br>
								<sform:input path="password"  placeholder="비밀번호"  /><br>
								<sform:input path="nickname" placeholder="닉네임"  /><br>
								<sform:input path="userName" placeholder="이름"  /><br>
								<sform:input path="tel" placeholder="***-****-****" /><br>
								<sform:input path="email" placeholder="이메일"  /><br>
								<sform:input path="birthdate" placeholder="yyyy-MM-dd" value="2016-10-04" /><br>
								</fieldset>
								<sform:button>가입 하기</sform:button>
							</sform:form>
							<a href="index.jsp"><button>돌아가기</button></a>
						</div>
					</section>
				<!-- Footer -->
					<!-- <footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. </p>
					</footer> -->
			</div>
	</body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/js/validation/dist/jquery.validate.js"></script>
	<script>
		$("#join").validate({
			rules:{
				name: "required",
				email: {
				      required: true,
				      email: true
				}
			},
			messages:{
				name: "아이디가 비었습니다.",
				email: {
				      required: "이메일을 입력해 주세요.",
				      email: "이메일 형식이 안맞습니다. (ex: name@domain.com)"
				}
			}
		});
	</script>
</html>