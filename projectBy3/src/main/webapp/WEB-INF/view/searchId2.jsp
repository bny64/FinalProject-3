<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기</title>
<meta charset="utf-8" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>


</head>
<body>
		<div class="content-top">
			<div class="container">
				<fieldset>
					<legend>회원 정보</legend>
					<label for="name">이름</label>
					 <input type="text" id="name"><br>
					<label for="email">이메일</label>
					 <input type="text" id="email"><br>
					<button id="search">찾기</button>
				</fieldset>
				<fieldset>
					<legend>사용자 ID</legend>
					<input id="id">
				</fieldset><br>
				<c:url value="/joinPage" var="joinPage"/>
				<a href="joinPage"><button>회원가입</button></a>
				<a href="index.jsp"><button>돌아가기</button></a>
			</div>
		</div>
		
	

</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	<c:url value="/searchId" var="searchId"/>
	$("#search").on("click", function() {
		$.ajax({
			type : "get",
			url : "${searchId}",
			data : {
				name : $("#name").val(),
				email : $("#email").val()
			},
			success : function(res) {
				if (res) {
					alert("사용자의 ID는 "+res+" 입니다");
				}
			},
			error : function(xhr, status, error) {
				alert("해당 하는 정보가 없습니다");
			}
		});
	});
</script>
</html>