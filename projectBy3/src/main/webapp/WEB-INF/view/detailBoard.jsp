<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자세히 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
<style>
	body {
		background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
	}
	#detailWrapper{
		margin: 100px;	
		padding : 20px;
	}
	#title{
		padding : 20px;
	}
	#leftSide{
		padding : 20px;
		float: left;
		width: 60%;
		margin-bottom: 20px;
	}
	#rightSide{
		padding : 20px;
		float: right;
		width: 40%;
		margin-bottom: 20px;
	}
	#bottom{
		margin: 0 auto;
		padding : 20px;
		clear: both;
		text-align: center;
	}
	#bottom button{
		margin-right: 30px;
	}
	
</style>
</head>
<body>
	<div id="wrapper">
		<div id="detailWrapper">
			<!-- 제목 -->
			<div id="title">
				제목<input type="text" id="title" name="title" readonly="readonly" value="${board.title }">
			</div>
			<!-- 왼쪽 메뉴 -->
			<div id="leftSide">
				글쓴 날짜<input type="text" id="writedDate" name="writedDate" readonly="readonly" value="${board.writedDate }"><br>
				내용<textarea rows="10" cols="5">${board.content }</textarea>
			</div>
			<!-- 오른쪽 메뉴 -->
			<div id="rightSide">
				<!-- 위치 -->
				<div id="location">
					위치
				</div>
				<!-- 댓글 -->
				<div id="reply">
					댓글				
				</div>
				<br>
				<input type="text" value="댓글 쓰기">
				<button>댓글 작성</button> 
			</div>
			<!-- 하단 버튼 -->
			<div id="bottom">			
				<button>수정</button>
				<button>삭제</button>
				<button>닫기</button>
			</div>	
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="">
	
</script>
</html>