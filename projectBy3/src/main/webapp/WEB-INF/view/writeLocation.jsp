<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
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

#content {
	width: 60%;
	margin-left: 20%;
	height: 200%;
	clear: both;
}

#map{
	float:left;
	width: 20%;
	margin: 10px;
	margin-bottom: 10%;
}

#list{
	float:right;
	width: 40%;
	margin: 10px;
	margin-bottom: 10%;
}

#bottomBtns{
	clear: both;
	text-align: center;
	margin-left: 10%;
}

#bottomBtns > a{
	margin-right: 100px;
}

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<p id="demo"></p>
	<section id="content">			    		
		<div id="map" style="width: 400px; height: 300px;"></div>
		<div id="list">
			등록된 위치들
		</div>
		<div id="bottomBtns">			
			<%-- <a href="${writeBoardLocation}?latitude=<%=latitude%>&longitude=<%=longitude%>"><button>현위치 저장</button></a> --%>
			<button id="nowLocation">현위치 저장</button>
			<a href="#"><button>확인</button></a>
			<a href="#"><button>닫기</button></a>
		</div>
	</section>
	
	

</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d0fc516accb46bd8c6bd705b190857d0"></script>
<script>
	var x = document.getElementById("demo");
 	var latitude;
	var longitude;
	
	$("#nowLocation").on("click", function(){		
		document.location.href="writeBoardLocation?latitude="+latitude+"&longitude="+longitude;
	});
	
	
	
	
	window.onload = function() {
		getLocation();
	};
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}

	function showPosition(position) {		
		latitude=position.coords.latitude;
		longitude=position.coords.longitude;
		var markerPosition = new daum.maps.LatLng(position.coords.latitude,
				position.coords.longitude);
		var marker = {
			position : markerPosition
		};
		var staticMapContainer = document.getElementById('map'), // 이미지 지도를 표시할 div  
		staticMapOption = {
			center : new daum.maps.LatLng(position.coords.latitude,
					position.coords.longitude), // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
			marker : marker
		// 이미지 지도에 표시할 마커 
		};
		var staticMap = new daum.maps.StaticMap(staticMapContainer,
				staticMapOption);

	}
	
	$("#btn2").on("click",function(){
		console.log("클릭");
		//<c:url value = "/savelocation" var="savelocation"/>
		$.ajax({
			type:"get",
			url:"${savelocation}",
			data :{
				latitude : latitude,
				longitude : longitude,				
			},
			success:function(res){
				console.log("전송");
				$locationDiv = $("#locationDiv");
				$locationDiv.empty();
				$(res).each(function(idx,data){					
					$newOne = "<h3>"+ data.userNo +"    "+ data.latitude + "  " + data.longitude+ " <h3>"; 					
					$locationDiv.append($newOne);
				});
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		
		});
	});
	
	
	
	
	
	
	
	
	
</script>

</html>