<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

table tbody tr {
	border: solid 1px rgba(255, 255, 255, 0.0);
}

table tbody tr:nth-child(2n + 1) {
	background-color: rgba(255, 255, 255, 0.0);
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
	/* border: 1px solid gray; */
	clear: both;
}

#map button {
	text-align: center;
	margin: 30px;
}



</style>
</head>
<body>
	<div id="title">
		<h2>홈페이지 소개</h2>
	</div>
	<div id="title">
		<input type="text" placeholder="제목을 입력하세요">
	</div>
	<br>

	<div id="category">
		<select>
			<option selected="selected">카테고리를 선택하세요</option>
			<c:forEach items="${category}" var="ct">
				<option><c:out value="${ct.categoryName }" /></option>
			</c:forEach>
		</select>
	</div>
	<br>
	<div id="content">
		<textarea rows="9" cols="8" placeholder="내용을 입력하세요"></textarea>
	</div>
	<div id="insertData" >
		<input type="file" value="file">		
	</div>
	<br>
	<div id="map">
		<label>지도 정보</label> 
	</div>
	<div id="map">
		<button id="onclick">쓰기</button>
		<button>취소</button>
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

	$("#onclick").on("click",function(){
		<c:url value = "/writeBoard" var = "writeBoard"/>
		$.ajax({
			type:"post",
			url : "${writeBoard}",
			data :{
				
			},
			success:function(){
				alert("저장완료");
			}
		});
	});
	































</script>
</html>