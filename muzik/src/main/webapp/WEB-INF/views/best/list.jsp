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
	<DIV class="title">국내차트</DIV>

	<c:forEach items="${list}" var="dto" begin="0" end="4">

		<table class="table table-hover" id="treeData">
			<tr>
				<td width="300">
					<div class="flip">
						<a href="${pageContext.request.contextPath}/best/read?bestid=${dto.bestid}" class="flip">${dto.bestid }</a>
					</div>
				</td>
				<td width="100">${dto.id_list}</td>
				<td width="100">${dto.period}</td>
				<td width="100">${dto.chartType}</td>
			</tr>
		</table>
	</c:forEach>
	
	
	<DIV class="title">해외차트</DIV>

	<c:forEach items="${list}" var="dto" begin="0" end="4">

		<table class="table table-hover" id="treeData">
			<tr>
				<td width="300">
					<div class="flip">
						<a href="${pageContext.request.contextPath}/best/read?bestid=${dto.bestid}" class="flip">${dto.bestid }</a>
					</div>
				</td>
				<td width="100">${dto.id_list}</td>
				<td width="100">${dto.period}</td>
				<td width="100">${dto.chartType}</td>
			</tr>
		</table>
	</c:forEach>
	

	<div class="panel"></div>
</body>
</html>
