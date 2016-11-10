<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	width: 40%;
	margin-left: 30%;
	height: 200%;
	clear: both;
	margin: 0 auto;
}

#map {
	margin-top: 10%;
	margin: 0 auto;
}

form {
	margin: 0 auto;
}

label {
	color: white;
}

button {
	margin: 0 auto;
}

#information {
	width: 30%;
	margin: 0 auto;
	float: center;
	border: solid 1px red;
	margin: 0 auto;
}

td>label {
	padding-left: 8%;
	margin-bottom: 3%;
}

td>input {
	text-align: center;
	margin-bottom: 3%;
}

button {
	padding: 0 auto;
}

#friendList {
	margin-top: 17%;
}
</style>
</head>
<body>
	<!-- footer -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- footer -->
	<div class="content-top">
		<div class="container">
			<p id="demo"></p>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<br>
			<div id="information">
				<sform:form method="post" action="promise" modelAttribute="promise">
					<table>
						<tr>
							<td><label>위도</label></td>
							<td><sform:input path="promiseLatitude" id="inputLa"
									placeholder="위도" /></td>
						</tr>
						<tr>
							<td><label>경도</label></td>
							<td><sform:input path="promiseLongitude" id="inputLo"
									placeholder="경도" /></td>
						</tr>
						<tr>
							<td><label>약속 명</label></td>
							<td><sform:input path="promiseTitle" placeholder="약속 이름" />
							<td></td>
						</tr>
						<tr>
							<td><label>날짜</label></td>
							<td><sform:input path="promiseDate"
									placeholder="promiseDate" /></td>
						</tr>
						<tr>
							<td><label>내용</label></td>
							<td><sform:input path="promiseContent" placeholder="약속 내용" /></td>
						</tr>
						<tr>
							<td><sform:label path="invitee" id="friendList">친구 목록</sform:label>
							<td><sform:select path="invitee" multiple=""
									items="${friends }" itemLabel="userName" itemValue="userNo" /></td>
						</tr>
						<tr>
							<td><sform:button>약속 등록</sform:button>
							<td><input type="button" value="돌아가기" onclick="closeBtn()">
						<tr>
					</table>
				</sform:form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=eb282da5749f4321d58ffa74971044a3&libraries=services"></script>

<script>
	var latitude;
	var longitude;
	var map;
	var marker;
	var markers = [];

	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	if (!!navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(successCallback, errorCallback);
	} else {
		alert("이 브라우저는 Geolocation를 지원하지 않습니다");
	}
	function errorCallback(error) {
		alert(error.message);
	}
	function successCallback(position) {
		console.log("successCallback");
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;

		//document.getElementById("initLocation").innerHTML += "위도 : " + latitude
		//		+ ", <br>경도 : " + longitude

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			// draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false
			// 옵션을 추가하세요
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		map = new daum.maps.Map(mapContainer, mapOption);

		// 지도를 클릭한 위치에 표출할 마커입니다
		marker = new daum.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다
			position : map.getCenter()
		});

		// 지도에 마커를 표시합니다
		//marker.setMap(map);

		// 마커가 드래그 가능하도록 설정합니다
		marker.setDraggable(true);

		// 장소 검색 객체를 생성합니다
		ps = new daum.maps.services.Places(map);

		// 마커에 마우스오버 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseover', function() {
			// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseout', function() {
			// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			infowindow.close();
		});

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위치에 마커를 표시합니다
			removeMarker();
			addMarker(mouseEvent.latLng);

			// 클릭한 위도, 경도 정보를 가져옵니다
			var latlng = mouseEvent.latLng;

			//var message = '위도s : ' + latlng.getLat();
			//message += '<br>경도s : ' + latlng.getLng();

			latitude = latlng.getLat();
			longitude = latlng.getLng();

			$("#inputLa").val(latlng.getLat());
			$("#inputLo").val(latlng.getLng());

			//var resultDiv = document.getElementById('clieckedLocation');
			//resultDiv.innerHTML = message;
		});

		// 최초 지도 레벨
		//var level = map.getLevel();

		//var message = "현재 지도 레벨 : " + level;
		//var resultDiv = document.getElementById('currentLevel');
		//resultDiv.innerHTML = message;

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'zoom_changed', function() {

			// 지도의 현재 레벨을 얻어옵니다
			//var level = map.getLevel();

			//var message = "현재 지도 레벨 : " + level;
			//var resultDiv = document.getElementById('currentLevel');
			//resultDiv.innerHTML = message;

		});

		// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'center_changed', function() {

			// 지도의 레벨을 얻어옵니다
			//var level = map.getLevel();

			// 지도의 중심좌표를 얻어옵니다
			//var latlng = map.getCenter();

			//document.getElementById("initLocation").innerHTML = "위도 : "
			//		+ latlng.getLat() + " <br>경도 : " + latlng.getLng();

		});
	}

	//addMarker(new daum.maps.LatLng(33.450701, 126.570667));

	//마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : position
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 생성된 마커를 배열에 추가합니다	
		markers.push(marker);

		return marker;
	}

	function displayPlaces(places) {
		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = addMarker(new daum.maps.LatLng(places[i].latitude,
					places[i].longitude));

			// 마커와 검색결과 항목을 클릭 했을 때
			// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			(function(marker, place) {
				daum.maps.event.addListener(marker, 'click', function() {
					// 마우스 클릭 이벤트가 인포 윈도우 일때만 작동
					var selectedClickEvent = document
							.getElementById("selectedClickEvent").value;
					console.log("selectedClickEvent : " + selectedClickEvent);

					if (selectedClickEvent == "infoWindow") {
						displayPlaceInfo(marker, place);
					} else if (selectedClickEvent == "createRect") {
						createRectangle(place.latitude, place.longitude);
					}
				});
			})(marker, places[i]);
		}
	}

	function removeMarker() {
		console.log("removeMarker 시작");
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	function closeBtn() {
		document.location.href = "returnMainBoard";
	}
</script>
</html>