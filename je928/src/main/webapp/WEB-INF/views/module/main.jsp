<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="top.jsp" />
	
	<c:if test="${empty pgm}">
		<span>
			<jsp:include page="home.jsp" />
		</span>
	</c:if>
	<c:if test="${not empty pgm}">
		<span>
			<jsp:include page="${pgm}" />
		</span>
	</c:if>
	
	<jsp:include page="bottom.jsp" />

</body>
</html>