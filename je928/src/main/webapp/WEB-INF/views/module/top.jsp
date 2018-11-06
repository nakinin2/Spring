<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="main.do" class="navbar-brand">je928</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">
				<ul class="nav navbar-nav">
					<li><a href="board.do">게시판</a></li>
				</ul>
				<c:set var="no" value="${sessionScope.no }"></c:set>
				<c:if test="${empty no}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.do">로그인</a></li>
						<li><a href="join.do">회원가입</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty no}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>