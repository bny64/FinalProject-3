<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 글 세부 보기</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Darx Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 












</script>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<style>
#hidden {
	display: none;
}

table {
	margin-top: 20%;
	text-align: left;
	margin-left: 5%;
}

tr>td {
	width: 10%;
}

td>label {
	margin-right: 10%;
}

label {
	color: white;
}

#detailMyBoard {
	width: 40%;
	margin: 0 auto;
	height: 100%;
}

#bottom {
	clear: both;
	padding-top: 5%;
	padding-bottom: 5%;
	margin: 0 auto;
	text-align: center;
}

button {
	margin: 0 auto;
}
#map{
	width : 50%;
	height : 50%;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<div class="content-top">
		<div class="container">
			<div id="detailMyBoard">
				<c:url value="/updateBoard" var="updateBoard"></c:url>
				<sform:form method="post" action="updateBoard"
					modelAttribute="board">
					<!-- 제목 -->
					<label>제목</label>
					<sform:input path="title" />
					<label>작성 날짜</label>
					<sform:input path="writedDate" />
					<label>내용</label>
					<sform:textarea path="content" rows="10" cols="35" /> 
					
					<label>위치</label>
					<div id="map"></div>
					
						<label>댓글</label> <c:forEach items="${reply }" var="re">
						</c:forEach> ${re.replyContets }<input type="text" value="댓글 쓰기"
						id="replyInpyt">
						<button onclick="replyBtn(${board.boardNo})">댓글 작성</button> <!-- attribute 값인데 안보여줘도 될 것들. -->
						<div id="hidden">
							<sform:input path="boardNo" />
							<sform:input path="hit" />
							<sform:input path="userNo" />
							<sform:input path="categoryNo" />
							<sform:input path="imagePath" />
						</div>
						<div id="bottom">
							<sform:button>수정</sform:button>
							<!-- 삭제 버튼(이미지 형식) -->
							<c:url value="/deleteBoard" var="deleteBoard" />
							<a href="${deleteBoard }?boardNo=${board.boardNo}"><input type="button" value="삭제"></a>
							<!-- 닫기 버튼(이미지 형식) -->
							<c:url value="/returnMainBoard" var="returnMainBoard"></c:url>
							<a href="${returnMainBoard }"><input type="button" value="돌아가기"></a>
						</div>
				</sform:form>

			</div>
			<!-- 하단 버튼 -->


			<section class="thumbnails">
			<div id="center">
				<c:forEach items="${hots }" var="hot">
					<a data-poptrox="iframe,600x400" href="#"><img alt="광고"
						src="<%=request.getContextPath()%>/upload/${hot.filePath}"
						width="200px">
						<h3>${hot.title }</h3></a>
				</c:forEach>
			</div>
			</section>

		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d0fc516accb46bd8c6bd705b190857d0"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function replyBtn(boardNo) {
		console.log($("#replyInpyt").val());

		document.location.href = "addReply?boardNo=" + boardNo + "&contents="
				+ $("#replyInpyt").val();

	}
	
	var x = document.getElementById("demo");
	var latitude;
	var longitude;

	window.onload = function() {
		getLocation();
	};
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}
	
	function showPosition(position) {
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
		var markerPosition = new daum.maps.LatLng(position.coords.latitude,
				position.coords.longitude);
		var marker = {
			position : markerPosition
		};
		var staticMapContainer = document.getElementById('map'), // 이미지 지도를 표시할 div  
		staticMapOption = {
			center : new daum.maps.LatLng(position.coords.latitude,
					position.coords.longitude), // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
			marker : marker
		// 이미지 지도에 표시할 마커 
		};
		var staticMap = new daum.maps.StaticMap(staticMapContainer,
				staticMapOption);

	}

</script>
<style>
#locationStr {
	position: relative;
	top: -30px;
	right: 70px
}

#hidden {
	display: none;
}

#getMyLocation {
	width: 10%;
	height: 10%;
}

#viewStatus {
	width: 80%;
}

#targetDate {
	display: none;
}

.contentsWrap {
	margin: 5%;
}

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-family: 'Nunito', sans-serif;
	color: #384047;
}

form {
	max-width: 300px;
	margin: 10px auto;
	padding: 10px 20px;
	background: #f4f7f8;
	border-radius: 8px;
}

h1 {
	margin: 0 0 30px 0;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="search"], input[type="tel"],
	input[type="time"], input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	font-size: 16px;
	height: auto;
	margin: 0;
	outline: 0;
	padding: 15px;
	width: 100%;
	background-color: #e8eeef;
	color: #8a97a0;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

button, input[type="button"] {
	padding: 19px 39px 18px 39px;
	color: #FFF;
	background-color: #4bc970;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid #3ac162;
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin: 0%;
	margin-bottom: 10px;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: black;
}

label.light {
	font-weight: 300;
	display: inline;
}

.number {
	background-color: #5fcf80;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
	border-radius: 100%;
}

@media screen and (min-width: 480px) {
	form {
		max-width: 480px;
	}
}
</style>
</html>