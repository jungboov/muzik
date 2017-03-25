<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script>
$(function(){
 	$("span#btn_close").prepend('<img style="width:16px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/close.png" />');
});
</script>
</head>
<body>
<table class="table table-bordered">
	<tr>
		<th>보관함 이름</th>
		<th>생성일</th>
	</tr>
<c:choose>
	<c:when test="${empty invenList }">
		<tr>
			<td colspan="2">보관 목록이 비어있습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
	<c:forEach items="${invenList}" var="dto">
	<tr>		
		<td>><a id="read_inven" data-toggle="modal" data-target="#readInven" data-invenid="${dto.invenId}">${dto.invenName}</a></td>
		<td>${dto.cdate}</td>
	</tr>
	</c:forEach>	
	</c:otherwise>
</c:choose>
	
	

</table>
<div class="w3-center">
	<button type="button" class="btn btn-default" id="closeInven" style=""><span id="btn_close">보관함 닫기</span></button>
</div>
</body>
</html>