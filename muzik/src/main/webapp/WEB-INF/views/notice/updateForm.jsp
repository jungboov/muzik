<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	//f는 매개변수로 form을 가리킨다.
	if(f.grade.value==""){
		alert("이름을 입력하세요.");
		f.wname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	}
// 	if(f.content.value==""){
// 		alert("내용을 입력하세요.");
// 		f.content.focus();
// 		return false;
// 	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false;
	}
	
	
}

function blist(){
	var url = "${pageContext.request.contextPath}/notice/list";

	location.href=url; // 이동하는 것 삭제누르는 순간 이동한다
	}
	

</script>
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
.td1{
	text-align: left;
}

.table1{
table-layout:fixed;
word-break:break-all;
}
</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
  
</script>

</head> 
<!-- *********************************************** -->
<body>
 
<FORM name='frm' method='POST' 
action='./update' 
onsubmit="return incheck(this)"
enctype="multipart/form-data">
<input name="noticeid" value="${dto.noticeid}" type="hidden">
  <TABLE width="800" class="table1">
     <TR>
      <TD class="td1">
       <input style="width: 625px;" type="text" name="title" value="${dto.title }">
      </TD>
    </TR>
     <TR>
      <TD class="td1">
      	<textarea rows="10" cols="105" name="content">${dto.content}</textarea>
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom' >
    <input type='submit' value='수정' >
    <input type='button' value='취소' onclick="blist()">
<!-- 	<input type='button' value='취소' id='btn1'> -->
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 
