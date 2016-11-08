<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>어라운드 로그인 페이지</title>
</head>
<body style="background-color: #1b1b1d;">
<!-- header -->
	<jsp:include page="WEB-INF/layout/header2.jsp"></jsp:include>		
	
	
	<div class="footer">
		<div class="container" >
							
				
			<div class="col-md-4 flick">
				<br><br><br><br><br><br>
				
				<div class="flick-form_grid" >
					<h4>STAY IN TOUCH</h4>
				   <c:url value="/login" var="login"/>
					<form method="post" action="${login }">
					 <input type="text" class="form-control" name="id" value="ID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'ID';}">
					 <input type="text" class="form-control" name="password" value="PASSWD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWD';}">
						 <div class="smt">
						 	
						 	<input type="button" value="JOIN" onclick="joinBtn()">
						 	<input type="button" value="SearchID" onclick="searchIdBtn()">
						 	<input type="button" value="SearchPW" onclick="searchPwBtn()">
							<input type="submit" value="LOGIN">
						 </div>
					</form>
			      </div>
				</div>
					<div class="clearfix"> </div>
			
		</div>
	</div>
		
<!-- footer -->
<%-- 	<jsp:include page="WEB-INF/layout/footer2.jsp"></jsp:include> --%>
</body>
<script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script>
	function joinBtn(){		
		document.location.href="joinPage";
	}
	function searchIdBtn(){		
		document.location.href="searchId";
	}
	function searchPwBtn(){		
		document.location.href="searchPass";
	}
</script>
</html>