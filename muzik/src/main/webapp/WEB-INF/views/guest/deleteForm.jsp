<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>deleteForm</title>
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
			글 삭제
		</h2>
		<div class="content">
			<c:choose>
				<c:when test="${flag}">
					<div class="panel panel-default">
						<div class="panel-heading" align="center">
							답변이 있는 글이므로 삭제 불가능
							<br>
						</div>
						<DIV class='panel-body bottom' align="center">
							<input type='button' class="btn btn-default" value='목록 보기' onclick='history.go(-1)'>
						</DIV>
					</div>
				</c:when>
				<c:otherwise>
					<FORM name='frm' method='POST' action='./delete' onsubmit="return incheck(this)">
						<input name="col" value="${param.col}" type="hidden">
						<input name="word" value="${param.word}" type="hidden">
						<input name="nowPage" value="${param.nowPage}" type="hidden">
						<input type="hidden" name="guestid" value="${param.guestid}">

						<div class="panel panel-default">
							<div class="panel-heading" align="center">삭제하면 복구할 수 없습니다</div>
							<DIV class='panel-body bottom' align="center">
								<input type='submit' class="btn btn-default" value='삭제'>
								<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
							</DIV>
						</div>
					</FORM>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>