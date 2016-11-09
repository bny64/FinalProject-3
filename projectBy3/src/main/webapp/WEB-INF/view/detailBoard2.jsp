<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>글 세부 보기</title>
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
body{
	height: 120%;
}

#bottom {
	margin: 0 auto;
	padding: 20px;
	clear: both;
	text-align: center;
}

#bottom button {
	margin-right: 30px;
}

label {
	color: white;
}
table{
	margin-top: 10%;
}
#writeBoard {
margin-top : 10%;
	margin: 0 auto;
	width: 40%;
	height : 120%;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<div class="content-top">
		<div class="container">
			<div id="writeBoard">
				<!-- 제목 -->
				<table>
					<tr>
						<td><label>제목</label>
						<td><input type="text" id="title" name="title"
							readonly="readonly" value="${board.title }">
					</tr>
					<!-- 왼쪽 메뉴 -->
					<tr>
						<td><label>작성 날짜</label>
						<td><input type="text" id="writedDate" name="writedDate"
							readonly="readonly" value="${board.writedDate }"><br>
					</tr>
					<tr>
						<td><label>내용</label> 
						<td><textarea rows="10" cols="35">${board.content }</textarea>
						</tr>
					<!-- 위치 -->
					<tr>
						<td><label>위치</label>
					
					</tr>
					<!-- 댓글 -->
					<tr>	<td><label>댓글</label>
					<td><input type="text" value="댓글 쓰기">
					<button>댓글 작성</button>
					</tr>
				</table>
				<!-- 하단 버튼 -->
				<div id="bottom">
					<c:url value="/returnMainBoard" var="returnMainBoard"></c:url>
					<a href="${returnMainBoard }"><button>닫기</button></a>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="">
	
</script>
</html>