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
	/* 수정버튼을 누르면 수정창이 뜨게 하는 ajax function */
	$(document).on("click", "#rupdate", function() {
		var guestrid = $(this).data("rid");
		$("td#contentPanel" + guestrid).hide();
		$("td#updatePanel" + guestrid).show();
		// 		var content=$(this).data("content");
		// 		$("input[name='rsubmit']").val("수정");
		// 		$("input[name='content']").val(content);
		// 		$("input[name='guestrid']").val(guestrid);
		// 		$("form").attr("action","./rupdate");
		// 		$("#textarea").val(content);
		// 		$("#textarea").focus();
	});

	/* 수정창에서 수정버튼을 눌러서 수정한 내용을 반영하는 ajax function */
	function updateSubmit(guestrid) {
		var content = $("#updateContent" + guestrid).val();
		$.post("./rupdate", {
			guestrid : guestrid,
			content : content,
		}, function(data, status) {
			if (status = "success") {
				$("td#contentPanel" + guestrid).show();
				$("td#updatePanel" + guestrid).hide();
				$("td#contentPanel" + guestrid).html(data);
			} else {
				alert("오류");
			}
		});
	}

	/* 수정창에서 취소버튼을 누르면 수정창이 사라지고 원래 글이 보인다. */
	function updateCancel(guestrid) {
		$("td#contentPanel" + guestrid).show();
		$("td#updatePanel" + guestrid).hide();
	}

	/* 삭제버튼을 누르면 컨트롤러의 replyCheckRefno로 가서 자식검사를 하고 delete 여부를 결정한다. */
	$(document).on("click", "#rdelete", function() {
		var guestrid = $(this).data("rid");
		$.post("./replyCheckRefno", {
			guestrid : guestrid,
		}, function(data, status) {
			if (status = "success") {
				$("td#contentPanel" + guestrid).hide();
				$("td#deletePanel" + guestrid).show();
				$("td#deletePanel" + guestrid).html(data);
			} else {
				alert("오류");
			}
		});
	});

	/* 대댓글 달기 버튼을 누르면 대댓글 작성창이 나오게 하는기능 */
	$(document).ready(function() {
		$("a#reReplyCreate").click(function() {
			var guestrid = $(this).data("guestrid");
			$.post("./reReplyCreate", {
				guestrid : guestrid,
				col : '${param.col}',
				word : '${param.word}',
				nowPage : '${param.nowPage}'
			}, function(data, status) {
				if (status = "success") {
					$("div[data-guestrid=" + guestrid + "]").show();
					$("div[data-guestrid=" + guestrid + "]").html(data);
				} else {
					alert("오류");
				}
			});
		});
	});
</script>
<%-- <link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head>
<body class="board_body">
	<div id="replyContent${dto.guestid}">
		<c:choose>
			<c:when test="${empty rlist}">
				<div class="well" style="text-align: center;">등록된 댓글이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${rlist}" var="rdto">
					<div class="well" id="replyDiv${rdto.guestrid}">
						<table style="margin-left: ${(rdto.indent+1) * 30}px;">
							<tr>
								<td class="col-sm-1" rowspan="3" align="center">
									<span class="glyphicon glyphicon-book"></span>
									<br>
									<a id="rupdate" data-rid='${rdto.guestrid}'>
										<span style="size: 10px">수정/</span>
									</a>

									<a id="rdelete" data-rid='${rdto.guestrid}'>
										<span style="size: 10px">삭제</span>
									</a>
								</td>

								<td class="col-sm-5" rowspan="3" id="contentPanel${rdto.guestrid}">${rdto.content}</td>

								<td class="col-sm-5" rowspan="3" id="updatePanel${rdto.guestrid}" style="display: none;">
									<div class="row">
										<input type="text" value="${rdto.content}" id="updateContent${rdto.guestrid}" class="col-sm-8" size="18">
										<button type="button" class="btn btn-default" onclick="updateSubmit('${rdto.guestrid}')">수정</button>
										<button type="button" class="btn btn-default" onclick="updateCancel('${rdto.guestrid}')">취소</button>
									</div>
								</td>

								<td class="col-sm-5" rowspan="3" id="deletePanel${rdto.guestrid}" style="display: none;"></td>

								<td class="col-sm-2">${rdto.cdate}</td>
							</tr>
							<tr>
								<td class="col-sm-2">ID : ${rdto.id}</td>
							</tr>
							<tr>
								<td class="col-sm-2">
									<a id="reReplyCreate" data-guestrid="${rdto.guestrid}">
										<button type="button" class="btn btn-default">대댓글달기</button>
									</a>
								</td>
							</tr>
						</table>
						<div data-guestrid="${rdto.guestrid}" style="margin-top: 10px;" align="center">
							<!-- 대댓글 작성창이 나올 위치 -->
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>