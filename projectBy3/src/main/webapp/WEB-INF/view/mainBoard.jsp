<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>메인 화면</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- <link href="assets/css/main.css" type="text/css" rel="stylesheet"> -->
<style>
#logo {
	float: left;
	width: 50%;
	display: block;
}

#loginView {
	float: right;
	width: 50%;
	display: block;
}

#main {
	height: 200px;
}
</style>
</head>
<body>
	<%-- <jsp:include page="<%=request.getContextPath()%>/layout/header.jsp"></jsp:include> --%>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<button id="rec"></button>
	<section id="main">

		<!-- Thumbnails -->
		<section class="thumbnails">		    		
			<div id="left">
			</div>		
			<div id="center">				
			</div>
			<div id = "right">				
			</div>
		</section>		
	</section>
	
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var index = 1;
	<c:url value = "/mainBoard" var="mainBoard"/>	
	$("#rec").on("click",function(){	
		console.log("버튼 클릭");
			$.ajax({
				type : "get",
				url : "${mainBoard}",
				data : {
					index : index,					
				},
				success:function(res){
					alert("성공");
					console.log(res);
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			});
	});
	
	
	function dataReceive(){
		<c:url value = "/mainBoard" var="more"/>	
		$.ajax({
			type : "get",
			url : "${more}",			
			sucess:function(res){
				$left = $("#left");
				$center = $("#center");
				$right = $("#right");
				
				$new = $("<a href='<%=request.getContextPath()%>/img/fulls/07.jpg'><img src='<%=request.getContextPath()%>/img/thumbs/07.jpg' alt='' /><h3>Lorem ipsum dolor sit amet</h3>");
								
			}
		});
	}
	
	
	
	
	
	$(window).scroll(function(){
		if  ($(window).scrollTop() >= $(document).height() - $(window).height()){
			console.log("스크롤 감지");
			lastPostFunc();
		}
	});
	
	function lastPostFunc(){
		$left = $("#left");
		$center = $("#center");
		$right = $("#right");
		
		$newOne1 = $("<a href='<%=request.getContextPath()%>/img/fulls/06.jpg'> <img src='<%=request.getContextPath()%>/img/thumbs/06.jpg' alt='' /><h3>Lorem ipsum dolor sit amet</h3>");
		$newOne2 = $("<a href='<%=request.getContextPath()%>/img/fulls/06.jpg'> <img src='<%=request.getContextPath()%>/img/thumbs/06.jpg' alt='' /><h3>Lorem ipsum dolor sit amet</h3>");
		$newOne3 = $("<a href='<%=request.getContextPath()%>/img/fulls/06.jpg'> <img src='<%=request.getContextPath()%>/img/thumbs/06.jpg' alt='' /><h3>Lorem ipsum dolor sit amet</h3>");
		
		$left.append($newOne1);
		$center.append($newOne2);
		$right.append($newOne3);
		
		
	}
	
	


</script>















</html>