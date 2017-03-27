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

      <c:choose>  
 
       		<c:when test="${c_id eq 'Y' }">
         		<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 

       		</c:when>
       		<c:otherwise>
         		<input type='checkbox' name='c_id' value='Y' > ID 저장 

       		</c:otherwise>
       </c:choose>
      </TD>
   
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD>
        <input type="password" id="password" name="password">

      </TD>
    </TR>
  </TABLE>

    
    <input type='button'  class=”close-button”  value='관리자 로그인' onclick="login_admin()"> 
    


</FORM>


<script>

function login_admin(){	  
	  $("#frm").submit();

}
</script>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
