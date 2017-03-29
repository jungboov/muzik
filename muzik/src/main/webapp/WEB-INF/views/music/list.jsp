<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
}
.search{
	text-align: center;
  	width: 100%;
	maring: 10px auto;
} 
.tr-inverse{
	background-color: #5b94d1;
  	border-color: #ffffff; 
 	 color:#ffffff;
}
</style>
<script type="text/javascript">
function read(str){
	var url="read";
	url+="?memono="+str;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
	
}
$(document).ready(function(){	
	$("span.up").before("&#8593;");
	$("span.up").css("color", "#ff471a");
	$("span.down").before("&#8595;");
	$("span.down").css("color", "#0066ff");
	$("span.new").css("color", "#ffd633");
});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->

<div class="container ">
<h3 class="text-center">Music Chart</h3><br>

<div class="table-responsive">
  <TABLE class="table table-hover ">
		<tr class="tr-inverse">
			<th colspan='2'>순위</th>
			
			<th >제목</th>
			<th>가수</th>
			<th>앨범</th>
			<th>별점</th>
		</tr>
<c:choose>
<c:when test="${empty albumList}">  
<%-- <c:when test="${fn:length(albumList)==0}">   --%>
    <TR>
      <TD colspan='6'>음원 차트를 가져오지 못했습니다.</TD>
    </TR>
</c:when>
<c:otherwise>
	<c:forEach  var="albumList" items="${albumList}" varStatus="status">	
    <TR>
      <TD ><span class="text-center w3-xlarge">${status.index+1}</span></td>
      <td><span class="text-right">(${rankChList[status.index]})</span></TD>
	  <td>${titleList[status.index]}</td>
      <TD>${artistList[status.index]}</TD>     	
      <TD>${albumList}</TD>
      <td>&#127776;	&#8902;</td>
      
    </TR>
	</c:forEach>  
</c:otherwise>
</c:choose>   
 </table>
</div>
</div>
<br>
</body>
</html>