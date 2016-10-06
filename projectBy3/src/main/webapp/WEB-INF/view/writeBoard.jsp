<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css"
	type="text/css" rel="stylesheet">
<style>
body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
}

#title {
	width: 40%;
	height: 70%;
	margin-top: 5%;
	margin-left: 30%;
	/* border: 1px solid yellow; */
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
	/* border: 1px solid red; */
	margin-left: 30%;
	clear: both;
	vertical-align: middle;
}

#content {
	/* border: 1px solid green;  */
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
	/* border: 1px solid blue; */
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
<!-- Header -->
	<header id="header">
		<h2>홈페이지 소개</h2>
		<div id=title>
			<table style="filter:alpha(opacity=50)">
				<tr>
					<td><label>제목</label></td>
					<td><input type="text" placeholder="제목을 입력하세요"></td>
				</tr>
			</table>
		</div>
		<div id=category>
			<h1>카테고리 설정</h1>
		</div>
		<div id="content">
			<textarea rows="7" cols="8"></textarea>
		</div>
		<div id="insertData">
			<h3>데이터 첨부</h3>
		</div>
		<div id="map">
			<button>쓰기</button>
			<button>취소</button>
		</div>
</body>
</body>
</html>