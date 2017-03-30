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
			<td>Title</td>
			<td colspan="2">Artist</td>
			<td>url</td>
			<td>period</td>
			<td>mlike</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.title }</td>
				<td>${dto.artist}</td>
				<td><img src="${dto.thumbnail}" width="55px" height="30px"></td>
				<td>${dto.url}</td>
				<td>${dto.period}</td>
				<td>${dto.mlike}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
