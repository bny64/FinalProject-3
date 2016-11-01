<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<h2>ㅅㄷㄴㅅ</h2>
	<input id="toggle-one" type="checkbox" checked>
	<div class="checkbox">
  <label>
    <input type="checkbox" data-toggle="toggle">
    Option one is enabled
  </label>
</div>
<div class="checkbox disabled">
  <label>
    <input disabled type="checkbox" data-toggle="toggle">
    Option two is disabled
  </label>
</div>

</body>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
  $(function() {
    $('#toggle-one').bootstrapToggle();
  })
</script>
</html>