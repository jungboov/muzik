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
	url+="?col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">수정처리</DIV>
 <div class ="content">
 <c:choose>
 <c:when test="${not pflag }">비밀번호가 일치하지 않습니다.</c:when>
 <c:when test="${flag }">글을 변경하였습니다.</c:when>
 <c:otherwise>게시판등록에 실패하였습니다.</c:otherwise>
 </c:choose>

 </div>
<c:choose>
<c:when test="${not pflag }">
  <DIV class='bottom'>
    <input type='submit' value='돌아 가기' onclick="history.back()">
    <input type='button' value='목록' onclick="blist">
  </DIV>
  </c:when>
  <c:otherwise>
 <DIV class='bottom'>
    <input type='submit' value='다시등록' onclick="location.href='create.do'">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
 </c:otherwise>
 </c:choose>
</body>
<!-- *********************************************** -->
</html> 