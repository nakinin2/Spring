<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function passwdChk() {
		$(function() {
			$('#password').keyup(function() {
				$('#password_Chk').html("<font></font>");
			});
		});
		
		if(frm.password.value != frm.dbPass.value) {
			$('#password_Chk').html("<font class=red>비밀번호를 확인해주세요.</font>");
			frm.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">Board
					<small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li>
						<a href="main.do">Home</a>
					</li>
					<li class="active">
						Board
					</li>
				</ol>
			</div>
		</div>

		<c:if test="">
			<font color="red"> ${msg} </font>
		</c:if>

		<div class="container">
			<div class="col-lg-4 col-md-offset-3-2">
				<div class="panel panel-default panel-table">
					<form action="delete.do" name="frm" method="post" role="form" onsubmit="return passwdChk()">
						<input type="hidden" name="brd_no" value="${brd_no}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="dbPass" value="${dbPass}">						
						<br style="clear: both">
						<h3 style="margin-bottom: 25px; text-align: center;">
							<em class="glyphicon glyphicon-trash"></em>
						</h3>
						<h6 style="margin-bottom: 25px; text-align: center;">
							정말로 삭제하시겠습니까?
						</h6>
						<div class="form-group">
							<input type="password" class="form-control-87" name="password"
								id="password" maxlength="50" placeholder="비밀번호를 입력해 주세요."
								autofocus="autofocus" required>
							<div style="margin-left: 23px;" id="password_Chk"> </div>
						</div>
						<div class="panel-footer text-center">
							<span>
								<button type="submit" class="btn btn-sm btn-danger">
									삭제<i class="glyphicon glyphicon-ok"></i>
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="history.back(-1)">
									취소<i class="glyphicon glyphicon-ok"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>