<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title> 

<script type="text/javascript">

function qread(qnaid){
    var url= "read";
    url+= "?qnaid="+qnaid;
    url+= "&col=${col}";
    url+= "&word=${word}";
    url+= "&nowPage=${nowPage}";
    
    location.href=url;
}

</script>

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>

<div class="container-fluid bg-1 text-center">
  <h3 class="margin">고객센터</h3>
</div>

<div class="container">           
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${fn:length(list)==0 }">
      <tr>
        <td colspan="5">등록된 글이 없습니다</td>
      </tr>
      </c:when>
      <c:otherwise>
        <c:forEach items="${list}" var="dto">
      <tr>
        <td>${dto.qnaid}</td>
        <td>
          <c:forEach begin="1" end="${dto.indent}">
            <c:out value="&nbsp;&nbsp;" escapeXml="false" />
          </c:forEach>
          <c:if test="${dto.indent>0 }">
            <img src="../images/re.jpg">
          </c:if>
	        <a href="javascript:qread('${dto.qnaid}')" style="color: black;">${dto.title}</a>
	      <c:if test="${util:newImg(fn:substring(dto.cdate,0,10)) }">
	        <img src="${pageContext.request.contextPath}/images/new.gif">
	      </c:if>
        </td>
        <td>${dto.nickname}</td>
        <td>${fn:substring(dto.cdate,0,10)}</td>
        <td>${dto.viewcnt}</td>        
      </tr>
  </c:forEach>
    </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>

<form class="form-inline" method="post" action="./list">
<div class="container">
  <div class="form-group">
    <select class="form-control" name="col">
      <option value="title"
        <c:if test="${col=='title'}">selected='selected'</c:if>
        >제목</option>
        <option value="content"
        <c:if test="${col=='content'}">selected='selected'</c:if>
        >내용</option>
        <option value="total">전체</option>
    </select>
  </div>
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search" name="word" value="${word}">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-search"></span> 검색 </button>
      
	    <button type="button" class="btn btn-default btn-sm" onclick="location.href='./create'">
        <span class="glyphicon glyphicon-ok"></span> 등록 </button>
    </div>
  </div>
</div>
</form> 
  
  
  <DIV class='bottom'>
   ${paging }
  </DIV>

</body>
</html> 
