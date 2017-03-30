<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>


<!DOCTYPE html> 
<html> 
<head> 
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="Stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">
<script type="text/javascript">
function read(bbsid) {
	var url = "read"
	url += "?bbsid="+bbsid;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&rbbsid=${rbbsid}";
	location.href = url
}

function down(filename) {
	var url = "${pageContext.request.contextPath}/download";
	url += "?dir=/bbs/storage";
	url += "&filename="+filename;
	location.href = url;
}

/* function create(create) {
	if("${sessionScope.nickname}" == ""){
		if(confirm("로그인해주세요."))
	}
	return false;
}
 */
</script>
<style type="text/css">
a{
color: white;
}
.a{
color: navy;
}
</style>
</head> 

<body>

<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>

<h2 class="iconPosition"><span class="glyphicon glyphicon-th-list"></span>_게시판</h2>
<hr class="w3-round border-position">
<div class="w3-container mainPosition" id="services">
</div> 
  
<div class="container">
<div class="search serchPosition">
<form action="./list" method="post">

<select name="col"><%-- 검색할 컬럼 --%>

	<option value="id" 
	<c:if test="${col==id}">selected='selected'</c:if>	
	>성명</option>
	
	<option value="title"
	<c:if test="${col==title}">selected='selected'</c:if>	
	>제목</option>
		
	<option value="content"
	<c:if test="${col==content}">selected='selected'</c:if>	
	>내용</option>
	
	<option value="tot">전체출력</option>
</select>
<c:choose>
<c:when test="${empty sessionScope.id}">
<input type="text" name="word" value="${word}"><%-- 검색어 --%>
<input type="submit" class="btn btn-default" value="검색"> <h4>로그인 하셔야 글 등록이 가능합니다.</h4>
</c:when>
<c:otherwise>
<input type="text" name="word" value="${word}">
<input type="submit" class="btn btn-default" value="검색">
<input type='button' class="btn btn-default" value='등록' onclick="location.href='./create'">
</c:otherwise>
</c:choose>
</form>
</div>

  <TABLE class="table table-hover">
    <TR>
  
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일명</TH>
    
    </TR>
   <c:choose>

<c:when test="${fn:length(list)==0}">    
	<tr>
	<td colspan="8">등록된 글이 없습니다.</td>
	</tr>
</c:when>

<c:otherwise>
<c:forEach items="${list}" var="dto">

	 <TR>
      <TD>${dto.bbsid}</TD>
      
      <TD align="left">
	   
 	 <!-- <img src="./img/p.jpg" width="20px" height="20px"> --> 
 	 <c:set var="rcount" value="${util:brcount(dto.bbsid,irdao)}"/>
      <a class="a" href="javascript:read('${dto.bbsid}')" style="color: black;">
      ${dto.title}
       <c:if test="${rcount>0}"><span style="color:red;">(${rcount})</span></c:if>
      </a>
	
	  <c:if test="${util:newImg(fn:substring(dto.cdate,0,10))}">     
      <img src="${pageContext.request.contextPath}/bbs/storage/new.gif">
      </c:if>
      </TD>
      
      <TD>${dto.id}</TD>
	  <TD>${dto.viewcnt}</TD>
      <TD>${fn:substring(dto.cdate,0, 10)}</TD>
     
      <TD>
      <c:choose>
      <c:when test="${empty dto.filename}">파일없음</c:when>
      <c:otherwise>
      <a class="a" href="javascript:down('${dto.filename}')" style="color: black;">
      <span class='glyphicon glyphicon-save-file'></span>	
      </a>
      </c:otherwise>
      </c:choose>
     </TD>
     
    </TR>
 
</c:forEach> 
</c:otherwise> 
</c:choose>    
    
  </TABLE>
  
</div>   
<div class="row">
<div class="col-sm-4"></div>  
${paging}
</div>

</body>

</html> 
