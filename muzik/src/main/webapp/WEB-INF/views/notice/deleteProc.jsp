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
	url+="?col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";

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

 
<DIV class="title">처리결과</DIV>
<div class="content"></div>
 <c:choose>
 <c:when test="${not pflag }">
 패스워드가 일치하지 않습니다.
 </c:when>
 <c:when test="${flag }">
 글을 삭제 했습니다.
 </c:when>
 <c:otherwise>
 글삭제를 실패했습니다.
 </c:otherwise>
</c:choose>
<c:choose>
<c:when test="${not pflag }">
<DIV class='bottom'>
    <input type='button' value='돌아가기' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
</c:when>
<c:otherwise>
<DIV class='bottom'>
    <input type='button' value='다시등록' onclick="location.href='create.do'">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
</c:otherwise>
</c:choose>

 

</body>
<!-- *********************************************** -->
</html> 