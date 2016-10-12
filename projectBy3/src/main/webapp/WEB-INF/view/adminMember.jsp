<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원  관리</title>
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
	width: 700px;	
	margin-right:auto;
	margin-left:auto;
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
#main {
		height: 200px;
		display:block;
		margin-right:auto;
		margin-left:auto;
		width: 750px;		
	}
	#str{
		width : 300px;
		display: inline-block;
	}	
	#headers{		
		margin-right:auto;
		margin-left:auto;
		width: 700px;		
	}
	#headers2{
		width: 100px;
	}
	#heade{
		text-align:left;
	}
</style>
</head>
<body>
	<br>
<section>
	<div id = "heade">	
		<div id="headers">		
			
			<c:url value="/friendList" var="friendList"/>
			<a href="#"><button>메인 페이지</button></a>	
			
			<c:url value="/adminMember" var="adminMember"/>
			<a href="${adminMember }"><button>회원 관리</button></a>			
			
			<c:url value="/mylocation" var="mylocation"/>
			<a href="${mylocation }"><button>카테고리 관리</button></a>
			
			<c:url value="/mylocation" var="mylocation"/>
			<a href="${mylocation }"><button>로그 아웃</button></a>		
			
								
		</div>
		<br>
		<div id="headers">
			<input id="str1"type="text" placeholder="회원 검색">
		</div>
	</div>
</section>
<hr>
	
	<div>
		<table>
			<tr>
				<th align="center">친구 목록</th>
			</tr>
			<c:forEach var="user" items="${users}">
						<tr>
							<td align="center"><label>프로필 사진</label></td>
							<c:set var="userNo" value="${user.userNo }" />
							<td align="center"><label>${user.userName}</label></td>
							<td align="center"><label>${user.nickname}</label></td>														
							<c:url value="/deleteAdminUser" var="deleteAdminUser"/>
							<td align="center"><a href="${deleteAdminUser}?userNo=${user.userNo}"><button>친구 삭제</button></a>
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