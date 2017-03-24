<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 
	String root= request.getContextPath();

	String col= (String)request.getAttribute("col");
	String word= (String)request.getAttribute("word");
	int nowPage= (Integer)request.getAttribute("nowPage");

	Iterator<MemberDTO> iter=(Iterator<MemberDTO>)request.getAttribute("iter");	
	String paging = (String)request.getAttribute("paging");	
%>  --%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
	function read(id){
		var url="<%-- <%=root%> --%>${pageContext.request.contextPath}/member/read";
		url += "?id="+id;
		url += "&nowPage=<%-- <%=nowPage%> --%>${nowPage}";
		url += "&col=<%-- <%=col%> --%>${col}";
		url += "&word=<%-- <%=word%> --%>${word}";
		
		location.href= url;
	}
</script>


</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>

<div class="search"> 
	<FORM name='frm' method='POST' action='./list'>
		<select name= "col">
		
			<option value="name"
			<%-- <%if(col.equals("mname")) out.print("selected='selected'");%>  --%>
			<c:if test="${col==name }">selected='selected'</c:if>
			>성명</option>
						
			<option value="email"
			<%-- <%if(col.equals("email")) out.print("selected='selected'");%> --%> 
			<c:if test="${col==email }">selected='selected'</c:if>
			>이메일</option>	
					
			<option value="id"
			<%-- <%if(col.equals("id")) out.print("selected='selected'");%> --%> 
			<c:if test="${col==id }">selected='selected'</c:if>
			>아이디</option>	
					
			<option value="total">전체출력</option>					
		</select>
			
		<input type="text" name="word" value='<%-- <%=word %> --%>${word}'>
		<input type="submit" value="검색">
		<input type="button" value="회원가입" onclick="location.href='<%-- <%=root%> --%>${pageContext.request.contextPath}/member/agree'">
	</FORM>
</div>
<%-- <%while(iter.hasNext()) {
	MemberDTO dto= iter.next();
%> --%>
<c:forEach items="${list }" var="dto">
  <TABLE>
  
    <TR>
<%--       <TD rowspan='5' width="25%">
      <img src= '<%=root%>${pageContext.request.contextPath}/member/storage/${dto.fname}<%=dto.getFname() %>'>
      </TD> --%>
      <TH width="20%">아이디</TH>
      <TD width="55%">
      <a href="javascript: read('<%-- <%=dto.getId() %> --%>${dto.id }')"> <%-- <%=dto.getId() %> --%>${dto.id }</a>
      </TD>
    </TR>
    
    <TR>
      <TH>성명</TH>
      <TD><%-- <%=dto.getMname() %> --%>${dto.name }</TD>
    </TR>

    
    <TR>
      <TH>이메일</TH>
      <TD><%-- <%=dto.getEmail() %> --%>${dto.email }</TD>
    </TR>
    

  </TABLE>
<%--  <%} %> --%>
</c:forEach>
 
  <DIV class='bottom'>
<%--    <%=paging%> --%>${paging }
  </DIV>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
