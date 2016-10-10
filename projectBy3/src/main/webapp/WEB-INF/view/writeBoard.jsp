<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
}

#title {
	width: 40%;
	height: 70%;
	margin-top: 5%;
	margin-left: 30%;
	text-align: center;
}

#title>input {
	width: 70%;
}

#category {
	width: 40%;
	margin-left: 30%;
	clear: both;
	vertical-align: middle;
}

#content {
	width: 40%;
	margin-left: 30%;
	height: 200%;
	clear: both;
}

#content>input {
	height: 100%;
}

#insertData {
	width: 40%;
	height: 20%;
	margin-top: 2%;
	margin-left: 30%;
	clear: both;
}

#map {
	width: 40%;
	margin-left: 30%;
	clear: both;
}

#map button {
	text-align: center;
	margin: 30px;
}

#hidden{
	display: none;
}

</style>
</head>
<body>
	<div id="title">
		<h2>홈페이지 소개</h2>
	</div>
	
	<c:url value="/writeBoard" var="writeBoard"/>
	<sform:form method="post" action="writeBoard" modelAttribute="board" id="inputForm" enctype="multipart/form-data">
		<div id="title">
			<sform:label path="title">제목</sform:label>
			<sform:input path="title"/>
		</div>
		<br>
	
		<div id="category">
			<sform:label path="categoryNo">카테고리</sform:label>
			<sform:select path="categoryNo" multiple="multiple" items="${category }" itemLabel="categoryName" itemValue="categoryNo"/>
		</div>
		<br>
		<div id="content">
			<sform:label path="content">내용</sform:label>
			<sform:textarea path="content"/>
		</div>
		<div id="insertData" >
			<sform:input path="file" type="file"/>
			<!-- <input type="file" name="file"> -->
		</div>
		<br>
		<div id="map">
			<c:url value="/getMyLocation" var="getMyLocation"/>
			<!-- 민국 - 이미지로 바꿔서 onclick메소드를 통해 ajax로 위치정보호출. -->
			<a href="${getMyLocation }"><img id="getMyLocation" src="<%=request.getContextPath() %>/img/button/getMyLocation.png"></a> 
			<!-- 민국 - ajax로 위치정보 가져와서 가져온값을 보여주는 것을 만들어야됨. -->
		</div>
		<div id="map">
			<button>쓰기</button>
			<button>취소</button>
		</div>
		
		<div id="hidden">
			<sform:input path="boardNo"/>
			<sform:input path="userNo"/>
			<sform:input path="imagePath"/>
		</div>
	</sform:form>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
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