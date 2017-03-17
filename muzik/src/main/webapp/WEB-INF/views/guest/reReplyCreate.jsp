<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 댓글창에서 작성버튼을 눌러서 댓글을 작성하는 ajax function */
	function createReReSubmit(guestrid) {
		var content = $("#reReplyCreateContent" + guestrid).val();
		var id = $("#reReplyCreateId" + guestrid).val();
		var col = $("#reReplyCreateCol" + guestrid).val();
		var word = $("#reReplyCreateWord" + guestrid).val();
		var nowPage = $("#reReplyCreateNowPage" + guestrid).val();
		$.post("./reReplyAjax", {
			col : col,
			word : word,
			nowPage : nowPage,
			guestrid : guestrid,
			content : content,
			id : id,
			indent : ${rdto.getIndent()},	
			ansnum : ${rdto.getAnsnum()},
			guestid : ${rdto.getGuestid()},
		}, function(data, status) {
			if (status = "success") {
				$("div[data-guest=" + guestid + "]").show();
				$("div[data-guest=" + guestid + "]").html(data);
			} else {
				alert("오류");
			}
		});
		return false;
	}
</script>
</head>
<body>
	<div class="well" class="col-sm-8" align="center" id="reReplyCreate${guestrid}">
		<FORM name='frm' method='POST' onsubmit="return createReReSubmit('${guestrid}')">
			<!-- 답변을 등록하기 위해서 -->
			<%-- <input type="hidden" name="indent" value="${rdto.getIndent()}">
			<input type="hidden" name="ansnum" value="${rdto.getAnsnum()}">
			<input type="hidden" name="guestid" value="${rdto.getGuestid()}"> --%>
			<input type="hidden" name="id" value="guest" id="reReplyCreateId${guestrid}" />
			<!-- 페이지와 검색 유지를 위해서 -->
			<input name="col" value="${col}" type="hidden" id="reReplyCreateCol${guestrid}">
			<input name="word" value="${word}" type="hidden" id="reReplyCreateWord${guestrid}">
			<input name="nowPage" value="${nowPage}" type="hidden" id="reReplyCreateNowPage${guestrid}">
			<textarea rows="2" class="col-sm-8" placeholder="댓글 작성" name="content" id="reReplyCreateContent${guestrid}">${guestrid},${nowPage},${col},${word},${rdto.getIndent()},${rdto.getAnsnum()},${rdto.getGuestid()}</textarea>
			<input type="submit" name="rsubmit" class="btn btn-default" value="댓글 작성">
		</FORM>
	</div>
</body>
</html>