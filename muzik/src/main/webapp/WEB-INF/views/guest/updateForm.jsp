<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm</title>
<script type="text/javascript">
	/* $(function() {
		$("#id").blur(function() {
			if ($("#id").val() == "") {
				$("#idAlert").text("ID를 입력해 주세요");
				$("#idAlert").attr("style", "color:red");
				$("#id").focus();
			} else {
				$("#idAlert").html("완료");
				$("#idAlert").attr("style", "color:blue");
			}
			;
		});
	}); */
	function incheck(f) {
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
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
			글 수정
		</h2>

		<FORM name='frm' method='POST' action='./update' enctype="multipart/form-data" onsubmit="return incheck(this)">
			<input type="hidden" name="ansnum" value="${dto.ansnum}">
			<input name="guestid" value="${dto.guestid}" type="hidden">
			<input name="col" value="${param.col}" type="hidden">
			<input name="word" value="${param.word}" type="hidden">
			<input name="nowPage" value="${param.nowPage}" type="hidden">
			<TABLE class="table table-hover">
				<%-- <TR>
					<TH>성명</TH>
					<TD>
						<input type="text" id="id" name="id" value="${dto.id}">
						<div id="idAlert"></div>
					</TD>
				</TR> --%>
				<TR>
					<TH>내용</TH>
					<TD>
						<textarea rows="10" cols="45" name="content">${dto.content}</textarea>
					</TD>

				</TR>
			</TABLE>

			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='수정'>
				<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
