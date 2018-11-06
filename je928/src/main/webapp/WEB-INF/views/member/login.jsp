<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#email').keyup(function() {
			$('#msg1').html("<font></font>");
			$('#msg2').html("<font></font>");
		});
	});
</script>
</head>
<body>
          
	<div class="container">
		<div class="col-md-offset-13 col-md-3 ">
   			<div class="form-area">
	       		<form role="form" action="login.do" method="post">
		        	<br style="clear:both">
		        	<h3 style="margin-bottom: 25px; text-align: center;">Welcome back.</h3>
					<div class="form-group">
						<label><input type="text" id="email" name="email" class="form-control input-lg" placeholder="이메일" /></label>
						<c:if test="${not empty msg1}">
						<span id="msg1"><font color="red"> ${msg1 }</font></span>
						</c:if>
						<br>
						<label><input type="password" id="passwd" name="passwd" class="form-control input-lg" placeholder="비밀번호" /></label>
						<c:if test="${not empty msg2}">
						<span id="msg2"><font color="red"> ${msg2 }</font></span>
						</c:if>
						<br>
					</div>
					<div class="wrapper">
						<span class="group-btn">
							<input type="submit" class="btn btn-primary btn-md" value="로그인">
						</span>
						<p>
					</div>
					<div align="center">
					<b style="text-decoration: underline;"><a href="join.do">회원가입</a></b>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>