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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">
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
	<div id="element_to_pop_up" class="content">
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up1" class="content1">
		회원가입 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up2" class="content2">
		일반 로그인 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up3" class="content3">
		일반 회원가입 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up4" class="content4">
		회원정보
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up5" class="content5">
		닉네임 수정
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<a href="./list?col=&word=&nowPage=1" style="color: black;">
				<span class="glyphicon glyphicon-list-alt h2_span"></span>
				방명록
			</a>
			글 수정
		</h2>
		<c:choose>
			<c:when test="${sessionScope.nickname==dto.id }">
				<FORM name='frm' method='POST' action='./update' enctype="multipart/form-data" onsubmit="return incheck(this)">
					<input type="hidden" name="ansnum" value="${dto.ansnum}">
					<input name="guestid" value="${dto.guestid}" type="hidden">
					<input name="col" value="${param.col}" type="hidden">
					<input name="word" value="${param.word}" type="hidden">
					<input name="nowPage" value="${param.nowPage}" type="hidden">
					<div class="panel panel-default">

						<div class="panel-body">
							<textarea rows="10" cols="45" name="content">${dto.content}</textarea>
						</div>
						<DIV class='panel-footer bottom' align="center">
							<input type='submit' class="btn btn-default" value='수정'>
							<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
						</DIV>
					</div>
				</FORM>
			</c:when>
			<c:otherwise>
				<div class="panel panel-default">
					<div class="panel-heading" align="center">
						본인의 글만 수정이 가능합니다.
						<br>
					</div>
					<DIV class='panel-body bottom' align="center">
						<input type='button' class="btn btn-default" value='뒤로 가기' onclick='history.go(-1)'>
					</DIV>
				</div>
			</c:otherwise>
		</c:choose>


		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
