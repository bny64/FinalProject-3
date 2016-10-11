<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구 관리</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=request.getContextPath()%>/css/main.css" type="text/css"
	rel="stylesheet">
<style>
	body {
	background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
}
#logo {
	margin-top: 10%;
	text-align: center;
	/* border: solid 1px green; */
}

label {
	display: inline;
}

#logo>button {
	margin-left: 70%;
}

table {
	width: 83%;
	margin-top: 2%;
	margin-left: 7%;
	margin-top: 2%;
	/* 	border: solid 1px yellow; */
}

table th {
	text-align: center;
	padding: 0;
}

select {
	color: silver;
}
</style>
</head>
<body>
	<!-- Header -->
	<div id="logo">
		<label>로고</label>
		<button>로그아웃</button>
	</div>
	<div>
		<table>
			<tr>
				<th align="center">친구 목록</th>
			</tr>
			<c:forEach var="friends" items="${friends}">
						<tr>
							<td align="center"><label>프로필 사진</label></td>
							<td align="center"><label>${friends.userName}</label></td>
							<td align="right"><label>알람 설정</label></td>
							<td align="left"><select id="alarm">
									<option selected="${friends.alarm}">
									<option value="ON">ON</option>
									<option value="OFF">OFF</option>
							</select></td>
							<td align="center"><button id="deleteBtn">친구 삭제</button>
							</td>
						</tr>
			</c:forEach>
			<!-- 친구 삭제 할 때는 친구 번호도 items에 담겨 오기 때문에 친구 번호로 삭제 -->
			<%-- 		</c:forEach> --%>
		</table>
	</div>
</body>
</html>