<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>메인 화면</title>
<meta charset="utf-8" />
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<style>
#logo {
	float: left;
	width: 50%;
	display: block;
}

#loginView {
	float: right;
	width: 50%;
	display: block;
}

#main {
	height: 200px;
}

/* aaa */

/* aaa */
</style>
</head>
<body>
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- content -->
	<div class="content-top">
		<div class="container">
			 <div class="amazing">
				<div class="col-md-3 amaze">
					<div class="ama-top">
						<h3>This is a truly amazing piece of work</h3>
					</div>
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img4.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-top">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img1.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img6.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-top">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img2.jpg" class="img-responsive" alt="" />
								<ul class="social-ic1">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-top">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img3.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
					<div class="ama-bottom">
						<h3>Perfect for showcasing photographies</h3>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img5.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 amaze">
					<div class="ama-bottom">
						<h3>Perfect for showcasing photographies</h3>
					</div>
				</div>
				<div class="col-md-6 amaze-2">
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img7.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img8.jpg" class="img-responsive" alt="" />
								<ul class="social-ic1">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 amaze">
					<div class="portfolio-wrapper ">
						<div class="ama-bottom">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img9.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
					<div class="ama-top">
						<h3>This is a truly amazing piece of work</h3>
					</div>
				</div>
				<div class="col-md-6 amaze-2">
					<div class="col-md-6 amaze-1">
						<div class="portfolio-wrapper ">
							<div class="ama-bottom">
								<a href="details.html"
									class="b-link-stripe b-animate-go  thickbox play-icon"> <img
									src="<%= request.getContextPath() %>/img/img10.jpg" class="img-responsive" alt="" />
									<ul class="social-ic">
										<li class="down"><span> </span></li>
									</ul>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 amaze-1">
						<div class="ttt">
							<div class="ama-top">
								<h3>This is a truly amazing piece of work</h3>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="portfolio-wrapper ">
						<div class="ama-top">
							<a href="details.html"
								class="b-link-stripe b-animate-go  thickbox play-icon"> <img
								src="<%= request.getContextPath() %>/img/img11.jpg" class="img-responsive" alt="" />
								<ul class="social-ic">
									<li class="down"><span> </span></li>
								</ul>
							</a>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div> 
		</div>
	</div>
	<!-- content -->
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
</body>
<script>
</script>













</html>