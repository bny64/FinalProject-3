<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>메인 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="<%= request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
		<style>
			#main{
				width: 400px;
				margin: 0 auto;
				height: 600px;
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
						<h2>메인 헤더</h2>
					</header>
				<!-- Main -->
					<section id="main">
						<h1>이곳은 메인입니다!!!!!!!</h1>
					</section>
				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. </p>
					</footer>
			</div>
	</body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script>
		
	</script>
</html>