<%@ page contentType="text/html; charset=UTF-8" %> 

<%-- <%
	String id= request.getParameter("id");
	if(id==null){
		id=(String)session.getAttribute("id");
	}
	String oldfile= dao.getFname(id);	
%>  --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 

</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="container text-center"><h2><span class="glyphicon glyphicon-list-alt"></span>회원탈퇴</h2></DIV>
 
<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name="id" value="${id}">
<input type="hidden" name="oldfile" value="${oldfile}">

<div class="container text-center">정말 탈퇴하시겠습니까?</div><br>

  <div class="container text-center">
    <input type='submit' class="btn btn-default" value='탈퇴'>
    <input type='button' class="btn btn-default" value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
