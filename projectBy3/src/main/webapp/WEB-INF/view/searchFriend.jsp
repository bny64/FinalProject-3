<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
	body {
		background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
	}
	
	#logo {
		margin-left: 7%;
		margin-top: 10%;
		margin-bottom: 100px;
		width: 83%;
	}
	
	label {
		display: inline;
	}
	
	#logo button {
		float: right;
		margin-right: 20px;
	}
	
	table {
		width: 83%;
		margin-top: 2%;
		margin-left: 7%;
	}
	
	table th {
		text-align: center;
		padding: 0;
	}
	
	select {
		color: silver;
	}
	
	#search{
		margin-left: 7%;
		width: 83%;
	}
	
	#nickname{
		width: 50%;
		float: left;
		margin-left: 10%;
		margin-bottom: 50px;
		margin-right:20px;
	}
	
	#btnSearch{
		float: right;
		width: 10%;
	}
	
	#btnViewAllUsers{
		float: right;
		margin-left: 20px;
		margin-bottom: 50px;
	}
	
</style>
</head>
<body>
	<!-- Header -->
	<div id="logo">
		<label>로고</label>
		<button>로그아웃</button>
		<c:url value="/friendList" var="friendList"/>
		<a href="friendList">
			<button>친구 관리</button>
		</a>
	</div>
	<div>
		<div id="search">
			<c:url value="/initSearchFriend" var="initSearchFriend"/>
			<a href="initSearchFriend">
				<button id="btnViewAllUsers">모든 유저 보기</button>
			</a>
			<c:url value="/searchFriend" var="searchFriend" />
			<form action="searchFriend" method="post">
				<input type="text" id="nickname" name="nickname" placeholder="검색할 닉네임을 입력해주세요.">
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
					<td align="center">
						<c:url value="/insertFriend" var="insertFriend"/>
						<a href="${insertFriend}?userNo=${users.userNo}">
							<button>친구 추가</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</html>