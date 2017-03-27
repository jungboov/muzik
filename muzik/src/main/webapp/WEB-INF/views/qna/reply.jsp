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
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">

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
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='./reply'>
	<!-- 답변을 등록하기 위해서 -->
   <input name="col" value="${param.col}" type="hidden">
   <input name="word" value="${param.word}" type="hidden">
   <input name="nowPage" value="${param.nowPage}" type="hidden">
	<!-- 페이지와 검색 유지를 하기 위해서 -->
	<input type="hidden" name="grpno" value="${dto.grpno}">
	<input type="hidden" name="indent" value="${dto.indent}">
	<input type="hidden" name="ansnum" value="${dto.ansnum}">
 	<!-- 부모 글 삭제를 막기 위해서 -->
 	<input type="hidden" name ="qnaid" value="${dto.qnaid}" >
 	
<div class="container">
  <div class="form-group">
    <label for="memberid">작성자</label>
    <input type="text" class="form-control" name="memberid" value="guest">
    
    <label for="title">제목</label>
    <input type="text" class="form-control" name="title" value="${dto.title}">

    <label for="content">내용</label>
    <textarea class="form-control" rows="30" name="content"></textarea>
  </div>

  <div class="input-group">
    <div class="input-group-btn">
      <button type="submit" class="btn btn-default btn-sm">
      <span class="glyphicon glyphicon-pencil"></span> 등록 </button>
      
      <button type="button" class="btn btn-default btn-sm" onclick="history.back()">
      <span class="glyphicon glyphicon-pencil"></span> 취소 </button>
    </div>
  </div>
</div>

</FORM>

</body>
</html> 
