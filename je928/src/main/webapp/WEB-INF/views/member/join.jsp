<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#m_email').blur(function() {
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(frm.m_email.value) === false) {
				$('#email_chk').html("<font class=red>정확한 이메일 형식으로 입력해주세요.</font>");
			} else {
			var sendData = 'm_email='+$('#m_email').val();
			$.post('m_emailChk.do',sendData,function(msg){
 	 			if(msg == "이미 사용 중이거나 탈퇴한 이메일입니다.") {
 	 				$('#email_chk').html("<font class='red'>"+msg+"</font>");
 	 				frm.mailChk.value = "false";
 	 			}else {
 	 				$('#email_chk').html("<font class='green'>"+msg+"</font>");			
 	 				frm.mailChk.value = "true";
 	 			}
 			});
			return false;
			}
 		});
	});
	
	$(function() {
		$('#m_passwd').keyup(function() {
			var str_space = /\s/;
			if($("#m_passwd").val().length < 6) {
				$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			} else if(str_space.test($("#m_passwd").val())) {
				$('#pwd_chk').html("<font class='red'>공백은 불가능합니다.</font>");
			} else {
				$('#pwd_chk').html("<font class='green'>사용 가능합니다.</font>");
			}
		});
	});
	
	$(function() {
		$('#m_passwd2').keyup(function() {
			if(frm.m_passwd.value != frm.m_passwd2.value) {
				$('#pwd_chk2').html("<font class='red'>비밀번호를 확인해주세요.</font>");
			} else {
				$('#pwd_chk2').html("<font></font>");
			}
		});
	});
	
	$(function() {
		$('#m_nick').keyup(function() {
			var regex = /^[가-힣A-Za-z0-9]{2,10}$/;
			if($("#m_nick").val().length < 2) {
				$('#nick_chk').html("<font class='red'>2~10자만 사용가능합니다.</font>");
			} else if (regex.test(frm.m_nick.value) === false) {
				$('#nick_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			}else {
				var sendData = 'm_nick='+$('#m_nick').val()+'&no=0';
				$.post('m_nickChk.do',sendData,function(msg){
	 	 			if(msg == "이미 사용 중인 닉네임입니다.") {
	 	 				$('#nick_chk').html("<font class='red'>"+msg+"</font>");
	 	 				frm.nickChk.value = "false";
	 	 			}else {
	 	 				$('#nick_chk').html("<font class='green'>"+msg+"</font>");			
	 	 				frm.nickChk.value = "true";
	 	 			}
 				});
				return false;
			}
 		});
	});
	
	function chk() {
		if(frm.mailChk.value == "false") {
			$('#email_chk').html("<font class='red'>이메일을 다시 확인해주세요.</font>");
			frm.m_email.focus();
			return false;
		}
		
		if(frm.m_passwd.value != frm.m_passwd2.value) {
			$('#pwd_chk').html("<font class='red'>비밀번호를 다시 확인해주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value = "";
			frm.m_passwd2.value= "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.m_passwd.value.length < 6) {
			$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value="";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.m_passwd.value.indexOf(" ")>=0) {
			$('#pwd_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value = "";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.nickChk.value == "false") {
			$('#nick_chk').html("<font class='red'>닉네임을 다시 확인해주세요.</font>");
			frm.m_nick.focus();
			return false;
		}
		
		if(frm.m_nick.value.length < 2) {
			$('#nick_chk').html("<font class='red'>2~10자만 사용가능합니다.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		
		if(frm.m_nick.value.indexOf(" ")>=0) {
			$('#nick_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		
		var nick = /^[가-힣A-Za-z0-9]{2,10}$/;
		if(nick.test(frm.m_nick.value) === false) {
			$('#nick_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
				
		return true;
	}
</script>
</head>
<body>

	<div class="container">
		<div class="col-md-offset-14 col-md-5">
   			<div class="form-area">
	       		<form action="join.do" role="form" name="frm" method="post" onsubmit="return chk()">
	       			<input type="hidden" name="mailChk" value="false">
		        	<input type="hidden" name="nickChk" value="false">
		        	<br style="clear:both">
		        	<h4 style="margin-bottom: 25px; text-align: center;">회원가입</h4>
					<div class="form-group">
						<b class="m">이메일:</b>
						<input type="email" class="form-control" id="m_email" name="m_email" maxlength="30" required autofocus="autofocus">
						<span id="email_chk"> </span>
					</div>
					<div class="form-group">
						<b class="m">비밀번호:</b>
						<label><input type="password" class="form-control" id="m_passwd" name="m_passwd" maxlength="20" required></label>
						<span id="pwd_chk"> </span>
					</div>
					<div class="form-group">
						<b class="m">비밀번호 재확인:</b>
						<label><input type="password" class="form-control" id="m_passwd2" name="m_passwd2" maxlength="20" required></label>
						<span id="pwd_chk2"> </span>
					</div>
					<div class="form-group">
						<b class="m">닉네임:</b>
						<label><input type="text" class="form-control" id="m_nick" name="m_nick" maxlength="10" required></label>
						<span id="nick_chk"> </span>
					</div>
					<div style="margin-top: 40px; text-align: center;">
						<button type="submit" id="submit" name="submit" class="btn btn-primary">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>