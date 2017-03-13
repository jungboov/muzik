<%@ page contentType="text/html; charset=UTF-8" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	//f는 매개변수로 form을 가리킨다.
	if(f.wname.value==""){
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
</script>

<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */

</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">등록</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create'
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD class="td1">관리자</TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD class="td1"><input type="text" name="title"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="50" name="content"></textarea>
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 