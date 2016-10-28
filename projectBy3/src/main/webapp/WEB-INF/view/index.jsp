<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>

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
	}
	#loginView{
		float:right;
		width:50%;
		display:block;
	}
			
	#main{
		height: 200px;
	} 
	body {
		background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
	}
			
	#loginView a {
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
	}
	#loginView a > img {
		top: 14px;
		position: relative;
		padding-left: 1%;
	}
	@media screen and (max-width: 700px){
		input{
			width: 20%;
			margin-left : 20%;
			margin-left : 20%;
		}
	}
	@media screen and (max-width: 700px){
		#loginView{
			width : 25%;
		}
	}
</style>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
	<!-- Header -->
		<header id="header">
			<h2>홈페이지 소개</h2>
			<c:url value="/developer" var="developer"/>
			<a href="developer">개발자 페이지</a>
		</header>
		<!-- Main -->
		<section id="main">
			<div id="logo">
				<span class="avatar"><img src="<%= request.getContextPath() %>/img/avatar.jpg"></span>
					<h2>로고</h2>
			</div>
			<div id="loginView">							
				<c:url value="/login" var="login"/>
				<form method="post" action="${login }">
					<fieldset>
						<legend>로그인</legend>
							<input type="text" name="id" placeholder="아이디"><br>
							<input type="text" name="password" placeholder="패스워드"><br>
					</fieldset>
				<button>로그인</button>
					<c:url value="/joinPage" var="joinPage"/>
					<a href="${joinPage }"><img src="<%=request.getContextPath()%>/img/button/join.png"></a>
					<c:url value="/searchIdPage" var="searchId"/>
					<a href="${searchId }"><img src="<%=request.getContextPath()%>/img/button/searchId.png"></a>
					<c:url value="/searchPassPage" var="searchPass"/>
					<a href="${searchPass }"><img src="<%=request.getContextPath()%>/img/button/searchPass.png"></a>
				</form>	
			</div>
		</section>
		
		<!-- Footer -->
		<footer id="footer">
			<c:url value="/admin" var="admin"/>
			<p><a href = "${admin}">&copy;</a> Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. </p>
		</footer>
	</div>
<!-- Scripts -->
<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.poptrox.min.js"></script>
<script src="<%= request.getContextPath() %>/js/skel.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
</body>
</html>