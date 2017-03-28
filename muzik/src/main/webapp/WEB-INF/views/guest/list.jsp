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

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">

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

<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
		
	
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>

	<div class="container" id="container">
		<!-- *********************************************** -->
		<h2>
			<a href="./list?col=&word=&nowPage=1" style="color: black;">
				<span class="glyphicon glyphicon-list-alt h2_span"></span>
				방명록
			</a>
		</h2>
		<div align="center">
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
		<div id="guestList">
			<c:choose>
				<c:when test="${fn:length(list)==0}">
					<div class="well" style="text-align: center;">등록된 글이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">

						<div class="well row">
							<table class="accGuest">
								<tr>
									<td class="col-sm-1" rowspan="2" align="center">
										<h1>
											<a href="javascript:read('${dto.guestid}')" style="color: black;">
												<button type="button" class="btn btn-default btn-sm"><span class="badge">${dto.guestid}</span></button>
											</a>
										</h1>
									</td>
									<td class="col-sm-5" rowspan="3" style="word-break: break-all;">${dto.content}</td>
									<td class="col-sm-2">작성일 : ${dto.cdate}</td>
								</tr>
								<tr>
									<td class="col-sm-2">닉네임 : ${dto.id}</td>
								</tr>
								<tr>
									<td class="col-sm-1" align="center">
										<a href="javascript:gupdate('${dto.guestid}')">
											<button type="button" class="btn btn-default btn-sm">
												<span>수정</span>
											</button>
										</a>
										<a href="javascript:gdelete('${dto.guestid}')">
											<button type="button" class="btn btn-default btn-sm">
												<span>삭제</span>
											</button>
										</a>
									</td>
									<td class="col-sm-2">
										<a id="replyRead" data-guestid="${dto.guestid}">
											<c:set var="guestReplyCount" value="${util:guestReplyCount(dto.guestid,rdao)}" />
											<button type="button" class="btn btn-default btn-sm">
												댓글
												<span class="badge">${guestReplyCount} </span>
											</button>
										</a>
										<a id="replyCreate" data-guestid="${dto.guestid}">
											<button type="button" class="btn btn-default btn-sm">댓글달기</button>
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
		</div>
		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
