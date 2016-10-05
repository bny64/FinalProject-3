<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%= request.getContextPath() %>/css/main.css" type="text/css" rel="stylesheet">
<style>
	#logo1 {
		float: left;
		width: 50%;
		display: block;
		width: 300;
	}
	
	#loginView {		
		width: 40%;
		display: block;
		padding-top: 10px;
		text-align: right;
	}
	
	#main {
		height: 200px;
		
	}
	#str{
		width : 260px;
		display: inline-block;
	}
	
	#main{
		display:block;
		margin-right:auto;
		margin-left:auto;
		width: 750px;
	}	
	#headers{		
		margin-right:auto;
		margin-left:auto;
		width: 800px;		
	}
	#heade{
		text-align:center
	}
	
	body {
		background-image: url("<%=request.getContextPath()%>/img/bg.jpg");
	}
		
</style>

<section id="main">
	<div id="logo1">
		<span class="avatar"><img
			src="<%=request.getContextPath()%>/img/avatar.jpg"
			></span>
	</div>
	<div id="loginView">
		<div>
			<button>전체 알림</button>
			<c:url value="/setup" var="setup"/>
			<a href="${setup }"><button>설정</button></a>
			<c:url value="/logout" var="logout"/>
			<a href="${logout }"><button>로그아웃</button></a>
			
		</div>		
	</div>
	
</section>
<section>
	<div id = "heade">	
		<div id="headers">
			<c:url value="/category" var="category"/>
			<a href="${category }"><button>카 테 고 리</button></a>
			
			<input id="str"type="text" placeholder="글 검색">
			
			<c:url value="/mainFriend" var="mainFriend"/>
			<a href="${mainFriend }"><button>친구 관리</button></a>
			
			<c:url value="/writeBoard" var="writeBoard"/>
			<a href="${writeBoard }"><button>글쓰기</button></a>
			
			<c:url value="/myBoard" var="myBoard"/>
			<a href="${myBoard }"><button>내글보기</button></a>
			
			<c:url value="/mylocation" var="mylocation"/>
			<a href="${mylocation }"><button>위치저장</button></a>
			
			
							
		</div>
	</div>
</section>
<br>
