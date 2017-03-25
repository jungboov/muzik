<%@ page contentType="text/html; charset=UTF-8" %> 

<%-- <%  
	String root= request.getContextPath();
	String id= (String)request.getAttribute("id");
	MemberDTO dto= (MemberDTO)request.getAttribute("dto");
	
%>  --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
<%-- function inputCheck(f){

	if(f.email.value==""){
	alert("이메일을 입력해 주세요");
	f.email.focus();
	return false;
	}
	if(f.job.value=="0"){
	alert("직업을 선택해 주세요");
	f.job.focus();
	return false;
	} 
 
}
	function nicknameCheck2(i){
		alert("이메일을 변경하려면 중복확인 버튼을 누르세요\n 버튼을 사용하세요");
		i.blur();
		
	}
 	function nicknameCheck(nickname){
		if(email==""){
		alert("이메일을 입력해 주세요");
		document.frm.email.focus();
		}else{
		var url ="<%=root%>${pageContext.request.contextPath}/member/email_proc";
		url += "?email="+email;
		wr = window.open(url,"이메일중복확인","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2)
	} 
} --%>
</script> 
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
<!--  onsubmit="return inputCheck(this)" -->
	<FORM name='frm' id="frm"
	 method='POST' 
	 action='./update'	 
	 >
<input type="hidden" name="id" value="<%-- <%=id %> --%>${id}">
<input type="hidden" name="col" value="<%-- <%=request.getParameter("col") %> --%>${param.col}">
<input type="hidden" name="word" value="<%-- <%=request.getParameter("word") %> --%>${param.word}">
<input type="hidden" name="nowPage" value="<%-- <%=request.getParameter("nowPage") %> --%>${param.nowPage}">
  <TABLE>
   <%--  <TR>    
      <TD colspan="3"><img src="<%=root%>${pageContext.request.contextPath}/member/storage/${dto.fname}<%=dto.getFname() %>"></TD>
    
    </TR> --%>
    <TR>
      <TH>아이디</TH>
      <TD><%-- <%=dto.getId() %> --%>${dto.id}
      </TD>
      <td>아이디</td>
    </TR>
    <tR>
     <TH>이름</TH>
      <TD><%-- <%=dto.getMname() %> --%>${dto.name}</TD>
      <td>고객실명</td>
    </TR> 

<%--     <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="email" size="25" value="<%=dto.getEmail()%>${dto.email}" onclick="emailCheck2(this)">
      <input type="button" value="Email중복확인"
      onclick="emailCheck(document.frm.email.value)">
      </TD>
      <td>변경할 이메일을 적어 주세요.</td>
    </TR> --%>
    
      <TR>
      <TH>닉네임</TH>
      <TD><input type="text" name="nickname" id="nickname" size="25" value="${dto.nickname}">
    <!--   <input type="button" value="Email중복확인"
      onclick="emailCheck(document.frm.email.value)"> -->
      <div id="nmessage" style="display:none;"></div>
      </TD>
      <td>변경할 닉네임을 적어 주세요.</td>
    </TR>
           
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button'  class=”close-button”  value='회원정보수정' onclick="join()"> 
    <input type='reset' value='취소'>
  </DIV>
</FORM>


<script>
$(document).ready(function(){
	$("#nickname").keyup(function(){
		$.ajax({
			url:"./nickname_proc",
			data:({
			nickname: $("input[name=nickname]").val()
			}),
			success: function(data){
				if(jQuery.trim(data)=='YES'){
					$('#nmessage').html("<font color=green>사용 가능</font>");
					$('#nmessage').show();
				}else{
					$('#nmessage').html("<font color=red>사용 불가능</font>");
					$('#nmessage').show();
				}
			}				
			});
		});		
	});
</script>

<script>
function join() { 	
	if($('#nmessage').html() !='<font color="green">사용 가능</font>'){
		 /*  alert("아이디를 다시 확인해주세요."); */
		 /* alert($('#idmessage').html()) */
		  alert('3');
		  frm.nickname.focus(); 
		  return false;			  
	 }else{		 
		  $('#frm').submit();			  
		  parent.document.location.reload(); 
	 }	  
}
</script>  
  
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
