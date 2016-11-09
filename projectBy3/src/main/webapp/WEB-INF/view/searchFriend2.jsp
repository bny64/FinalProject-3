<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>친구 찾기</title>
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
	background-color: #1B1B1D;
}
label {
	display: inline;
}

table {
	width: 83%;
	margin-top: 10%;
	margin-left: 7%;
	color: #777777;
}
table tr {
	border-bottom: 1px solid gray;
	padding-bottom: 3%;
}

table th {
	font-size: 1.2em;
	color: white;
	text-align: center;
	padding: 2%;
	color: white;
}

select {
	color: silver;
}

#search {
	margin-left: 7%;
	width: 83%;
}

#nickname {
	width: 50%;
	float: left;
	margin-left: 10%;
	margin-bottom: 50px;
	margin-right: 20px;
}

#btnSearch {
	float: right;
	width: 10%;
}

#btnViewAllUsers {
	float: right;
	margin-left: 20px;
	margin-bottom: 50px;
}

.content-top {
	height: 80%;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<div class="content-top">
		<div class="container">
			<div id="search">
				<c:url value="/initSearchFriend" var="initSearchFriend" />
				<a href="initSearchFriend">
					<button id="btnViewAllUsers">모든 유저 보기</button>
				</a>
				<c:url value="/searchFriend" var="searchFriend" />
				<form action="searchFriend" method="post">
					<input type="text" id="nickname" name="nickname"
						placeholder="검색할 닉네임을 입력해주세요.">
					<button id="btnSearch">검색</button>
				</form>
			</div>
			<table>
				<tr>
					<th align="center">유저 목록</th>
					<th align="center">이름</th>
					<th align="center">닉네임</th>
				</tr>
				<c:forEach var="users" items="${users}">
					<tr>
						<td align="center"><label>프로필 사진</label></td>
						<td align="center"><label>${users.userName}</label></td>
						<td align="center"><label>${users.nickname}</label></td>
						<td align="center"><c:url value="/insertFriend"
								var="insertFriend" /> <a
							href="${insertFriend}?userNo=${users.userNo}">
								<button>친구 추가</button>
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
</script>
</html>