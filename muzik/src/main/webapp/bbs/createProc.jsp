<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">

<script type="text/javascript">
function blist() {
	var url = "list.do";
	location.href=url;
}
</script>
</head> 

<body>

<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>

<div class="w3-container mainPosition" id="services">
<h2 class="iconPosition"><span class="glyphicon glyphicon-th-list"></span>_게시판</h2>
<hr class="w3-round border-position">
</div> 

<div class="w3-row">
<div class="w3-col w3-center modalPosition">


<c:choose>
<c:when test="${flag}">
<div class="container">
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">결과 확인하기</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결과</h4>
        </div>
        <div class="modal-body">
          <p>등록을 성공했습니다.</p>
        </div>
        <div class="modal-footer modal-button">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="blist()">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" 
           onclick="location.href='./createForm.do'">다시등록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
</c:when>
<c:otherwise>
	<div class="container">
    	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">결과 확인하기</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결과</h4>
        </div>
        <div class="modal-body">
          <p>등록을 실패했습니다. 다시 시도해 주세요.</p>
        </div>
        <div class="modal-footer modal-button">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="blist()">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" 
           onclick="location.href='./createForm.do'">다시시도</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
</c:otherwise>
</c:choose>
</div>	
</div>	
</body>

</html> 
