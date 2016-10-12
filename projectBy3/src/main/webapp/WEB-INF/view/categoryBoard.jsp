<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>메인 화면</title>
	

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
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var index = 1;
	var loadData = true;
	var searchMode = false;
	
	window.onload = function() { loadAllBoard(); };	
	
	
	$(window).scroll(function(){
		if ($(window).scrollTop() >= $(document).height() - $(window).height()){
			console.log("스크롤 감지");
			console.log(index);
			if(loadData){
				if(!searchMode){
					loadAllBoard();
				}else{
					search();
				}					
			}else{
					console.log("데이터가 끝입니다");
			}
		}
	});
	
	$("#str").on("keydown",function(e){
		console.log(e.keyCode);
		console.log("다운");
		if(e.keyCode == 13){
			searchMode = true;
			claer();
			search();
			}
	});
	
	
	
	function search(){
		<c:url value = "/searchCategoryBoard" var="searchCategoryBoard"/>
		console.log("로드 데이터");
		$.ajax({
			type : "get",
			url : "${searchCategoryBoard}",
			data : {
				index : index,
				categoryNo : <%=request.getAttribute("categoryNo") %>,
				searchStr :$("#str").val() 
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
	
	
	function claer(){
		index = 1;
		$left = $("#left");
		$center = $("#center");
		$right = $("#right");
		$left.empty();
		$center.empty();
		$right.empty();
	}
				
				
	function loadAllBoard(){
		<c:url value = "/categoryBoard" var="categoryBoard"/>
		console.log("로드 데이터");
		$.ajax({
			type : "get",
			url : "${categoryBoard}",
			data : {
				index : index,
				categoryNo : <%=request.getAttribute("categoryNo") %>,
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
					$newOne = "<a href='${detailBoard}?boardNo=" + data.boardNo
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