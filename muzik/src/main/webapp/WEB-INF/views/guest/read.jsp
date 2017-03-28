<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>read</title>
<script type="text/javascript">
	function blist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function bupdate() {
		var url = "update";
		url += "?guestid=${dto.guestid}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function bdelete() {
		var url = "delete";
		url += "?guestid=${dto.guestid}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function breply() {
		var url = "reply";
		url += "?guestid=${dto.guestid}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
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
			글 조회
		</h2>

		<TABLE class="table table-hover">
			<TR>
				<TH>글번호</TH>
				<TD>${dto.guestid}</TD>
			</TR>
			<TR>
				<TH>성명</TH>
				<TD>${dto.id}</TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD>${dto.content}</TD>
			</TR>
			<TR>
				<TH>작성일</TH>
				<TD>${fn:substring(dto.cdate,0,16)}</TD>
			</TR>
		</TABLE>
		<DIV class='bottom' align="center">
			<input type='button' value='새글 작성' class="btn btn-default" onclick="location.href='./create'">
			<input type='button' value='목록 보기' class="btn btn-default" onclick="blist()">
			<input type='button' value='답글 작성' class="btn btn-default" onclick="breply()">
			<input type='button' value='수정' class="btn btn-default" onclick="bupdate()">
			<input type='button' value='삭제' class="btn btn-default" onclick="bdelete()">
		</DIV>
		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
