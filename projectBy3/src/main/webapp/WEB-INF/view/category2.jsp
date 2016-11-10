<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 카테고리</title>
<style>
.catagers li a {
	font-size: 1.4em;
}


body {
	background-color: #1B1B1D;
}

#searchFriend{
	margin-top : 2%;
	margin-bottom : -15%;
	margin-left: 77%;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header2.jsp"></jsp:include>	
	<div class="content-top" >
		<br><br><br>
		<div class="container">
			<a href="initSearchUserCategory">
				<button id="searchFriend" >카테고리 찾기</button>
			</a>
			<div class="catagers">
				<h2><span>YOUR</span> CATEGORIES</h2>
				<c:url value = "/scategoryBoard" var="scategoryBoard"/>
				<c:url value = "/deleteUserCategory" var="deleteUserCategory"/>
				<c:forEach items="${categories}" var="usercategory">
					<ul>
						<li><a href="${scategoryBoard}?categoryNo=${usercategory.categoryNo}">${usercategory.category.categoryName }</a><a style="float: right;font-size: 0.6em; margin-top: 1.25%; margin-right: 2%; " href="${deleteUserCategory}?categoryNo=${usercategory.categoryNo}">삭제</a></li>
					</ul>
				</c:forEach>
			</div>
		</div>	
	</div>
	<jsp:include page="../layout/footer2.jsp"></jsp:include>
</body>
<script>
	//전체글 보기
	$("#btnGetAllBoard").on("click", function(){
		<c:url value="/returnMainBoard" var="returnMainBoard"/>
		document.location.href="returnMainBoard";
	});
</script>
</html>