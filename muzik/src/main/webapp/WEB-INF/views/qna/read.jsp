<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
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

	function qlist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function qupdate() {
		var url = "update";
		url += "?qnaid=${dto.qnaid}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function qdelete(qnaid){
	    alert('정말 삭제 하시겠습니까?');
	    var url = "delete";
	    url += "?qnaid="+qnaid;
	    url += "&col=${param.col}"
	    url += "&word=${param.word}"
	    url += "&nowPage=${param.nowPage}"
	    
	    location.href=url;  
	}

	function qreply() {
		var url = "reply";
		url += "?qnaid=${dto.qnaid}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>

<style type="text/css">
</style>  

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>

<DIV class="title">QnA</DIV>

<div class="container">           
  <table class="table">
    <thead>
    </thead>
    <tbody>
      <tr>
        <th>제목</th>
        <td>${dto.title}</td>
      </tr>
      <tr>
        <th>내용</th>
        <td>${dto.content}</td>
      <tr>
        <th>작성자</th>
        <td>${dto.nickname}</td>
      </tr>
      <tr>
        <th>작성일</th>
        <td>${fn:substring(dto.cdate,0,10)}</td>
      </tr>
      <tr>
        <th>조회수</th>
        <td>${dto.viewcnt}</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="container">

	<button type="submit" class="btn btn-default btn-sm" onclick="location.href='./create'">
    <span class="glyphicon glyphicon-ok"></span> 등록 </button>
    <button type="submit" class="btn btn-default btn-sm" onclick="qlist()">
    <span class="glyphicon glyphicon-ok"></span> 목록 </button>
	<button type="submit" class="btn btn-default btn-sm" onclick="qupdate()">
    <span class="glyphicon glyphicon-ok"></span> 수정 </button>
    <button type="button" class="btn btn-default btn-sm" onclick="qdelete('${dto.qnaid}')">
    <span class="glyphicon glyphicon-remove"></span> 삭제 </button>
    <button type="button" class="btn btn-default btn-sm" onclick="qreply()">
    <span class="glyphicon glyphicon-remove"></span> 답변 </button>

</div>
  
  <div class="bottom">
  ${paging}
  </div>

</body>
</html> 
