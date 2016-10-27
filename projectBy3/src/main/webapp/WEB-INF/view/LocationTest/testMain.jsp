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
	top: -400px;
	border : 1px solid black;
	width: 17%;
	padding: 1%;
	overflow: hidden;
}

#event{
	position: absolute;
	top : 7%;
	left : 71%;
	border : 1px solid black;
	width : 25%;
	padding: 1%;
}

</style>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="main">
		<div id="map"></div>
		<p>
			<button onclick="setCenter()">최초 중심으로 이동시키기</button>
			<button onclick="removeMarker()">마커 전체 삭제</button>
		</p>
		<div id="result"></div>
	</div>
	<!-- 민국 : 위치들을 표시할 div -->
	<div id="location">
		지도 정보
		<hr>
		중심위치<br>
		<div id="initLocation"></div>
		<br> 클릭한 위치<br>
		<div id="clieckedLocation"></div>
		<br> <div id="currentLevel"> </div>		
	</div>
	<div id="event">
		이벤트 선택
		<hr>
		마우스 클릭 이벤트 : 
		<select id="selectedClickEvent">
			<option value="infoWindow">인포 윈도우</option>
			<option value="createMarker">마커 생성</option>
			<option value="createRect">사각형 그리기</option>
		</select><br><br>
		카테고리로 장소 검색
		<select id="categoryCode">
			<option value="MT1">대형마트</option>
			<option value="CS2">편의점</option>
			<option value="PS3">유치원</option>
			<option value="SC4">학교</option>
			<option value="AC5">학원</option>
			<option value="PK6">주차장</option>
			<option value="OL7">주유소</option>
			<option value="SW8">지하철역</option>
			<option value="BK9">은행</option>
			<option value="CT1">문화시설</option>
			<option value="AG2">중개업소</option>
			<option value="PO3">공공기관</option>
			<option value="AT4">관광명소</option>
			<option value="AD5">숙박</option>
			<option value="FD6">음식점</option>
			<option value="CE7">카페</option>
			<option value="HP8">병원</option>
			<option value="PM9">약국</option>
		</select>
		<button onclick="selectCategoryByCode();">실행</button>
	</div>
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=eb282da5749f4321d58ffa74971044a3&libraries=services"></script>
<script src="<%=request.getContextPath()%>/js/location.js"></script>
<script>
</script>
</html>