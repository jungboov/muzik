<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 삭제창에서 삭제버튼을 눌러서 삭제한 내용을 반영하는 ajax function */
	function deleteSubmit(guestrid) {
		$.post("./replyDelete", {
			guestrid : guestrid,
		}, function(status) {
			if (status = "success") {
				alert("댓글이 삭제 되었습니다.");
				$("div#replyDiv" + guestrid).remove();
			} else {
				alert("오류");
			}
		});
	}
	/* 삭제창에서 취소버튼을 누르면 삭제창이 사라지고 원래 글이 보인다. */
	function deleteCancel(guestrid) {
		$("td#contentPanel" + guestrid).show();
		$("td#deletePanel" + guestrid).hide();
	}
</script>
</head>
<body>
	<div class="row" id="contentDiv${rdto.guestrid}">${rdto.content}
		<c:choose>
			<c:when test="${flag}">이 댓글에 달린 댓글이 있어서 삭제 하실수 없습니다.
				<button type="button" class="btn btn-default" onclick="deleteCancel('${guestrid}')">취소</button>
			</c:when>
			<c:otherwise>정말로 삭제 하시겠습니까?
				<button type="button" class="btn btn-default" onclick="deleteSubmit('${guestrid}')">삭제</button>
				<button type="button" class="btn btn-default" onclick="deleteCancel('${guestrid}')">취소</button>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="row" id="deleteDiv${rdto.guestrid}" style="display: none;"></div>
</body>
</html>