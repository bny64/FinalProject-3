<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.*, java.util.*"%>
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
							<td align="left">
								<select id="alarm" name="${friends.alarm}" >
									<%-- <option selected="selected" value="">${friends.alarm }</option> --%>
									<option
									<c:if test='${friends.alarm == "on"}'>selected="selected"</c:if>
									value="on">on</option>
									<option
									<c:if test='${friends.alarm == "off"}'>selected="selected"</c:if>
									value="off">off</option>
								</select>
							</td>
							<c:url value="/deleteFriend" var="deleteFriend"/>
							<td align="center">
							<a href="${deleteFriend}?friendNo=${friends.friendNo}">
							<button>친구 삭제</button>
							<input type="hidden" id="friendNo" value="${friends.friendNo }">
							</a>
							</td>
						</tr>
			<c:set var="No" value="${friends.friendNo }" scope="request"></c:set>
			</c:forEach>
			<!-- 친구 삭제 할 때는 친구 번호도 items에 담겨 오기 때문에 친구 번호로 삭제 -->
			<%-- 		</c:forEach> --%>
		</table>
	</div>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	<c:url value="/updateAlarm" var="updateAlarm"/>
	$(document).on("change", "#alarm" ,function(){
		$.ajax({
			type : "post",
			url : "${updateAlarm}",
			data : {
				alarm : $("#alarm").val(),
				friendNo : $("#friendNo").val()
			},
			success : function(res){
				$("#alarm").val(res);
			},
			error:function(xhr, status, error){
				alert("잘못된 접근입니다");
			}
		});
	});
<%-- 	var friend = ${friends};
	<c:url value="/deleteFriend" var="deleteFriend"/>
	$("#deleteBtn").on("click",function(){
		$.ajax({
			type:"post",
			url : "${deleteFriend}",
			data : {
				friendNo : $("#deleteBtn").val()
			},
			success : function(){
				alert("삭제 되었습니다");
				location.href = "<%=request.getContextPath()%>/friendList";
				
			},
			error:function(xhr, status, error){
				alert("잘못된 접근입니다");
			}
		});
	}); --%>
</script>
</html>