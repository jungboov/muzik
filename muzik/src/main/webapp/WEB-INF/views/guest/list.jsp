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
	/* 댓글목록 */
	$(document).ready(function() {
		$("a#replyRead").click(function() {
			var guestid = $(this).data("guestid");
			$.post("./replyRead", {
				guestid : guestid,
				col : '${param.col}',
				word : '${param.word}',
				nowPage : '${param.nowPage}'
			}, function(data, status) {
				if (status = "success") {
					$("div[data-guest=" + guestid + "]").show();
					$("div[data-guest=" + guestid + "]").html(data);
				} else {
					alert("오류");
				}
			});
		});
	});
	/* 댓글달기 버튼을 눌렀을때 쓰임 */
	$(document).ready(function() {
		$("a#replyCreate").click(function() {
			var guestid = $(this).data("guestid");
			$.post("./replyCreate", {
				guestid : guestid,
				col : '${param.col}',
				word : '${param.word}',
				nowPage : '${param.nowPage}'
			}, function(data, status) {
				if (status = "success") {
					$("div[data-guest=" + guestid + "]").show();
					$("div[data-guest=" + guestid + "]").html(data);
				} else {
					alert("오류");
				}
			});
		});
	});
</script>
<%-- <link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head>
<!-- *********************************************** -->
<body class="board_body">
	<div class="container" id="container">
		<!-- *********************************************** -->
		<h2>
			<a href="./list?col=&word=&nowPage=1">
				<span class="glyphicon glyphicon-list-alt h2_span"></span>
				방명록
			</a>
		</h2>
		<div class="search" align="center">
			<form method="get" action="./list">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="id" <c:if test="${col=='id'}">selected='selected'</c:if>>작성자</option>
					<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
					<option value="total">전체</option>
				</select>
				<input type="text" name="word" value="${word}">
				<input type="hidden" name="nowPage" value="${param.nowPage}">
				<!-- 검색어 -->
				<!-- 				<input type="submit" value="검색"> -->
				<button type="submit" class="btn btn-default">Search</button>
				<input type='button' value='새글 작성' class="btn btn-default" onclick="location.href='./create'">
			</form>
		</div>
		<c:choose>
			<c:when test="${fn:length(list)==0}">
				<div class="well" style="text-align: center;">등록된 글이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">

					<div class="well">
						<table class="accGuest">
							<tr>
								<td class="col-sm-1" rowspan="2" align="center">
									<a href="javascript:read('${dto.guestid}')"> 글번호 : ${dto.guestid} </a>
								</td>
								<td class="col-sm-5" rowspan="4">${dto.content}</td>
								<td class="col-sm-2">작성일 : ${dto.cdate}</td>
							</tr>
							<tr>
								<td class="col-sm-2">ID : ${dto.id}</td>
							</tr>
							<tr>
								<td class="col-sm-1" align="center">
									<a href="javascript:gupdate('${dto.guestid}')">
										<input type='button' class="btn btn-default" value='수정'>
										<br>
									</a>
									<a href="javascript:gdelete('${dto.guestid}')">
										<br>
										<input type='button' class="btn btn-default" value='삭제'>
									</a>
								</td>
								<td class="col-sm-2">
									<c:set var="guestReplyCount" value="${util:guestReplyCount(dto.guestid,rdao)}" />
									댓글 갯수 :
									<span style="color: red; size: 15px;"> &nbsp;[${guestReplyCount}] </span>
								</td>
							</tr>
							<tr>
								<!-- 좌하단 공백을 위해 빈 td 입력 -->
								<td class="col-sm-1" align="center" />

								<td>
									&nbsp;&nbsp;
									<a id="replyRead" data-guestid="${dto.guestid}">
										<input type='button' class="btn btn-default" value='댓글 보기'>
									</a>
									<a id="replyCreate" data-guestid="${dto.guestid}">
										<button type="button" class="btn btn-default">댓글달기</button>
									</a>
								</td>
							</tr>
						</table>
						<div data-guest="${dto.guestid}" style="margin-top: 15px;" align="center">
						<!-- 댓글보기, 댓글작성창이 나올 위치 -->
						</div>
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
