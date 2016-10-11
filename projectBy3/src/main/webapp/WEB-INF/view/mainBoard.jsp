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
	<jsp:include page="../layout/header.jsp"></jsp:include>	
	<section id="main">
		<section class="thumbnails">		    		
			<div id="left"></div>		
			<div id="center"></div>
			<div id = "right"></div>
		</section>		
	</section>
	
</body>
<script type="text/javascript">

	var index = 1;
	var loadData = true;

	window.onload = function() { loadAllBoard(); };	
		
	function loadAllBoard(){	
		<c:url value = "/mainBoard" var="mainBoard"/>
		console.log("로드 데이터");
			$.ajax({
				type : "get",
				url : "${mainBoard}",
				data : {
					index : index,					
				},
				success:function(res){
					console.log(res);
					if(res.length==0){
						alert("끝");
						loadData = false;
					}else{
						++index;
					}					
					$left = $("#left");
					$center = $("#center");
					$right = $("#right");
					$(res).each(function(idx,data){
						<c:url value = "/detailBoard" var="detailBoard"/>
						$newOne = "<a data-poptrox='iframe,600x400' href='${detailBoard}?boardNo=" + data.boardNo
						 		+ "'> <img src='<%=request.getContextPath()%>/img/thumbs/06.jpg' alt='' />"
					     		+"<h3>" + data.title + "</h3></a>";						
			
						switch(idx%3){
						case 0:
							$left.append($newOne);
							break;
						case 1:
							$center.append($newOne);
							break;
						case 2:
							$right.append($newOne);
							break;
						}					
						
				});
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			});

	}
	
	
	$(window).scroll(function(){
		if  ($(window).scrollTop() >= $(document).height() - $(window).height()){
			console.log("스크롤 감지");
			
			console.log(index);
			if(loadData){
				loadAllBoard();
			}else{
				console.log("데이터가 끝입니다");
			}
		}
	});	
	
	
	
	 $("#btn").on("click",function(){
		index = 1;
		$left = $("#left");
		$center = $("#center");
		$right = $("#right");		
		
		$left.empty();
		$center.empty();
		$right.empty();
		loadMyBoard();
	});
	
	 
	 
	 
	 
	
	 function loadMyBoard(){	
			<c:url value = "/selectMyBoard" var="selectMyBoard"/>
			console.log("로드 데이터");
				$.ajax({
					type : "get",
					url : "${selectMyBoard}",
					data : {
						index : index,					
					},
					success:function(res){
						console.log(res);
						if(res.length==0){
							alert("끝");
							loadData = false;
						}else{
							++index;
						}					
						$left = $("#left");
						$center = $("#center");
						$right = $("#right");
						$(res).each(function(idx,data){
							<c:url value = "/detailBoard" var="detailBoard"/>
							$newOne = "<a data-poptrox='iframe,600x400' href='${detailBoard}?boardNo=" + data.boardNo
							 		+ "'> <img src='<%=request.getContextPath()%>/img/thumbs/06.jpg' alt='' />"
						     		+"<h3>" + data.title + "</h3></a>";						
				
							switch(idx%3){
							case 0:
								$left.append($newOne);
								break;
							case 1:
								$center.append($newOne);
								break;
							case 2:
								$right.append($newOne);
								break;
							}					
							
					});
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
				});

		}
	
	


</script>















</html>