<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">

</head>
<body>
	<DIV class="title">좋아요 순위</DIV>


		<table class="table table-hover" id="treeData">
			<tr>
				<td>Title</td>
				<td>Artist</td>
				<td>Thumbnail</td>
				<td>url</td>
				<td>period</td>
				<td>mlike</td>
			</tr>
	<c:forEach items="${list}" var="dto" begin="0" end="4">
			<tr>
				<td>${dto.title }</td>				
				<td >${dto.artist}</td>
				<td >${dto.thumbnail}</td>
				<td >${dto.url}</td>
				<td >${dto.period}</td>
				<td >${dto.mlike}</td>
			</tr>
	</c:forEach>
		</table>

	<div class="panel"></div>
</body>
</html>
