<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
.target {
	display: inline-block;
    width: 380px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style> -->
<script type="text/javascript">
	function locate(pageNum){
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		location.href="board.do?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
	}
	
	$(document).ready(function() {
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		var sendData = 'pageNum='+${pb.nowPage}+'&searchType='+searchType.value+'&searchTxt='+searchTxt.value;
		$('#exceldown').click(function() {
			$.ajax({
				 url: 'exceldown.do',
				 data: sendData,
				 success: function(){
					 alert("D:드라이브에 엑셀 파일 생성 성공.");
				 }
			});
		});
	});
	
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
		
		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-xs-6">
							Page ${pb.nowPage} of ${pb.totalPage}
						</div>
						<div class="col col-xs-6 text-right">
							<button type="button" id="exceldown" class="btn btn-sm btn-success">엑셀다운<em class="glyphicon glyphicon-floppy-save"></em></button>
							<a href="writeForm.do?pageNum=${pb.nowPage}" class="btn btn-sm btn-primary">글작성<em class="fa fa-edit"></em></a>	
						</div>
					</div>
				</div>
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list" style="table-layout:fixed; font-size: 12px;">
						<thead>
							<tr>
								<th width="5%"></th>
								<th width="30%">제목</th>
								<th width="12%">글쓴이</th>
								<th width="9%">작성일</th>
								<th width="6%">조회수</th>
								<th width="6%">첨부파일</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="no" value="${pb.no}" />
						<c:forEach var="brd" items="${list}">
						<tr>
							<td>${no }</td>
			<!-- ***************************** 제목 *****************************  -->
							<c:if test="${brd.brd_del_yn == 'n'}">
							<td class="text-left">
							<%-- <c:set var="day" value="${bs.newday()}"></c:set>
							<c:if test="${brd.brd_reg_date eq day}">
								<span class="new">N</span>
							</c:if> --%>
							<c:if test="${brd.re_step>0}">
								<img alt="" src="images/level.gif" width="${brd.re_level*10}">
								<img alt="" src="images/re.gif">
								<c:if test="${brd.sublength > 22}">
								<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">
									<c:out value="${fn:substring(brd.brd_subject,0,22)}"/>...
								</a>
								</c:if>
								<c:if test="${brd.sublength < 22}">
								<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">
									${brd.brd_subject}
								</a>
								</c:if>
								<c:if test="${brd.replycount > 0}">
								<font style="font-weight: 900; color: #2196f3;">[${brd.replycount}]</font>
								</c:if>
							</c:if>
							<c:if test="${brd.re_step==0}">
								<c:if test="${brd.sublength > 25}">
								<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">
									<c:out value="${fn:substring(brd.brd_subject,0,25)}"/>...
								</a>
								</c:if>
								<c:if test="${brd.sublength < 25}">
								<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">
									${brd.brd_subject}
								</a>
								</c:if>
								<c:if test="${brd.replycount > 0}">
								<font style="font-weight: 900; color: #2196f3;">[${brd.replycount}]</font>
								</c:if>
							</c:if>
							</td>
			<!-- ***************************** 제목 *****************************  -->
							<td>${brd.m_nick}</td>
							<td>${brd.brd_reg_date}</td>
							<td>${brd.brd_readcount}</td>
							<c:set var="fileCount" value="${bs.fileCount(brd.brd_no)}"> </c:set>
							<td>
								<c:if test="${fileCount > 0}">
								&nbsp;<i class="glyphicon glyphicon-floppy-disk" style="color: #030066;"></i>&nbsp;
								</c:if>
							</td>
							</c:if>
							<c:if test="${brd.brd_del_yn == 'y'}">
							<td colspan="5" class="text-left"> 이 글은 작성자에 의해서 삭제되었습니다. </td>
							</c:if>
						</tr>
						<c:set var="no" value="${no-1}"></c:set>
						</c:forEach>
						<c:if test="${empty list}">
							<tr>
								<td colspan="6">데이터가 없습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				<div class="panel-footer2 text-center">
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<c:if test="${pb.startPage > pb.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>						
								<li><a href="javascript:locate(${pb.nowPage-1})">«</a></li>
								</c:if>
							</ul>
							<ul class="pagination">
								<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
									<c:if test="${i eq pb.nowPage}">
										<li><a href="#"><b class="b2">${i}</b></a></li>
									</c:if>
									<c:if test="${i ne pb.nowPage}">
										<li><a href="javascript:locate(${i})">${i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							<ul class="pagination">
								<c:if test="${pb.totalPage > pb.endPage}">
								<li><a href="javascript:locate(${pb.nowPage+1})">»</a></li>
								<li><a href="javascript:locate(${pb.totalPage})">»»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div align="center">
		<div class="navbar-form">
			<div class="form-group">
				<select class="form-control input-lg" id="searchType">
					<c:if test="${searchType eq 'all'}">
						<option value="all" selected="selected">제목 + 내용</option>
					</c:if>
					<c:if test="${searchType ne 'all'}">
						<option value="all">제목 + 내용</option>
					</c:if>
						
					<c:if test="${searchType eq 'brd_subject'}">
						<option value="brd_subject" selected="selected">제목</option>
					</c:if>
					<c:if test="${searchType ne 'brd_subject'}">
						<option value="brd_subject">제목</option>
					</c:if>
					
					<c:if test="${searchType eq 'brd_content'}">	
						<option value="brd_content" selected="selected">내용</option>
					</c:if>
					<c:if test="${searchType ne 'brd_content'}">
						<option value="brd_content">내용</option>
					</c:if>
						
					<c:if test="${searchType eq 'm_nick'}">
						<option value="m_nick" selected="selected">글쓴이</option>
					</c:if>
					<c:if test="${searchType ne 'm_nick'}">
						<option value="m_nick">글쓴이</option>
					</c:if>
				</select>
				<label><input type="text" id="searchTxt" class="form-control" placeholder="Search" value="${searchTxt}"></label>
			</div>
			<button type="submit" class="btn btn-default" onclick="locate(1)"><i class="glyphicon fa-1x glyphicon-search"></i></button>
		</div>
		<c:if test="${searchTxt != ''}">
			<div> <a href="board.do" style="text-decoration: underline;">목록</a> </div>
		</c:if>
	</div>
      
</body>
</html>