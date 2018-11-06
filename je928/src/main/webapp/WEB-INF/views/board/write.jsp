<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function() {
		$('#addFile').click(function() {
			var fileIndex = $('#fileview tr').length;
			if(fileIndex < 5) {
				$('#fileview').append(
					'<tr><td>'+
					'<input type="file" name="files['+ fileIndex +']" style="margin-bottom: 3px;"/></td>'+
					'<td><button type="button" style="font-size: 5px; padding: 1px 2px 2px 2px; id="fileremove['+ fileIndex +']" class="btn btn-sm btn-default fileremove">'+
					'<i class="glyphicon glyphicon-remove"></i></button>'+
					'</td></tr>'
				);
			}else {
				alert("파일 첨부는 5개까지 할 수 있습니다.");
			}
		});
		$("#fileview").on('click', '.fileremove', function(){
			$(this).parent().parent().remove();
		});
	});
	
	function subjectChk(obj, maxByte) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalByte = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	        oneChar = strValue.charAt(i);
	        if (escape(oneChar).length > 4) {
	            totalByte += 3;
	        }else if(escape(oneChar) == '%0A') {
	        	totalByte += 2;
	        }else if(escape(oneChar) >= 'u4E00' && escape(oneChar) <= 'u9FFF') {
	        	totalByte += 3;
	        }else {
	            totalByte++;
	        }
	
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalByte <= maxByte) {
	            len = i + 1;
	        }
	    }
		
	    // 넘어가는 글자는 자른다.
	    if (totalByte > maxByte) {
	    	alert("제목은 한글 기준 100자 까지만 쓸 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        subjectChk(obj, maxByte);
	    }
	}

	function contentChk(obj, maxByte) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalByte = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	        oneChar = strValue.charAt(i);
	        if (escape(oneChar).length > 4) {
	            totalByte += 3;
	        }else if(escape(oneChar) == '%0A') {
	        	totalByte += 2;
	        }else if(escape(oneChar) >= 'u4E00' && escape(oneChar) <= 'u9FFF') {
	        	totalByte += 3;
	        }else {
	            totalByte++;
	        }
	
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalByte <= maxByte) {
	            len = i + 1;
	        }
	    }
		
	    var counter = document.getElementById("counter");
		counter.innerHTML = totalByte;
	    
	    // 넘어가는 글자는 자른다.
	    if (totalByte > maxByte) {
	        alert("내용은 " + maxByte + " byte 까지만 쓸 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        contentChk(obj, maxByte);
	    }
	}
	
	function chk() {
		var fmt2 = /^\s\s*$/;
		
		if (fmt2.test(frm.brd_subject.value) || frm.brd_subject.value == "") {
			alert ("제목을 입력하세요");
			frm.brd_subject.value="";
			frm.brd_subject.focus();
			return false;
		}
		
		if (fmt2.exec(frm.brd_content.value) || frm.brd_content.value == "") {
			alert ("내용을 입력하세요");
			frm.brd_content.value="";
			frm.brd_content.focus();
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
			<div class="col-lg-9 col-md-offset-20">
				<div class="panel panel-default panel-table">
					<form action="write.do" name="frm" method="post" enctype="multipart/form-data" role="form" onsubmit="return chk()">
						<input type="hidden" name="m_no" value="${no}">
						<input type="hidden" name="brd_no" value="${board.brd_no}">
						<input type="hidden" name="ref" value="${board.ref}">
						<input type="hidden" name="re_step" value="${board.re_step}">
						<input type="hidden" name="re_level" value="${board.re_level}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<br style="clear: both">
						<h3 style="margin-bottom: 25px; text-align: center;">
							<em class="fa fa-edit"></em>
						</h3>
						<div class="form-group">
							<label><input type="text" class="form-control-95" name="brd_subject"
								id="subject" oninput="subjectChk(this, 300)" maxlength="1000" placeholder="제목을 입력해 주세요."
								autofocus="autofocus" value="${board.brd_subject}" required></label>
						</div>
						<div class="form-group">
							<textarea class="form-control-95" name="brd_content"
								id="content" rows="20" oninput="contentChk(this, 3000)" maxlength="3001" placeholder="내용을 입력해 주세요." required>${board.brd_content}</textarea>
							<div class="text-right" style="margin-right: 27px;"><span id="counter">0</span>/3000 byte</div>
						</div>
						<div class="form-group" style="margin-left: 20px; background-color: #EAEAEA; padding: 15px 15px 15px 15px; width: 95%;">
							<input id="addFile" type="button" value="파일추가" class="btn btn-sm btn-default" style="margin-bottom: 10px;"/>
							<table id="fileview">
								<tr>
									<td><label><input type="file" name="files[0]" id="filename" style="margin-bottom: 3px;" /></label></td>
									<td><button type="button" style="font-size: 5px; padding: 1px 2px 2px 2px;" id="fileremove[0]" class="btn btn-sm btn-default fileremove">
									<i class="glyphicon glyphicon-remove"></i></button></td>
								</tr>
							</table>
						</div>
						<div class="panel-footer text-center">
							<span>
								<button type="submit" class="btn btn-sm btn-primary">
									확인<i class="glyphicon glyphicon-ok"></i>
								</button>
								<a href="javascript:history.go(-1);" class="btn btn-sm btn-primary">
									취소<i class="glyphicon glyphicon-remove"></i>
								</a>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>