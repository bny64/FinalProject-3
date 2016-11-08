<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>글 쓰기</title>
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
body {
	height: 120%;
}

#head {
	margin-top: 5%;
	text-align: center;
}

label {
	color: white;
}

input, textarea {
	color: rgba(255, 255, 255, 0.65);
	font-family: "Source Sans Pro", Helvetica, sans-serif;
	font-size: 13pt;
	font-weight: 200;
	line-height: 1.65;
	background: rgba(255, 255, 255, 0.075);
	border-radius: 4px;
}

#inputForm {
	margin-top: 5%;
	margin-left: 20%;
	margin-right: 20%;
}

#title {
	margin-left: 15%;
	margin-bottom: 1%;
}

#title>input {
	width: 50%;
}

#category {
	margin-left: 15%;
	margin-bottom: 1%;
}

#category>select {
	width: 30%;
	height: 10%;
	margin-left: 10%;
}

#content {
	height: 40%;
	vertical-align: top;
	margin-left: 15%;
	margin-bottom: 3%;
}

#content>textarea {
	width: 50%;
	height: 40%;
	color: white;
}

#insertData {
	margin-left: 15%;
	margin-bottom: 3%;
}

#insertData>input {
	position: relative;
	top: - 100%;
}

#map {
	margin-left: 15%;
	margin-bottom: 1%;
}

#getMyLocation {
	width: 4.5%;
	height: 4.5%;
}

#bottomBtns {
	margin-top: 5%;
	margin-left: 20%;
	clear: both;
	text-align: center;
	margin: 30px;
}

#bottomBtns>button {
	margin-right: 100px;
}

#hidden {
	display: none;
}

#bottomBtns>a {
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

#bottomBtns>a>img {
	top: 12px;
	position: relative;
}

#slowMessage {
	margin-left: 15%;
	margin-bottom: 1%;
}

#slowMessage>input {
	margin-left: 8%;
}

#date {
	color: white;
}

#targetDate {
	color: white;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<div class="content-top">
		<div class="container">
			<c:url value="/writeBoard" var="writeBoard" />
			<sform:form method="post" action="writeBoard" modelAttribute="board"
				id="inputForm" enctype="multipart/form-data">
				<div id="title">
					<label>제목</label>
					<sform:input path="title" placeholder="제목을 입력해 주세요." />
				</div>
				<br>

				<div id="category">
					<sform:label path="categoryNo">카테고리</sform:label>
					<sform:select path="categoryNo" multiple="" items="${category }"
						itemLabel="categoryName" itemValue="categoryNo" />
				</div>
				<br>
				<div id="content">
					<label>내용</label>
					<sform:textarea path="content" placeholder="내용을 입력해 주세요." />
				</div>
				<div id="insertData">
					<label>파일 첨부</label>
					<sform:input path="file" type="file" />
					<!-- <input type="file" name="file"> -->
				</div>
				<div id="map">
					<label>게시물 보임 여부</label>
					<sform:select path="viewStatus" id="viewStatus">
						<sform:option value="visible">그냥 보이기</sform:option>
						<sform:option value="hidden" selected="selected">숨기기</sform:option>
					</sform:select>
					<c:url value="/getMyLocation" var="getMyLocation" />
					<!-- 민국 - 팝업으로 바꿔야함. -->
					<a href="${getMyLocation }" id="locationLink"><img
						id="getMyLocation" src="<%=request.getContextPath()%>/img/gps.jpg"></a>
					<h2 id="locationStr">${locationName }</h2>
				</div>
				<div id="slowMessage">
					<label>느린 우편</label>
					<sform:input type="datetime-local" path="targetDate"
						id="targetDate" />
				</div>
				<div id="bottomBtns">
					<button id="writeBtn">쓰기</button>
					<c:url value="/returnMainBoard" var="returnMainBoard" />
					<a href="returnMainBoard"> <img
						src="<%=request.getContextPath()%>/img/button/close.png">
					</a>
				</div>

				<div id="hidden">
					<sform:input path="boardNo" />
					<sform:input path="userNo" />
					<sform:input path="imagePath" />
					<sform:input path="latitude" />
					<sform:input path="longitude" />
				</div>
			</sform:form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	console.log(
<%=request.getAttribute("latitude")%>
	);
	console.log(
<%=request.getAttribute("longitude")%>
	);

	$("#viewStatus").on("change", function() {
		if ($("#viewStatus").val() == 'visible') {
			$("#getMyLocation").css("visibility", "hidden");
			$("#locationLink").css("display", "none");
			$("#locationStr").css("display", "none");

		} else {
			$("#getMyLocation").css("visibility", "visible");
			$("#locationLink").css("display", "block");
			$("#locationStr").css("display", "block");
		}

	});

	/* <c:url value="/getMyLocation" var="getMyLocation"/>
		$("#getMyLocation").on("click", function() {
			$.ajax({
				type : "get",
				url : "${getMyLocation}",
				data : {
				},
				success : function() {
				},
				error : function(xhr, status, error) {
					alert("해당 하는 정보가 없습니다");
				}
			});
		}); */
</script>
</html>