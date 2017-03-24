<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <script type="text/javascript">
// $(document).ready(function(){
// 		$.ajax({
// 		url:"${pageContext.request.contextPath}/likebest/iframe",
// 		success:function(data){
// 		$("#treeData").html(data);
// 		}
// 		});
// });

$(".flip").click(function() {
		 var allData = { "thumbnail": thumbnail};
		$.ajax({
	 		url:"${pageContext.request.contextPath}/likebest/iframe",
	 		data: allData,
	 		success:function(data){
	 		$(".panel").html(data);
	 		}
	 		});
	});


</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">

</head>
<body>
<DIV class="title">좋아요 순위</DIV>

<c:forEach items="${llist}" var="dto" begin="0" end="4">

<table  id="treeData">
<tr>
<td>${dto.bestid }</td>
<td  width="300">
<div class="flip"><a href="#" class="flip">${dto.title }</a></div>
</td>
<td  width="100">
${dto.mlike}
</td>
<td  width="100">
${dto.week}
</td>
</tr>
</table>
</c:forEach>

<div class="panel">

</div>
</body>
</html> 