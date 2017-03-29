<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="wth=device-wth, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>replyForm</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">
<script type="text/javascript">
	function incheck(f) {
		if (f.id.value == "") {
			alert("로그인을 하셔야 글을 쓰실수 있습니다.\n상단 메뉴바에서 로그인을 해 주세요.");
			f.id.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력 해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그  값
	};
</script>
</head>
<!-- *********************************************** -->
<body class="board_body">
<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<a href="./list?col=&word=&nowPage=1" style="color: black;">
				<span class="glyphicon glyphicon-list-alt h2_span"></span>
				방명록
			</a>
			답글 작성
		</h2>

		<FORM name='frm' method='POST' action='./reply' enctype="multipart/form-data" onsubmit="return incheck(this)">

			<!-- 답변을 등록하기 위해서 -->
			<input type="hidden" name="id" value="${sessionScope.nickname}" />
			<input type="hidden" name="guestid" value="${dto.guestid}">
			<input type="hidden" name="indent" value="0">
			<input type="hidden" name="ansnum" value="0">

			<!-- 페이지와 검색 유지를 위해서 -->
			<input name="col" value="${param.col}" type="hidden">
			<input name="word" value="${param.word}" type="hidden">
			<input name="nowPage" value="${param.nowPage}" type="hidden">

			<TABLE class="table table-hover">
				<TR>
					<TH>내용</TH>
					<TD>
						<textarea rows="10" cols="45" name="content"></textarea>
					</TD>
				</TR>
			</TABLE>
			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='작성'>
				<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
