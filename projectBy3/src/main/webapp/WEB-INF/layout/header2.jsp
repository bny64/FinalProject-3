<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<link href="<%= request.getContextPath() %>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all">
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Darx Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- 구글 폰트 -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/'>
<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>

<section class="header">
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
			/* 메뉴 클릭시 슬라이드 이동 */
			$("span.menu").click(function() {
				$(".head-nav ul").slideToggle(300, function() {
					// Animation complete.
				});
			});
		</script>
	</div>
</section>

<%-- <c:url value="/category" var="category"/>
			<a href="${category }"> --%>
<!-- <button id = "btnCategory">카 테 고 리</button> -->

<!-- <input id="str"type="text" placeholder="글 검색"> -->

<%-- <c:url value="/friendList" var="friendList"/>
			<a href="${friendList }"> --%>

<%-- <c:url value="/writeBoard" var="writeBoard"/>
			<a href="${writeBoard }"> --%>


<%-- <c:url value="/mylocation" var="mylocation"/>
			<a href="${mylocation }"> --%>