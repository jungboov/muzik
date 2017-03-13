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


<script type="text/javascript">
function blist() {
	var url = "list.do";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}	

</script>

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>

<div class="w3-container" id="services" style="margin-top:70px">
<h2 style="margin-bottom: 0px;"><span class="glyphicon glyphicon-th-list"></span>_게시판</h2>
<hr style="width:170px; border:2px solid; margin-top: 5px; border-color: #FF4500" class="w3-round">
</div> 

<div class="w3-row">
<div class="w3-col w3-center modalPosition">
<div class="content">

<c:choose>
<c:when test="${not pflag}">
<div class="container">
	    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">패스워드 불일치</button>

	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">패스워드 불일치</h4>
	        </div>
	        <div class="modal-body">
	          <p>패스워드를 확인해 주세요.</p>
	        </div>
	        <div class="modal-footer modal-button">
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="blist()">목록</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="history.go(-1)">다시시도</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>		
</c:when>
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
          <p>수정을 성공했습니다. 다시 시도해 주세요.</p>
        </div>
        <div class="modal-footer modal-button">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="blist()">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="history.go(-1)">다시시도</button>
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
	          <p>수정을 실패했습니다.</p>
	        </div>
	        <div class="modal-footer modal-button">
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="blist()">목록</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='./createForm.do'">등록</button>
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
</div>
</body>
</html> 
