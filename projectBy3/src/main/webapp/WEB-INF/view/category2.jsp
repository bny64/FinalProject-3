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
.content-top{
	height: 80%;
}
.container{
	height: 80%;
}
body{
	height: 80%;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header2.jsp"></jsp:include>	
	<div class="content-top" >
		<br><br><br>
		<div class="container">
			<div class="catagers">
				<h2><span>YOUR</span> CATEGORIES</h2>
				<c:url value = "/scategoryBoard" var="scategoryBoard"/>
				<c:forEach items="${categories}" var="usercategory">
					<ul>
						<li><a href="${scategoryBoard}?categoryNo=${usercategory.categoryNo}">${usercategory.category.categoryName }</a></li>
					</ul>
				</c:forEach>
			</div>
		</div>	
	</div>
</body>
<script>
	//전체글 보기
	$("#btnGetAllBoard").on("click", function(){
		<c:url value="/returnMainBoard" var="returnMainBoard"/>
		document.location.href="returnMainBoard";
	});
</script>
</html>