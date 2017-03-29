<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <% request.setCharacterEncoding("utf-8"); 
   String root= request.getContextPath();
   
   String c_id=(String)request.getAttribute("c_id");
   String c_id_val=(String)request.getAttribute("c_id_val");
   
   
%>   --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/home.bpopup.js"/>"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script> 
<script>
$(document).ready(function(){
	$("#id").blur(function(){
		$.ajax({
			url:"./id_proc",
			data:({
			id: $("input[name=id]").val()
			}),
			success: function(data){
				if(jQuery.trim(data)=='NO'){
					$('#iCheck').html("<font color=green>사용 가능</font>");
					$('#iCheck').show();					
				}else{
					$('#iCheck').html("<font color=red>등록되지 않은 ID 입니다.</font>");
					$('#iCheck').show();					
				
				}
			}				
		});
	});		
});	


$(document).ready(function(){
	$("#password").keyup(function(){
		$.ajax({
			url:"./idpasswordCheck",
			data:{
			id: $("input[name=id]").val(), 
			password: $("input[name=password]").val()
			},
			success: function(data){
				if(jQuery.trim(data)=='YES'){
					$('#pCheck').html("<font color=green>맞는 패스워드</font>");
					 $('#pCheck').hide(); 			
				}else{
					$('#pCheck').html("<font color=red>패스워드가 다름</font>");
					$('#pCheck').hide();					
				
				}
			}				
		});
	});		
});	


</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">로그인</DIV>
 
<FORM name='frm' id='frm' method='POST' action='${pageContext.request.contextPath}/member/general_login'>
<%--    <input type="hidden" name="bflag" value="${param.bflag}">
   <!--pk값 bbsno, memono  -->
  <input type="hidden" name="no" value="${param.no}">
  <!--식별자(pk 아ㅣ름)  -->
  <input type="hidden" name="ino" value="${param.ino}">
  
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${param.nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}"> --%>
  
  
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" id="id" value='${c_id_val}'> 
      <div id="iCheck" style="display:none;"></div>
      <c:choose>  
       <%-- <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>    --%>
       		<c:when test="${c_id eq 'Y' }">
         		<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
<%--        <% 
       }else{ %>  --%>
       		</c:when>
       		<c:otherwise>
         		<input type='checkbox' name='c_id' value='Y' > ID 저장 
<%--        <% 
       } 
       %>  --%>
       		</c:otherwise>
       </c:choose>
      </TD>
   
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD>
        <input type="password" id="password" name="password">
        <div id="pCheck" style="display:none;"></div>
      </TD>
    </TR>
  </TABLE>
  <div class="login"></div>

    <input type='button'  class=”close-button”  value='로그인' onclick="login(); return false;"> 
    <!-- <input type='button'  class=”close-button”  value='관리자 로그인' onclick="login_admin()">  -->
    <input type='button' value='회원가입' onclick="location.href='agree'">
<br><br>

</FORM>


<script>
function login() {	
	if($('#iCheck').html() !='<font color="green">사용 가능</font>'){
		 /*  alert("아이디를 다시 확인해주세요."); */
		 /* alert($('#idmessage').html()) */

		  frm.id.focus();
		  return false;	
		  
	  }else if($('#pCheck').html() !='<font color="green">맞는 패스워드</font>'){
		  $('#pCheck').show();
		  frm.password.focus(); 	
		  return false;	
		  
	  }	else{
		  $("#frm").submit();
	      parent.document.location.reload();   
	  }
}
function login_admin(){	  
	  $("#frm").submit();
	  parent.document.location.reload(); 
}
</script>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
