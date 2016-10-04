<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
			#main{
				width: 400px;
				margin: 0 auto;
				height: 600px;
			}
		</style>
	</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h2>홈페이지 소개</h2>
					</header>
				<!-- Main -->
					<section id="main">
						<div id="joinForm">
							<form id="join">
								<fieldset>
								<input type="text" name="name" id="name"  placeholder="아이디"><br>
								<input type="password" name="password" id="password"  placeholder="비밀번호" value="1234"><br>
								<input type="text" name="nickName" id="nickName" placeholder="닉네임" value="hong1234"><br>
								<input type="text" name="userName" id="userName" placeholder="이름" value="홍길동"><br>
								<input type="text" name="tel" id="tel" placeholder="***-****-****" value="010-0000-0000"><br>
								<input type="email" name="email" id="email" placeholder="이메일" value="hong1234@naver.com"><br>
								<input type="text" name="birthdate" id="birthdate" placeholder="yyyy/MM/dd" value="2016/10/04"><br>
								<input type="reset" value="초기화" >&nbsp;&nbsp;
								<input type="submit" value="회원가입">
								</fieldset>
							</form>
						</div>
					</section>
				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. </p>
					</footer>
			</div>
	</body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="assets/js/validation/dist/jquery.validate.js"></script>
	<script>
		$("#join").validate({
			rules:{
				name: "required",
				email: {
				      required: true,
				      email: true
				},
				tel : {
					required : true,
					tel : true
				}
			},
			messages:{
				name: "아이디가 비었습니다.",
				email: {
				      required: "이메일을 입력해 주세요.",
				      email: "이메일 형식이 안맞습니다. (ex: name@domain.com)"
				},
				tel : {
				      required: "전화번호를 입력해 주세요.",
				      email: "전화번호 형식이 안맞습니다. (ex: name@domain.com)"
				}
			}
		});
	</script>
</html>