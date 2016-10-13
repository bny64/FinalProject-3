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
	
	#btnGetAllBoard{
		position: relative;
		top: -90px;
		left: 315px;
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
			<c:url value="/setupPage" var="setup"/>
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
			<!-- <button id = "btnCategory">카 테 고 리</button> -->
			
			<input id="str"type="text" placeholder="글 검색">
			
			<c:url value="/friendList" var="friendList"/>
			<a href="${friendList }"><button>친구 관리</button></a>
			
			<c:url value="/writeBoard" var="writeBoard"/>
			<a href="${writeBoard }"><button>글쓰기</button></a>
			
			<button id="btnGetMyBoard">내글보기</button>
			
			<c:url value="/mylocation" var="mylocation"/>
			<a href="${mylocation }"><button>위치저장</button></a>
			
			<button id="btnGetAllBoard">전체 글 보기</button>
							
		</div>
	</div>
</section>
<br>

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
