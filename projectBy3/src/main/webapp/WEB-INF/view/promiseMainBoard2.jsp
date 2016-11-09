<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>약속 잡기</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Darx Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	
	
		
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<style>
#content {
	width: 60%;
	margin-top : 10%;
	margin-left: 20%;
	height: 100%;
	clear: both;
}

#map {
	width: 80%;
	height: 60%;
}

#list {
	width: 40%;
	height: 30%;
	margin-left: 25%;
	overflow: auto;
	margin-top: 5%;
	margin-bottom: 10%;
	border : solid 1px gray;
}

#bottomBtns {
	clear: both;
	text-align: center;
	margin-left: -10%;
	margin-bottom: 10%;
}

#staticMap {
	width: 500px;
	height: 400px;
}

#list>h3 {
	margin-bottom: 4%;
	color: white;
	font-size: 1.2em;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<div class="content-top">
		<div class="container">
			<section id="content">
				<div id="map">
					<div id="staticMap"></div>
				</div>
				<div id="list">
					<h3>받은 약속</h3>
					<c:forEach items="${Inviteepromises }" var="userpromise">
						<a
							onclick="promiseFunction('${userpromise.promiseTitle }',${userpromise.promiseLatitude },${userpromise.promiseLongitude })"><input
							id="str" type="text" readonly="readonly"
							value="${userpromise.promiseTitle }"> </a>
						<select id="promiseStatusId" data-item="${userpromise.promiseId }"
							name="${userpromise.promiseStatus}">

							<option
								<c:if test='${userpromise.promiseStatus == "약속 완료"}'>selected="selected"</c:if>
								value="약속 완료">약속 완료</option>
							<option
								<c:if test='${userpromise.promiseStatus == "약속 중"}'>selected="selected"</c:if>
								value="약속 중">약속 중</option>
						</select>

					</c:forEach>
					<br>
					<h3>내가 약속한 약속</h3>
					<c:url value="/deletePromise" var="deletePromise" />
					<c:forEach items="${Promotepromises }" var="userpromise">
						<a
							onclick="promiseFunction('${userpromise.promiseTitle }',${userpromise.promiseLatitude },${userpromise.promiseLongitude })"><input
							id="str" type="text" readonly="readonly"
							value="${userpromise.promiseTitle }"> </a>
						<a href="${deletePromise}?promiseId=${userpromise.promiseId}">
							<button>취소</button>
						</a>
					</c:forEach>

				</div>
				<div id="bottomBtns">
					<c:url value="/promise" var="promise" />
					<a href="${promise }"><button>약속 하기</button></a>
					<c:url value="/returnMainBoard" var="returnMainBoard"/>
					<a href="${returnMainBoard }"><button id="ok">확인</button></a>
				</div>
			</section>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.poptrox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d0fc516accb46bd8c6bd705b190857d0"></script>
<script type="text/javascript">
var x = document.getElementById("demo");
var latitude;
var longitude;
var promiseName;


<c:url value="/updatepromiseStatus" var="updatepromiseStatus"/>
	$(document).on("change", "#promiseStatusId" ,function(){
			$.ajax({
			type : "post",
			url : "${updatepromiseStatus}",
			data : {
				status : $(this).val(),
				promiseId : $(this).attr("data-item")
			},
			success : function(res){
				$(this).val(res);
			},
			error:function(xhr, status, error){
				alert("잘못된 접근입니다");
			}
		});  
/* 		console.log($(this).attr("data-item"));
		console.log($(this).val()); */
	});





$("#ok").on("click", function(){		
	console.log("확인 눌림");
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
	var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center : new daum.maps.LatLng(position.coords.latitude,
				position.coords.longitude), // 이미지 지도의 중심좌표
		level : 9, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};
	var staticMap = new daum.maps.StaticMap(staticMapContainer,
			staticMapOption);

}


function promiseFunction(stateName,userLatitude,userLongitude){
	
	$("#map").empty();
	$("#map").append("<div id='staticMap'></div>");
	
	console.log("클리시 : " +userLatitude+","+userLongitude);
	
	promiseName= stateName;
	latitude = userLatitude;
	longitude = userLongitude;		
	
	console.log("저장되는 : " +latitude+","+longitude);
	
	console.log("저장된는 이름 : "+stateName);
	
	var markers = [
	       	    
	       	    {
	       	        position: new daum.maps.LatLng(userLatitude, userLongitude), 
	       	        text: stateName // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	       	    }
	       	];

	       	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	       	    staticMapOption = { 
	       	        center: new daum.maps.LatLng(userLatitude, userLongitude), // 이미지 지도의 중심좌표
	       	        level: 3, // 이미지 지도의 확대 레벨
	       	        marker: markers // 이미지 지도에 표시할 마커 
	       	    };    

	       	// 이미지 지도를 생성합니다
	       	var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
	
	
	
}


</script>



</html>