<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>메인 화면</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- <link href="assets/css/main.css" type="text/css" rel="stylesheet"> -->
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
</style>
</head>
<body>
	<%-- <jsp:include page="<%=request.getContextPath()%>/layout/header.jsp"></jsp:include> --%>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<section id="main">

		<!-- Thumbnails -->
		<section class="thumbnails">
			<div>
				<a href="<%=request.getContextPath()%>/img/fulls/01.jpg"><img src="<%=request.getContextPath()%>/img/thumbs/01.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3> </a> 
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg">
					<img src="<%=request.getContextPath()%>/img/thumbs/02.jpg" alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/02.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/02.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/02.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
				
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/02.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
				
				<a href="<%=request.getContextPath()%>/img/fulls/02.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/02.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
				
			</div>
			<div>
			
				<a href="<%=request.getContextPath()%>/img/fulls/03.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/03.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/04.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/04.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
				
				 <a href="<%=request.getContextPath()%>/img/fulls/05.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/05.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/05.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/05.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/05.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/05.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/05.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/05.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> 
				
				<a href="<%=request.getContextPath()%>/img/fulls/05.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/05.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
			</div>
			<div>
				<a href="<%=request.getContextPath()%>/img/fulls/06.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/06.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> <a href="<%=request.getContextPath()%>/img/fulls/07.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/07.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> </a> <a href="<%=request.getContextPath()%>/img/fulls/07.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/07.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> </a> <a href="<%=request.getContextPath()%>/img/fulls/07.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/07.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a> </a> <a href="<%=request.getContextPath()%>/img/fulls/07.jpg"> <img src="<%=request.getContextPath()%>/img/thumbs/07.jpg"
					alt="" />
					<h3>Lorem ipsum dolor sit amet</h3>
				</a>
			</div>
		</section>

	</section>

</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
</html>