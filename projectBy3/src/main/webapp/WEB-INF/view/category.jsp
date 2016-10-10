<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>크아아악캌 퉤고리</title>
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
	width: 40%;
	margin-left: 30%;
	height: 200%;
	clear: both;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<section id="content">
		<c:forEach items="${categories}" var="category">
					<h3>${category.listNo },  ${category.categoryNo },  ${category.userNo }</h3>					
		</c:forEach>	
	</section>
</body>
</html>