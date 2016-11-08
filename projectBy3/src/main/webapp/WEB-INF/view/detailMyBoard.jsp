<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자세히 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
}

#detailWrapper {
	margin: 100px;
	padding: 20px;
	 
}

#title {
	padding: 20px;
}

#leftSide {
	padding: 20px;
	float: left;
	width: 60%;
	margin-bottom: 20px;
}

#rightSide {
	padding: 20px;
	float: right;
	width: 40%;
	margin-bottom: 20px;
}

#bottom {
	margin: 0 auto;
	padding: 20px;
	clear: both;
	text-align: center;
}

#bottom > a{
	border-bottom: none;
	position: relative;
	top : 13px;
}

#bottom > a img{
	margin-right: 100px;
}

#bottom > button{
	margin-right: 100px;
}

table tbody tr {
	border: solid 1px rgba(255, 255, 255, 0.0);
	border-left: 0;
	border-right: 0;
}

table tbody tr:nth-child(2n + 1) {
	background-color: rgba(255, 255, 255, 0.0);
}
table{
	width: 30%;
	margin-left: 25%;
}

#hidden{
	display: none;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="detailWrapper">
			<c:url value="/updateBoard" var="updateBoard"></c:url>
			<sform:form method="post" action="updateBoard" modelAttribute="board">
				<!-- 제목 -->
				<div id="title">
					제목<sform:input path="title"/>
				</div>
				<!-- 왼쪽 메뉴 -->
				<div id="leftSide">
					글쓴 날짜<sform:input path="writedDate"/><br>
					내용 <sform:textarea path="content"/>
				</div>
				<!-- 오른쪽 메뉴 -->
				<div id="rightSide">
					<!-- 위치 -->
					<div id="location">위치</div>
					<!-- 댓글 -->
					<div id="reply">
							댓글<br>
							<c:forEach items="${reply }" var="re">
							${re.replyContets }<br>
							</c:forEach>
					</div>
					
					<br> <input type="text" value="댓글 쓰기" id="replyInpyt">
					<a onclick="replyBtn(${board.boardNo})"><img src="<%=request.getContextPath()%>/img/button/delete.png"></a>
				</div>
				
				<!-- attribute 값인데 안보여줘도 될 것들. -->
				<div id="hidden">
					<sform:input path="boardNo" />
					<sform:input path="hit" />
					<sform:input path="userNo" />
					<sform:input path="categoryNo" />
					<sform:input path="imagePath" />
				</div>
			
				<!-- 하단 버튼 -->
			<div id="bottom">
				<button>수정</button>
				<!-- 삭제 버튼(이미지 형식) -->
				<c:url value="/deleteBoard" var="deleteBoard" /> 
				<a href="${deleteBoard }?boardNo=${board.boardNo}"><img src="<%=request.getContextPath()%>/img/button/delete.png"></a>
				<!-- 닫기 버튼(이미지 형식) -->
				<c:url value="/returnMainBoard" var="returnMainBoard"></c:url>
				<a href="${returnMainBoard }"><img src="<%=request.getContextPath()%>/img/button/close.png"></a>
			</div>
			</sform:form>
			
			
			<section class="thumbnails">
				
				<div id="center">
					<c:forEach items="${hots }" var="hot">
						
						<a data-poptrox="iframe,600x400" href="#"><img alt="광고" src="<%=request.getContextPath()%>/upload/${hot.filePath}" width="200px"><h3>${hot.title }</h3></a>
						
						
					</c:forEach>
				</div>
				
			</section>	
			
			
			
			
			
			
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function replyBtn(boardNo){
		console.log($("#replyInpyt").val());
		
		document.location.href="addReply?boardNo="+boardNo+"&contents="+$("#replyInpyt").val();
		
	}

</script>
</html>