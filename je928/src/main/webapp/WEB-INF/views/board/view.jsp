<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rpSubmit(number) {
		if(number == null || number == "" || number == "null") {
			if(confirm("로그인 하시겠습니까?")) {
				location.href="login.do";
			} else {
				return false;
			}
		}else {
			var fmt2 = /^\s\s*$/;
			if (fmt2.test(refrm.re_content.value) || refrm.re_content.value == "") {
				alert("댓글을 입력해 주세요.");
				refrm.re_content.value="";
				counter.innerHTML = "0 / 300 자";
				refrm.re_content.focus();
				return false;
			}else {
				return true;
			}
		}
		return false;
	}
	
	function deleteRpChk(re_no, brd_no, pageNum) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="deleteReply.do?re_no="+re_no+"&brd_no="+brd_no+"&pageNum="+pageNum;
		}else {
			return;
		}
	}
	
	/* function delChk() {
		var replyCount = ${replyCount};
		var refTotal = ${refTotal};
		if(replyCount > 0 ) {
			alert("이 글과 관련된 댓글이 존재하므로 삭제 할 수 없습니다.");
		}else {
			if(refTotal > 0) {
				alert("이 글과 관련된 답변글이 존재하므로 삭제 할 수 없습니다.");
			}else {
				location.href="deleteForm.do?brd_no=${board.brd_no}&pageNum=${pageNum}";				
			}
		}
	} */
	
	function delChk() {
		location.href="deleteForm.do?brd_no=${board.brd_no}&pageNum=${pageNum}";
	}
	
	$(document).ready(function(){
		$(".up").hide();
		$(".btnupup").hide();
		$('.btnup').click(function(){
			$("form").each(function() {
				this.reset();
			});
			$(".up").hide();
			$('.btnup').show();
			$(".btnupup").hide();
			$(this).parent().parent().parent().nextAll(".up").toggle("slow");
			$(this).hide();
			$(this).next().show();
			$(this).parent().parent().parent().nextAll(".up").find("textarea").focus();
			var upup_content = $(this).parent().parent().parent().nextAll(".up").find("textarea").val().length;
			$(this).parent().parent().parent().nextAll(".up").find("textarea").next().next().text(upup_content + " / 300 자");
			$(this).parent().parent().parent().nextAll(".up").find("input").click(function(){
				var fmt2 = /^\s\s*$/;
				var a = $(this).prev().val();
				if (fmt2.test(a) || a == "") {
					alert("댓글을 입력해 주세요.");
					$(this).prev().val("");
					$(this).prev().focus();
					$(this).next().text("0 / 300 자");
				}else {
					$(this).parent().submit();
				}
			});
		});
		$('.btnupup').click(function(){
			$(this).parent().parent().parent().nextAll(".up").toggle("slow");
			$(this).hide();
			$(this).prev().show();
		});
	});
	
	function re_contentChk(obj, maxLen) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalLen = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	    	totalLen++;
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalLen <= maxLen) {
	            len = i + 1;
	        }
	    }
		
	    var counter = document.getElementById("counter");
		counter.innerHTML = totalLen + " / " + maxLen + " 자";
	    
	    // 넘어가는 글자는 자른다.
	    if (totalLen > maxLen) {
	        alert(maxLen + "자까지만 입력할 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        re_contentChk(obj, maxLen);
	    }
	}
	
	function up_contentChk(obj, maxLen) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalLen = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	    	oneChar = strValue.charAt(i);
	        totalLen++;
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalLen <= maxLen) {
	            len = i + 1;
	        }
	    }
	    
	    var counter3 = obj.nextSibling.nextSibling.nextSibling.nextSibling;
	    counter3.innerHTML = totalLen + " / " + maxLen + " 자";

	    // 넘어가는 글자는 자른다.
	    if (totalLen > maxLen) {
	        alert(maxLen + "자까지만 입력할 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        up_contentChk(obj, maxLen);
	    }
	}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Board <small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Board</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-xs-6">
						</div>
						<div class="col col-xs-6 text-right">
							<a href="board.do?pageNum=${pageNum}&searchType=${searchType}&searchTxt=${searchTxt}" class="btn btn-sm btn-default">목록<em class="fa fa-list-ul"></em></a>
							<c:set var="refLimit" value="${bs.refLimit(board.ref)}"></c:set>
							<c:if test="${sessionScope.no != null && board.re_level == 0 && refLimit < 6}">
								<a href="writeForm.do?brd_no=${board.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">답변<em class="fa fa-comment-o"></em></a>
							</c:if>
							<c:if test="${sessionScope.no == board.m_no}">
								<a href="updateForm.do?brd_no=${board.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">수정<em class="fa fa-pencil"></em></a>
								<a href="javascript:delChk()" class="btn btn-sm btn-danger">삭제<em class="fa fa-trash"></em></a>
							</c:if>
						</div>
					</div>
				</div>
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list" style="table-layout:fixed;">
						<c:if test="${not empty board }">
							<tr>
								<th width="20%">제목</th>
								<td class="text-left" style="word-wrap:break-word;">${board.brd_subject }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td class="text-left">${board.m_nick}</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td class="text-left">${board.brd_readcount}</td>
							</tr>
							<c:if test="${null eq board.brd_update_date}">
								<tr>
									<th>작성일</th>
									<td class="text-left">${board.brd_reg_date}</td>
								</tr>
							</c:if>
							<c:if test="${null ne board.brd_update_date}">
								<tr>
									<th>작성일</th>
									<td class="text-left">${board.brd_reg_date}</td>
								</tr>
								<tr>
									<th>최근 수정일</th>
									<td class="text-left">${board.brd_update_date}</td>
								</tr>
							</c:if>
							<tr>
								<th>첨부파일</th>
								<td class="text-left">
									<c:forEach var="file" items="${fileList}">
				                        <a href="filedown.do?fileName=${file.f_stored_name}" class="fileview"><font size="2px">${file.f_original_name}</font></a> 
				                        <font size="2px">(${file.f_size} byte)</font><br>
				                    </c:forEach>
				                    <c:if test="${empty fileList}">
				                    	<font color="#A6A6A6" size="2px">첨부된 파일이 없습니다.</font>
				                    </c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="white-space:pre-wrap; word-wrap:break-word;"><div class="text-left" style="margin: 20px;">${board.brd_content}</div></td>
							</tr>
						</c:if>
						<c:if test="${empty board }">
							<tr>
								<td colspan="2">데이터가 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="container re_top">
					<div class="row">
						<h5 class="re_header">
							<small style="color: #747474; font-weight: 900; font-size: 22px;">${replyCount} Comments:</small>
						</h5>
						<c:if test="${not empty reList}">
						<c:forEach var="re" items="${reList}">
						<div class="replym_w">
							<div class="testimonials">
								<div class="carousel-info">
									<div class="pull-left">
										<span class="testimonials-name">${re.m_nick}</span>
										<span class="testimonials-post">${re.re_reg_date}</span>
									</div>
									<div class="pull-right">
										<span class="testimonials-menu">
										<c:if test="${re.m_no == sessionScope.no}">
										<a class="a_link btnup">수정</a>
										<a class="red_link btnupup">수정취소</a>
										 | 											
										<a class="a_link" onclick="deleteRpChk(${re.re_no},${board.brd_no},${pageNum})">삭제</a>
										</c:if>
										</span>
									</div>
								</div>
								<blockquote style="word-break:break-word;">
									<p style="white-space:pre-wrap; word-wrap:break-word;"><span id="contentreset"> ${re.re_content} </span></p>
								</blockquote>
								<div class="up">
									<blockquote>
										<form action="updateReply.do" id="upfrm" name="upfrm">
											<input type="hidden" name="no" value="${sessionScope.no}">
											<input type="hidden" name="re_no" value="${re.re_no}">											
											<input type="hidden" name="brd_no" value="${board.brd_no}">
											<input type="hidden" name="pageNum" value="${pageNum}">
										<c:if test="${sessionScope.no > 0}">
											<textarea style="border:solid 1px; width:86%; vertical-align:top;" rows="3" cols="80" oninput="up_contentChk(this, 300)" id="up_content" name="re_content" required>${re.up_content}</textarea>&nbsp;
											<input type="button" id="upSubmit" class="btn btn-sm btn-default" style="height:80px; width:80px;" value="수정">
											<div class="text-right" style="margin-right: 105px;" id="counter2"></div>
										</c:if>
										</form>
									</blockquote>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:if>
						<c:if test="${empty reList}">
						<div class="replym_w">
							<div class="testimonials">
								<blockquote>
								<p>
									등록된 댓글이 없습니다.
								</p>
								</blockquote>
							</div>
						</div>
						</c:if>
					</div>
				</div>
				
				<div class="container re_bottom">
					<div class="row">
						<div class="replym_w">
							<form action="writeReply.do" name="refrm" onsubmit="return rpSubmit(${sessionScope.no})">
							<input type="hidden" name="m_no" value="${sessionScope.no}">
							<input type="hidden" name="brd_no" value="${board.brd_no}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<c:if test="${sessionScope.no == null}">					
							<textarea style="border:solid 1px; width:88%; vertical-align:top;" rows="3" cols="80" maxlength="300" id="re_content" name="re_content" placeholder="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" onclick="return rpSubmit(${sessionScope.no})"></textarea>&nbsp;
							<input type="submit" class="btn btn-sm btn-default" style="height:80px; width:80px;" value="등록">
							</c:if>
							<c:if test="${sessionScope.no > 0}">					
							<textarea style="border:solid 1px; width:88%; vertical-align:top;" rows="3" cols="80" oninput="re_contentChk(this, 300)" id="re_content" name="re_content" placeholder="댓글을 입력해 주세요." required></textarea>&nbsp;
							<input type="submit" class="btn btn-sm btn-default" style="height:80px; width:80px;" value="등록">
							<div class="text-right"><span id="counter" style="margin-right: 95px;">0 / 300 자</span></div>
							</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>