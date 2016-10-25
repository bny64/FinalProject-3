<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/jquery.dropotron.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/skel.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/skel-layers.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/init.js"></script>
		<script src="<%= request.getContextPath() %>/css/font-awesome.min.js"></script>
		<script src="<%= request.getContextPath() %>/css/skel.js"></script>
		<script src="<%= request.getContextPath() %>/css/style.js"></script>
		<script src="<%= request.getContextPath() %>/css/style-mobile.js"></script>
		<script src="<%= request.getContextPath() %>/css/style-narrow.js"></script>
		<script src="<%= request.getContextPath() %>/css/style-narrower.js"></script>
		<script src="<%= request.getContextPath() %>/css/style-normal.js"></script>
		<script src="<%= request.getContextPath() %>/css/style-wide.js"></script>
		<script src="<%= request.getContextPath() %>/img/banner.jpg"></script>
		<script src="<%= request.getContextPath() %>/img/placeholder.png"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
	</head> 
	<style>
		#nav{
			margin-right: 70%;
		}
	</style>
	<body class="homepage">

		<!-- Header Wrapper -->
			<div class="wrapper style1">
			
			<!-- Header -->
				<div id="header">
					<div class="container">
							
						<!-- Logo -->
							<h1><a href="#" id="logo">Solarize</a></h1>
						
						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="active"><a href="index.html"></a></li>
									<li>
										<a href="">공주대학교</a>
										<ul>
											<li><a href="http://www.kongju.ac.kr/">Main homepage</a></li>
											<li><a href="http://portal.kongju.ac.kr/">portal site</a></li>
											<li><a href="https://library.kongju.ac.kr/">Library</a></li>
											<li><a href="http://career.kongju.ac.kr/">career</a></li>
										</ul>
									</li>
								</ul>
							</nav>
	
					</div>
				</div>
				
			<!-- Banner -->
				<div id="banner">
					<section class="container">
						<h2>WEB PROGRAMMING</h2>
						<span>201001533</span>
						<p>저희 홈페이지에 오신 것을 환영합니다</p>
					</section>
				</div>

			</div>
		
		<!-- Section One -->
			<div class="wrapper style2">
				<section class="container">
					<div class="row double">
						<div class="6u">
							<header class="major">
								<h2>Pellentesque viverra vulputate enim. Aliquam volutpat. Pellentesque tristique Risus</h2>
								<span class="byline">In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Donec pulvinar ullamcorper metus.</span>
							</header>
						</div>
						<div class="6u">
							<h3>Suspendisse dictum porta</h3>
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Vestibulum imperdiet, magna nec eleifend semper augue mattis wisi maecenas ligula nunc lectus vestibulum euismod lacinia quam nisl.</p>
							<a href="#" class="button">Nulla aluctus eleifend</a>
						</div>
					</div>
				</section>
			</div>

		<!-- Section Two -->
			<div class="wrapper style3">
				<section class="container">
					<header class="major">
						<h2>당신은 하나님을 믿습니까?</h2>
					</header>
					<p>기도문에는 좋은 말이 담겨져 있습니다. </p>
					<p>버튼을 클릭하면 기도문을 보실 수 있습니다</p>
					<c:url value="/gidomoon" var="gidomoon"/>
					<a href="${gidomoon }" class="button alt">기도문 읽기</a>
				</section>
			</div>

		<!-- Section Three -->
			<div class="wrapper style4">
				<section class="container">
					<header class="major">
						<h2>Cras vitae metus aliNuam</h2>
						<span class="byline">pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu.</span>
					</header>
					<div class="row flush">
						<div class="4u">
							<ul class="special-icons">
								<li>
									<span class="fa fa-cogs"></span>
									<h3>Nulla luctus eleifend</h3>
									<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula pellentesque.</p>
								</li>
								<li>
									<span class="fa fa-wrench"></span>
									<h3>Etiam posuere augue</h3>
									<p>Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat liguala.</p>
								</li>
								<li>
									<span class="fa fa-leaf"></span>
									<h3>Fusce ultrices fringilla</h3>
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
						<div class="4u">
							<ul class="special-icons">
								<li>
									<span class="fa fa-cogs"></span>
									<h3>Nulla luctus eleifend</h3>
									<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula pellentesque.</p>
								</li>
								<li>
									<span class="fa fa-wrench"></span>
									<h3>Etiam posuere augue</h3>
									<p>Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat liguala.</p>
								</li>
								<li>
									<span class="fa fa-leaf"></span>
									<h3>Fusce ultrices fringilla</h3>
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
						<div class="4u">
							<ul class="special-icons">
								<li>
									<span class="fa fa-cogs"></span>
									<h3>Nulla luctus eleifend</h3>
									<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula pellentesque.</p>
								</li>
								<li>
									<span class="fa fa-wrench"></span>
									<h3>Etiam posuere augue</h3>
									<p>Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat liguala.</p>
								</li>
								<li>
									<span class="fa fa-leaf"></span>
									<h3>Fusce ultrices fringilla</h3>
									<p>Maecenas pede nisl, elementum eu, ornare ac, malesuada at, erat. Proin gravida orci porttitor.</p>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		
		<!-- Team -->
			<div class="wrapper style5">
				<section id="team" class="container">
					<header class="major">
						<h2>Cras vitae metus aliNuam</h2>
						<span class="byline">pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu</span>
					</header>
					<div class="row">
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Molly Millions</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Henry Dorsett Case</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Willis Corto</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
						<div class="3u">
							<a href="#" class="image"><img src="images/placeholder.png" alt=""></a>
							<h3>Linda Lee</h3>
							<p>In posuere eleifend odio quisque semper augue wisi ligula.</p>
						</div>
					</div>
				</section>
			</div>

	<!-- Footer -->
		<div id="footer">
			<section class="container">
				<header class="major">
					<h2>Connect with us</h2>
					<span class="byline">Integer sit amet pede vel arcu aliquet pretium</span>
				</header>
				<ul class="icons">
					<li class="active"><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
					<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
					<li><a href="#" class="fa fa-dribbble"><span>Pinterest</span></a></li>
					<li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
				</ul>
				<hr />
			</section>
			
			<!-- Copyright -->
				<div id="copyright">
					Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
				</div>			
		</div>

	</body>
</html>
