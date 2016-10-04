<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="<%= request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
		<style>
			#logo{
				float:left;
				width:50%;
				display:block;
				margin: 0 auto;
			}
			#loginView{
				float:right;
				width:50%;
				display:block;
			}
			
			#main{
				height: 200px;
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
						<div id="logo">
							<span class="avatar"><img src="<%= request.getContextPath() %>/img/avatar.jpg"></span>
							<h2>로고</h2>
						</div>
						<div id="loginView">
							<fieldset>
								<legend>로그인</legend>
								<input type="text" name="id" placeholder="아이디">
								<br>
								<input type="text" name="password" placeholder="패스워드">
								<br>
							</fieldset>
							<br>
							<button>로그인</button>
							<button>회원가입</button>
							<button>아이디 찾기</button>
							<button>비밀번호 찾기</button>
						</div>
					</section>
				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. </p>
					</footer>
			</div>
		<!-- Scripts -->
			<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
			<script src="<%= request.getContextPath() %>/js/jquery.poptrox.min.js"></script>
			<script src="<%= request.getContextPath() %>/js/skel.min.js"></script>
			<script src="<%= request.getContextPath() %>/js/main.js"></script>
	</body>
	<script src="http://code.jquery.com/jquery.js"></script>
</html>