<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createForm</title>
<script type="text/javascript">
	function incheck(f) {
		if (f.title.value == "") {
			alert("제목이 없음");
			f.title.focus();
			return false;
		}
		if (f.id.value == "") {
			alert("이름이 없음");
			f.id.focus();
			return false;
		}
		// 		if (f.content.value == "") {
		// 			alert("내용이 없음");
		// 			f.content.focus();
		// 			return false;
		// 		}
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용이 없음');
			CKEDITOR.instances['content'].focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("암호가 없음");
			f.passwd.focus();
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
			글 작성
		</h2>
		<DIV class="content">

			<FORM name='frm' method='POST' action='./create' enctype="multipart/form-data" onsubmit="return incheck(this)">
				<!-- 나중에 로그인하면 세션의 아이디 값을 받아온다. -->
				<input type="hidden" name="id" value="게스트" />
				<div class="panel panel-default">
					<div class="panel-body">
						<textarea rows="100" cols="145" name="content" placeholder="내용을 쓰세요."></textarea>
					</div>
					<DIV class='panel-footer bottom' align="center">
						<input type='submit' class="btn btn-default" value='작성'>
						<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
					</DIV>
				</div>
			</FORM>
		</DIV>
		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
