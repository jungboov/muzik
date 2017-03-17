<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 댓글창에서 작성버튼을 눌러서 댓글을 작성하는 ajax function */
	function createSubmit(guestid) {
		var content = $("#replyCreateContent" + guestid).val();
		var id = $("#replyCreateId" + guestid).val();
		var col = $("#replyCreateCol" + guestid).val();
		var word = $("#replyCreateWord" + guestid).val();
		var nowPage = $("#replyCreateNowPage" + guestid).val();
		$.post("./replyAjax", {
			guestid : guestid,
			content : content,
			id : id,
			col : col,
			word : word,
			nowPage : nowPage,
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
	<div class="well" class="col-sm-8" align="center" id="replyCreate${guestid}">
		<FORM name='frm' method='POST' onsubmit="return createSubmit('${guestid}')">
			<!-- 답변을 등록하기 위해서 -->
			<!-- <input type="hidden" name="indent" value="0">
			<input type="hidden" name="ansnum" value="0">
			<input type="hidden" name="guestrid" value="0"> -->

			<input type="hidden" name="id" value="guest" id="replyCreateId${guestid}" />
			<!-- 페이지와 검색 유지를 위해서 -->
			<input name="col" value="${col}" type="hidden" id="replyCreateCol${guestid}">
			<input name="word" value="${word}" type="hidden" id="replyCreateWord${guestid}">
			<input name="nowPage" value="${nowPage}" type="hidden" id="replyCreateNowPage${guestid}">
			<textarea rows="2" class="col-sm-8" placeholder="댓글 작성" name="content" id="replyCreateContent${guestid}"></textarea>
			<input type="submit" name="rsubmit" class="btn btn-default" value="댓글 작성">
		</FORM>
	</div>
</body>
</html>