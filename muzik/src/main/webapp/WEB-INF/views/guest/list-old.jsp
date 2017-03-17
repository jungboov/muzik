<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<!-- 다운로드 버튼을 위한 부분 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 다운로드 버튼을 위한 부분 끝 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script type="text/javascript">
	function read(guestid) { //guestid는 자바스크립트변수 col word는 jsp변수
		var url = "read";
		url += "?guestid=" + guestid;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function gupdate(guestid) {
		var url = "update";
		url += "?guestid=" + guestid;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function gdelete(guestid) {
		var url = "delete";
		url += "?guestid=" + guestid;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	$(document).ready(function() {
		$('#accordion .accSubject').on('click', function() {
			var content = $(this).siblings('.accContent');
			if (content.css('display') == 'none') {
				$('#accordion .accContent').slideUp();
				content.slideDown();
			} else {
				content.slideUp();
			}
		});
	});
</script>
<style>
#accordion .accContent {
	display: none;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<a href="./list?col=&word=&nowPage=1">
				<span class="glyphicon glyphicon-list-alt h2_span"></span>
				방명록
			</a>
		</h2>
		<div class="search" align="center">
			<form method="post" action="./list">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="id" <c:if test="${col=='id'}">selected='selected'</c:if>>작성자</option>
					<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
					<option value="total">전체</option>
				</select>
				<input type="text" name="word" value="${word}">
				<!-- 검색어 -->
				<!-- 				<input type="submit" value="검색"> -->
				<button type="submit" class="btn btn-default">Search</button>
				<input type='button' value='새글 작성' class="btn btn-default" onclick="location.href='./create'">
			</form>
		</div>
		<c:choose>
			<c:when test="${fn:length(list)==0}">
				<div class="well reply_well" style="text-align: center;">등록된 글이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<div id="accordion" class="well reply_well">
						<table class="accSubject">
							<tr>
								<td class="col-sm-1" rowspan="3" align="center">
									<a href="javascript:read('${dto.guestid}')">
										<span class="glyphicon glyphicon-book"></span>
									</a>
									<br>
									<a href="javascript:gupdate('${dto.guestid}')">
										<span style="size: 10px">수정</span>
									</a>
									/
									<a href="javascript:gdelete('${dto.guestid}')">
										<span style="size: 10px">삭제</span>
									</a>
								</td>
								<td class="col-sm-5" rowspan="3">${dto.content}
									<%-- <c:set var="mgbookreplycount" value="${util:mgbookreplycount(dto.grpno,dao) }" />
									<span style="color: red;">&nbsp[${mgbookreplycount}]</span> --%>
								</td>
								<td class="col-sm-2">${dto.cdate}</td>
							</tr>
							<tr>
								<td class="col-sm-2">ID : ${dto.id}</td>
							</tr>
							<%-- 
							<tr>
								<c:set var="guestreplylist" value="${util:guestreplylist(dto.guestid) }" />
								<td class="col-sm-2">
									<!-- 글에 바로 댓글다는 창 -->
									<form name="rform" action="./reply" method="post">
										<textarea rows="1" cols="15" placeholder="댓글 작성" name="content"></textarea>
										<input type="submit" name="rsubmit" class="btn btn-default" value="등록">
										<br>
										<input type="hidden" name="no" value="${dto.guestid}" />
										<input type="hidden" name="grpno" value="${dto.grpno}" />
										<input type="hidden" name="indent" value="${dto.indent}" />
										<input type="hidden" name="ansnum" value="${dto.ansnum}" />
										<input type="hidden" name="id" value="Tester" />
										<input type="hidden" name="nowPage" value="${param.nowPage}" />
										<input type="hidden" name="nPage" value="${nPage}" />
										<input type="hidden" name="col" value="${param.col}" />
										<input type="hidden" name="word" value="${param.word}" />
									</form> 
								</td>
							</tr>
							 --%>
						</table>
						<br>
						<%-- 
						<div class="accContent">
							<!-- 댓글 시작 -->
							<c:choose>
								<c:when test="${empty guestreplylist}">empty
								</c:when>
								<c:otherwise>
									<c:forEach var="guestreplylist" items="${guestreplylist}">
										<table style="margin-left: ${guestreplylist.indent * 40}px;">
											<tr>
												<td class="col-sm-1" rowspan="3">
													<a href="javascript:read('${guestreplylist.guestrid}')">
														<span class="glyphicon glyphicon-comment"></span>
														<br>
													</a>
													<a href="javascript:gupdate('${guestreplylist.guestrid}')">
														<span style="size: 8px">수정</span>
													</a>
													<span style="size: 8px">/</span>
													<a href="javascript:gdelete('${guestreplylist.guestrid}')">
														<span style="size: 8px">삭제</span>
													</a>
												</td>
												<td class="col-sm-5" rowspan="3">${guestreplylist.content}</td>
												<td class="col-sm-2">${guestreplylist.cdate}</td>
											</tr>
											<tr>
												<td class="col-sm-2">ID : ${guestreplylist.id}</td>
											</tr>
											<tr>
												<td class="col-sm-2">
													<!-- 대댓글 달기 -->
													<form name="rform" action="./reply" method="post">
														<textarea rows="1" cols="15" placeholder="대댓글 작성" name="content"></textarea>
														<input type="submit" name="rsubmit" class="btn btn-default" value="등록">
														<br>

														<!-- 답변을 등록하기 위해서 -->
														<input type="hidden" name="guestid" value="${guestreplylist.guestid}" />
														<input type="hidden" name="indent" value="${guestreplylist.indent}" />
														<input type="hidden" name="ansnum" value="${guestreplylist.ansnum}" />
														<!-- 부모글 삭제 방지 -->
														<input type="hidden" name="guestrid" value="${guestreplylist.guestrid}" />
														<input type="hidden" name="id" value="guest" />
														<input type="hidden" name="nowPage" value="${param.nowPage}" />
														<input type="hidden" name="nPage" value="${nPage}" />
														<input type="hidden" name="col" value="${param.col}" />
														<input type="hidden" name="word" value="${param.word}" />
													</form>
												</td>
											</tr>
										</table>
										<br>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						 --%>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<DIV class='bottom'>${paging}</DIV>

		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
<%-- 
							제목 부분 삭제예정
							<c:forEach begin="1" end="${dto.indent}">
								<c:out value="&nbsp;" escapeXml="false" />
							</c:forEach>
							<c:if test="${dto.indent>0}">
								<c:out value="┗" escapeXml="false" />
							</c:if>
							<c:set var="rcount" value="${util:rcount(dto.guestid,irdao) }" />
							<a href="javascript:read('${dto.guestid}')"> ${dto.title} </a>
							<c:if test="${rcount>0 }">
										<span style="color: blue;">[${rcount}]</span>
							</c:if>
							<c:if test="${util:newImg(fn:substring(dto.cdate,0,10)) }">
								<span class="label label-danger">New</span>
							</c:if>
							 --%>
