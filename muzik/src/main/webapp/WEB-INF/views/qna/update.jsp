<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title> 
<style type="text/css">
function input(frm){
    if(frm.title.value==""){
        alert("제목을 입력하세요");
        frm.title.focus();
        return false;
    }
    if(frm.content.value==""){
        alert("내용을 입력하세요");
        frm.content.focus();
        return false;
    }
}
</style> 
</head> 
<body> 

	<div>수정</div>
<form name="frm" method="POST" action="./update" onsubmit="return input(this)">
<input type="hidden" name="qnaid" value="${dto.qnaid}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<div class="container">
  <div class="form-group">
    <label for="title">제목</label>
    <input type="text" class="form-control" name="title" value="${dto.title}">
    
    <label for="nickname">작성자</label>
    <input type="text" class="form-control" name="nickname" value="${dto.nickname}">

    <label for="content">내용</label>
    <textarea class="form-control" rows="30" name="content">${dto.content}</textarea>
  </div>

<div class="input-group">
  <div class="input-group-btn">
    <button type="submit" class="btn btn-default btn-sm">
    <span class="glyphicon glyphicon-pencil"></span> 수정 </button>
    <button type="button" class="btn btn-default btn-sm" onclick="history.back()">
    <span class="glyphicon glyphicon-pencil"></span> 취소 </button>
  </div>
</div>
</div>

</form>
	
</body> 
</html>
