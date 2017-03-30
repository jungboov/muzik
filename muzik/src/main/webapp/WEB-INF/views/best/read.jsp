<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">

</head>
<body>
	<table class="table table-hover" >
		<tr>
			<th>Title</th>
			<th colspan="2">Artist</th>
			<th>period</th>
			<th>mlike</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.title }</td>
				<td>${dto.artist}</td>
				<td>
					<a href="../music/read?chartid=${dto.chartid}" onClick="window.open(this.href, 'viewMV', 'width=680, height=780'); return false;">
						<img class="thumb_size w3-card-4 w3-hover-opacity" height="60" width="auto" src="${dto.thumbnail}"></td>
					</a>
				<td>${dto.period}</td>
				<td>${dto.mlike}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
