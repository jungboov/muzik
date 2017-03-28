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

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>

<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">



</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>

<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
		
	
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>


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
