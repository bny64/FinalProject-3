<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>어라운드 로그인 페이지</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Darx Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<style>
buton{
	-webkit-appearance: button;
  cursor: pointer;
  width: 100%;
}

</style>
</head>
<body style="background-color: #1b1b1d;">
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="logo">
				<span class="avatar"><img src="<%= request.getContextPath() %>/img/logo.png"></span>
			</div>
			<div class="header-right">
			<div class="header-top">
				<ul>
					<li><a href="#"><i class="alram"> </i></a></li>
					<li><a href="#"><i class="friend"> </i></a></li>
					<li><a href="#"><i class="setting"> </i></a></li>
					<li><a href="#"><i class="logout"> </i></a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
			<div class="head-nav">
				<span class="menu"> </span>
				<ul class="cl-effect-15">
					<li class="active"><a href="index.html">카테고리</a></li>
					<li><a href="blog.html" data-hover="글쓰기">글쓰기</a></li>
					<li><a href="404.html" data-hover="내글 보기" id="btnGetMyBoard">내글
							보기</a></li>
					<li><a href="contact.html" data-hover="위치저장">위치저장</a></li>
					<li><a href="contact.html" data-hover="전체글보기"
						id="btnGetAllBoard">전체글보기</a></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
						<!-- script-for-nav -->
					<script>
						$( "span.menu" ).click(function() {
						  $( ".head-nav ul" ).slideToggle(300, function() {
							// Animation complete.
						  });
						});
					</script>
				<!-- script-for-nav --> 
		</div>
	</div> 
<!-- header -->
<!-- content -->

<!-- content -->
<!-- footer -->
	<div class="footer">
		<div class="container" >
							
				
			<div class="col-md-4 flick">
				<br><br><br><br><br><br>
				
				<div class="flick-form_grid" >
					<h4>STAY IN TOUCH</h4>
				   <c:url value="/login" var="login"/>
					<form method="post" action="${login }">
					 <input type="text" class="form-control" name="id" value="ID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'ID';}">
					 <input type="text" class="form-control" name="password" value="PASSWD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWD';}">
						 <div class="smt">
						 	
						 	<input type="button" value="JOIN" onclick="joinBtn()">
						 	<input type="button" value="SearchID" onclick="searchIdBtn()">
						 	<input type="submit" value="SearchPW" onclick="searchPwBtn()">
							<input type="submit" value="LOGIN">
						 </div>
					</form>
			      </div>
				</div>
					<div class="clearfix"> </div>
			
		</div>
	</div>
		
<!-- footer -->
</body>
<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script>
	function joinBtn(){		
		document.location.href="joinPage";
	}
	function searchIdBtn(){		
		document.location.href="searchId";
	}
	function searchPwBtn(){		
		document.location.href="searchPass";
	}
</script>
</html>