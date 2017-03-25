<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <script type="text/javascript">

</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">

</head>
<body>
<DIV class="title">좋아요 순위</DIV>

<c:forEach items="${list}" var="dto">

<table  id="treeData">
<tr>
<td  width="300">
<div class="flip"><a href="#" class="flip">${dto.title }</a></div>
</td>
<td  width="100">
${dto.mlike}
</td>
<td  width="100">
${dto.period}
</td>
</tr>
</table>
</c:forEach>

<div class="panel">

</div>
</body>
</html> 