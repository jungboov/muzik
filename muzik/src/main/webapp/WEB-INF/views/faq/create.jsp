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

</style>
<script type="text/javascript">
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
</script>
 
</head> 
<body> 

<form name="frm" method="POST" action="./create" onsubmit="return input(this)">

<div class="container">
  <div class="form-group">
    <label for="title">제목</label>
    <input type="text" class="form-control" name="title">

    <label for="content">내용</label>
    <textarea class="form-control" rows="30" name="content"></textarea>
  </div>
</div>

<div class="input-group">
  <div class="input-group-btn">
    <button type="submit" class="btn btn-default btn-sm">
    <span class="glyphicon glyphicon-pencil"></span> 등록 </button>
  </div>
</div>

</form>

</body> 
</html> 