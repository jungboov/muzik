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

<script src="http://code.jquery.com/jquery-1.7.js"  type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<title></title> 

<style type="text/css">

.ui-autocomplete { 
    position: absolute; 
    cursor: default; 
    height: 200px; 
    overflow-y: scroll; 
    overflow-x: hidden;
    }
    
</style>

<script type="text/javascript">

$(document).ready(function() {
    jQuery(".panel-body").hide();
    //panel-body 클래스를 가진 div를 표시/숨김(토글)
    $(".panel-heading").click(function() {
        $(".panel-body").not($(this).next(".panel-body").slideToggle(500)).slideUp();
     
    });
});

$(doument).ready(function(){
	$("#autocomplete").autocomplete({
		source : function(request, response){
			$.ajax({
				url: "/",
				type: "post",
				dataType: "json",
				data: request,
				success: function(data){
					response(data);
				},
				error : function(data){
					alert("에러발생")
				}
			});
		}
	});
});

function fcreate(){
	var url = "create";
	
	location.href=url;
}

function fupdate(faqid){
	var url= "update";
	url+= "?faqid="+faqid;
	url+= "&col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	
	location.href=url;
}

function fdelete(faqid){
	alert('정말 삭제 하시겠습니가?');
	var url = "${pageContext.request.contextPath}/faq/delete";
	url += "?faqid="+faqid;
	url += "&col=${col}"
	url += "&word=${word}"
	url += "&nowPage=${nowPage}"
	
	location.href=url;	
}

</script>

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>

<div class="container-fluid bg-1 text-center">
  <h3 class="margin">자주묻는질문</h3>
</div>

<div class="container">
  <c:forEach items="${list}" var="dto">
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading"> 
        ${dto.title}
      </div>
      <div class="panel-body">
        ${dto.content }
        <p>
        <input type="hidden" name="faqid" value="${dto.faqid}">
        <button type="submit" class="btn btn-default btn-sm" onclick="fupdate('${dto.faqid}')">
        <span class="glyphicon glyphicon-ok"></span> 수정 </button>
        <button type="button" class="btn btn-default btn-sm" onclick="fdelete('${dto.faqid}')">
        <span class="glyphicon glyphicon-remove"></span> 삭제 </button>
      </div>
    </div>
  </div>
  <hr>
  </c:forEach>
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
    <input type="text" id="autocomplete" class="form-control" placeholder="Search">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-search"></span> 검색 </button>
        <button type="button" class="btn btn-default btn-sm" onclick="fcreate()">
        <span class="glyphicon glyphicon-pencil"></span> 등록 </button>
      </div>
    </div>
</div>

</form>
  
<div class="container">
   ${paging }
</div>

</body>
</html> 
