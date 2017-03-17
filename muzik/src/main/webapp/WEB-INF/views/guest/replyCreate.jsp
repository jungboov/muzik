<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
<div class="well" class="col-sm-8" align="center">
		<FORM name='frm' method='POST' action='./reply'>
			<!-- 답변을 등록하기 위해서 -->
			<input type="hidden" name="id" value="guest" />
			<input type="hidden" name="guestid" value="${dto.guestid}">
			<input type="hidden" name="indent" value="0">
			<input type="hidden" name="ansnum" value="0">
			<input type="hidden" name="guestrid" value="0">
			<!-- 페이지와 검색 유지를 위해서 -->
			<input name="col" value="${col}" type="hidden">
			<input name="word" value="${word}" type="hidden">
			<input name="nowPage" value="${nowPage}" type="hidden">
			<textarea rows="2" class="col-sm-8" placeholder="댓글 작성" name="content" id="textarea"></textarea>
			<input type="submit" name="rsubmit" class="btn btn-default" value="댓글 작성">
		</FORM>
	</div>
</body>
</html>