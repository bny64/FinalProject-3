<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여러가지 테스트해보자</title>
<style>
#map {
	height: 350px;
}

#main {
	width: 50%;
	margin-left: 20%;
	margin-top: 5%;
}

#location {
	position: relative;
	top: -370px;
}

</style>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="main">
		<div id="map"></div>
		<p>
			<button onclick="setCenter()">최초 중심으로 이동시키기</button>
		</p>
	</div>
	<!-- 민국 : 위치들을 표시할 div -->
	<div id="location">
		중심위치<br>
		<div id="initLocation"></div>
		<br> 클릭한 위치<br>
		<div id="clieckedLocation"></div>
		<br> <div id="currentLevel"> </div>		
	
	</div>
</body>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=eb282da5749f4321d58ffa74971044a3&libraries=services"></script>
<script>
	var latitude;
	var longitude;
	var map;
	var marker;
	var markers = [];
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(map); 

	if (!!navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(successCallback, errorCallback);
	} else {
		alert("이 브라우저는 Geolocation를 지원하지 않습니다");
	}

	function successCallback(position) {
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;

		document.getElementById("initLocation").innerHTML += "위도 : " + latitude
				+ ", <br>경도 : " + longitude

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			// draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		map = new daum.maps.Map(mapContainer, mapOption);
		
		
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		marker = new daum.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		// 마커가 드래그 가능하도록 설정합니다 
		marker.setDraggable(true); 
		

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
		    addMarker(mouseEvent.latLng);
			
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;
			
			var message = '위도 : ' + latlng.getLat();
			message += '<br>경도 : ' + latlng.getLng();

			var resultDiv = document.getElementById('clieckedLocation');
			resultDiv.innerHTML = message;
		});
		
		// 최초 지도 레벨
		var level = map.getLevel();
		
		var message = "현재 지도 레벨 : " + level;
	    var resultDiv = document.getElementById('currentLevel');  
	    resultDiv.innerHTML = message;
		
		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'zoom_changed', function() {        
		    
		    // 지도의 현재 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    var message = "현재 지도 레벨 : " + level;
		    var resultDiv = document.getElementById('currentLevel');  
		    resultDiv.innerHTML = message;
		    
		});
		
		// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'center_changed', function() {        
		    
		    // 지도의  레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도의 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter(); 
		    
		    document.getElementById("initLocation").innerHTML = "위도 : " + latlng.getLat() + " <br>경도 : " + latlng.getLng();
		    
		});
	}

	function errorCallback(error) {
		alert(error.message);
	}

	// 마커 하나를 지도위에 표시합니다 
	addMarker(new daum.maps.LatLng(33.450701, 126.570667));
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        position: position
	    });

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}

	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}

	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}
	
	function setCenter() {
		console.log("lat : " + latitude + "lng : " + longitude);
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new daum.maps.LatLng(latitude, longitude);

		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}

	// 카테고리로 은행을 검색합니다
	ps.categorySearch('BK9', placesSearchCB, {useMapBounds:true}); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (status, data, pagination) {
		console.log("placeSearch 시작");
	    if (status === daum.maps.services.Status.OK) {
	    	console.log("placeSearch, services 시작");
	        for (var i=0; i<data.places.length; i++) {
	            displayMarker(data.places[i]);    
	        }       
	    }
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		console.log("displayMarker 시작");
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: new daum.maps.LatLng(place.latitude, place.longitude) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
	        infowindow.open(map, marker);
	    });
	}
</script>
</html>