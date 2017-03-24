<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
 	String root=request.getContextPath();
	String id= (String)request.getAttribute("id");
	String grade= (String)request.getAttribute("grade");
	
   
	MemberDTO dto= (MemberDTO)request.getAttribute("dto");			
%>   --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function mlist(){
		var url= "<%-- <%=root%> --%>${pageContext.request.contextPath}/admin/list";
		url += "?col=<%-- <%=request.getParameter("col")%> --%>${param.col}";	
		url += "&word=<%-- <%=request.getParameter("word")%> --%>${param.word}";		
		url += "&nowPage=<%-- <%=request.getParameter("nowPage")%> --%>${param.nowPage}";
		
		location.href=url;		
	}
	function update(){
		var url= "update";
		url += "?id=<%-- <%=id%> --%>${id}";
		url += "&col=<%-- <%=request.getParameter("col")%> --%>${param.col}";	
		url += "&word=<%-- <%=request.getParameter("word")%> --%>${param.word}";		
		url += "&nowPage=<%-- <%=request.getParameter("nowPage")%> --%>${param.nowPage}";
		location.href=url;		
	}
	function updatePw(){
		var url= "updatePw";
		url += "?id=${id}";
		
		location.href=url;
	}
	function updateFile(){
		var url= "updateFile";
		url += "?id=${id}";
	    url += "&oldfile=${dto.fname}"; 
		location.href=url;		
	}
</script>


<script type="text/javascript">
	$(document).ready(function(){
		if('${sessionScope.grade}'=='F'  || '${sessionScope.grade}'=='G'){
			$("#profile").show();
			$("#imagefile").hide();			
		} else if('${sessionScope.grade}'=='A'){
			$("#profile").show();
			$("#imagefile").show();
		}else{
			$("#profile").hide();
			$("#imagefile").show();
		}
	});

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title"><%-- <%=dto.getMname() %> --%>${dto.name } 회원정보</DIV>
 

  
  	<div id="imagefile">      
      <img src="${pageContext.request.contextPath}/member/storage/${dto.fname}" width="120" >
       <br> 파일이름:${dto.fname}
     </div>
 
     아이디: ${dto.id }
    <br>
      이름:${dto.name}
     <br>
      이메일: ${dto.email}    
    <br>
    
      
    <div id="profile">   
         프로필사진<br>  
      <img src='${dto.image}'>   
    </div>
   
 
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update()">
<%--     <%if(id!=null && grade.equals("A")){//관리자 %> --%>
	<c:choose>
		<c:when test="${not empty id && grade=='A' }">
    <input type='button' value='회원목록' onclick="mlist()">
<%--     <%}else{ %> --%>
		</c:when>
		<c:otherwise>
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='패스워드 변경' onclick="updatePw()">
<%--     <input type='button' value='다운로드'  
           onclick="location.href='<%=root %>${pageContext.request.contextPath}/download?dir=/member/storage&filename=${dto.fname}<%=dto.getFname()%>'">  --%>
<%--   	<%} %> --%>
		</c:otherwise>
	</c:choose>
  </DIV> 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
