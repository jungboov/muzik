<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function blist(){
	var url = "list.do";
	
	location.href=url;
}

</script>
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 <div class="title">처리결과</div>
<DIV class="content">
<c:choose>
<c:when test="${flag }">글이 등록 되었습니다.</c:when>
<c:otherwise>글등록이 실패하였습니다.</c:otherwise>
</c:choose>

 </DIV>
 <div class="buttom">
 <input type="button" value="계속등록" onclick="location.href='./create.do'">
 <input type="button" value="목록" onclick="blist()">
 </div>
 
 

</body>
<!-- *********************************************** -->
</html> 