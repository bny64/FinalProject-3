<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header2.jsp"></jsp:include>
	<!-- header -->
	<!-- contents -->
	<div class="content-top">
		<div class="container">
			<div class="contentsWrap">
				<c:url value="/writeBoard" var="writeBoard" />
				<sform:form method="post" action="writeBoard" modelAttribute="board"
					id="inputForm" enctype="multipart/form-data">
					
					<h1>글쓰기</h1>

					<fieldset>
						<legend>
							<span class="number">1</span>기본 정보
						</legend>
						<label for="title">제목:</label>
						<sform:input path="title" placeholder="제목을 입력해 주세요." />
						<label for="content">내용:</label>
						<sform:textarea path="content" placeholder="내용을 입력해 주세요." />
						<sform:label path="categoryNo">카테고리:</sform:label>
						<sform:select path="categoryNo" multiple="" items="${category }"
							itemLabel="categoryName" itemValue="categoryNo" />
						<label>위치: </label>
						<c:url value="/getMyLocation" var="getMyLocation" />
						<a href="${getMyLocation }" id="locationLink"><img
							id="getMyLocation"
							src="<%=request.getContextPath()%>/img/gps.jpg"></a>
						<h2 id="locationStr">${locationName }</h2>
					</fieldset>
					
					<fieldset>
							<legend>
								<span class="number">2</span>사진 등록
							</legend>
						<sform:input path="file" type="file"/><br>
					</fieldset>
					

					<fieldset>
						<legend>
							<span class="number">3</span>추가 정보
						</legend>
						<label>게시물 보임 여부</label>
						<sform:select path="viewStatus" id="viewStatus">
							<sform:option value="visible">그냥 보이기</sform:option>
							<sform:option value="hidden" selected="selected">숨기기</sform:option>
						</sform:select>
						<label>느린우편 서비스:</label> <input type="checkbox" id="isSlowMessage"
							name="isSlowMessage"> <label class="light"
							for="isSlowMessage">사용하기</label> <br>
						<sform:input path="targetDate"
							id="targetDate" placeholder="ex)2011-01-22 16:00" />
					</fieldset>
					<div id="hidden">
						<sform:input path="boardNo" />
						<sform:input path="userNo" />
						<sform:input path="imagePath" />
						<sform:input path="latitude" />
						<sform:input path="longitude" />
					</div>
					<button type="submit">작성하기</button>
				</sform:form>
			</div>
		</div>
	</div>
	<!-- contents -->
	<!-- header -->
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
	<!-- header -->
</body>
<script>
	$("#isSlowMessage").on("click", function() {
		console.log("attr : " + $("#isSlowMessage").prop("checked"));

		// 체크가 되있다면 
		if ($("#isSlowMessage").prop("checked")) {
			$("#targetDate").css("display", "block");
		} else {
			$("#targetDate").css("display", "none");
		}

	});
</script>
<style>
#locationStr{
	position: relative;
	top : -30px;
	left: 55px
}
#hidden {
	display: none;
}

#getMyLocation {
	width: 10%;
	height: 10%;
}

#viewStatus {
	width: 80%;
}

#targetDate {
	display: none;
}

.contentsWrap {
	margin: 5%;
}

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-family: 'Nunito', sans-serif;
	color: #384047;
}

form {
	max-width: 300px;
	margin: 10px auto;
	padding: 10px 20px;
	background: #f4f7f8;
	border-radius: 8px;
}

h1 {
	margin: 0 0 30px 0;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="search"], input[type="tel"],
	input[type="time"], input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	font-size: 16px;
	height: auto;
	margin: 0;
	outline: 0;
	padding: 15px;
	width: 100%;
	background-color: #e8eeef;
	color: #8a97a0;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

button {
	padding: 19px 39px 18px 39px;
	color: #FFF;
	background-color: #4bc970;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid #3ac162;
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin:0%;
	margin-bottom: 10px;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
}

label.light {
	font-weight: 300;
	display: inline;
}

.number {
	background-color: #5fcf80;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
	border-radius: 100%;
}

@media screen and (min-width: 480px) {
	form {
		max-width: 480px;
	}
}
</style>
</html>