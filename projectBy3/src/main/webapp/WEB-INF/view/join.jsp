<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="<%= request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
		<style>
			
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
						<div></div>
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