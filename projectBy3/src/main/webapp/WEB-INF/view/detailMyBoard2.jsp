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
	width: 40%;
	text-align: center;
}

button {
	margin: 0 auto;
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
				<table>
					<c:url value="/updateBoard" var="updateBoard"></c:url>
					<sform:form method="post" action="updateBoard"
						modelAttribute="board">
						<!-- 제목 -->
						<tr>
							<td><label>제목</label>
							<td><sform:input path="title" />
						</tr>
						<tr>
							<td><label>작성 날짜</label></td>
							<td><sform:input path="writedDate" /></td>
						</tr>
						<tr>
							<td><label>내용</label> <td><sform:textarea path="content" rows="10" cols="35"/>
						</tr>
						<tr>
							<td><label>위치</label>
						</td><tr>
							<td><label>댓글</label>
							
							</td><td><c:forEach items="${reply }" var="re">
							</c:forEach>
							${re.replyContets }<input type="text" value="댓글 쓰기" id="replyInpyt">
									<button onclick="replyBtn(${board.boardNo})">댓글 작성</button>
								
						
						</td></tr></tr>
						
						<!-- attribute 값인데 안보여줘도 될 것들. -->
								<div id="hidden">
							<sform:input path="boardNo" />
							<sform:input path="hit" />
							<sform:input path="userNo" />
							<sform:input path="categoryNo" />
							<sform:input path="imagePath" />
						</div>
					
							</sform:form>
				</table>
			</div>
			<!-- 하단 버튼 -->
			<div id="bottom">
				<button>수정</button>
				<!-- 삭제 버튼(이미지 형식) -->
				<c:url value="/deleteBoard" var="deleteBoard" />
				<a href="${deleteBoard }?boardNo=${board.boardNo}"><button>삭제</button></a>
				<!-- 닫기 버튼(이미지 형식) -->
				<c:url value="/returnMainBoard" var="returnMainBoard"></c:url>
				<a href="${returnMainBoard }"><button>닫기</button></a>
			</div>

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
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function replyBtn(boardNo) {
		console.log($("#replyInpyt").val());

		document.location.href = "addReply?boardNo=" + boardNo + "&contents="
				+ $("#replyInpyt").val();

	}
</script>
</html>