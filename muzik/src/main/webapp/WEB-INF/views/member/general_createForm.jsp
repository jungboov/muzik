<%@ page contentType="text/html; charset=UTF-8" %> 
<%-- <%  request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>  --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script> 
  
<meta charset="UTF-8"> 
<title></title>


<style>
.warn{
	color:red;
}
.hidden{
	display: none;
}

</style>


<script type="text/javascript">
 $(document).ready(function(){
	$("#id").blur(function(){
		$.ajax({
			url:"./id_proc",
			data:({
			id: $("input[name=id]").val()
			}),
			success: function(data){
				if(jQuery.trim(data)=='YES'){
					$('#idmessage').html("<font color=green>사용 가능</font>");
					$('#idmessage').show();
					
				}else{
					$('#idmessage').html("<font color=red>사용 불가능</font>");
					$('#idmessage').show();
					
				
				}
			}				
		});
	});		
});	
 
	$(document).ready(function(){
		$("#email").blur(function(){
			$.ajax({
				url:"./email_proc",
				data:({
				email: $("input[name=email]").val()
				}),
				success: function(data){
					if(jQuery.trim(data)=='YES'){
						$('#emessage').html("<font color=green>사용 가능</font>");
						$('#emessage').show();
					}else{
						$('#emessage').html("<font color=red>사용 불가능</font>");
						$('#emessage').show();
					}
				}				
				});
			});		
		});
 
 
 

$(document).ready(function(){
	$("#repasswd").keyup(function(){
		if($(this).val()==$('#passwd').val()){
			$('#verifynote').addClass('hidden');
		}else{
			$('#verifynote').removeClass('hidden');
			
		}
	});
}); 



</script> 

</head> 
<!-- *********************************************** -->
<body>
<!--  onsubmit="return check()" -->
<!-- *********************************************** -->
 
<DIV class="title">회원가입</DIV>
<!--  enctype="multipart/form-data" -->
<FORM name="frm" id="frm" method="POST"
 action='${pageContext.request.contextPath}/member/general_create'
 enctype="multipart/form-data">
 
  <TABLE>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fnameMF" accept=".jpg,.png,.gif"></TD>
      <td>사진은 JPG,PNG,GIF파일만 올려주세요.</td>
    </TR>
<!--     <TR>
      <TH>*아이디</TH>
      <TD><input type="text" name="id" size="15">
      <input type="button" value="ID중복확인"
             onclick="idCheck(document.frm.id.value)">
      </TD>
      <td>아이디를 적어주세요.</td>
    </TR> -->
    
    <TR>      
      <TH><label for="id">*아이디:</label></TH>
      <TD>    
      <div class="col-sm-3">
      <input type="text" class="form-control" name="id" id="id">
      </div>
           <!--  <input type="button" class="btn btn-default" value="ID중복확인"
             onclick="idCheck(document.frm.id.value)"> -->
            <!--  <button type="button" class="btn btn-default" id="id_check">중복 체크</button> -->
             <div id="idmessage" style="display:none;"></div>
      </TD>          
    </TR>
    
    	
    <TR>      
      <TH><label for="password">*비밀번호:</label></TH>
      <TD>    
      <div class="col-sm-3">
      <input type="password" class="form-control" name="password" id="passwd">
      </div>
      </TD>      
    </TR>  
    

    <TR>      
      <TH><label for="passwd">*비밀번호 확인:</label></TH>
      <TD>    
      <div class="col-sm-3">
      <input type="password" class="form-control" name="repasswd" id="repasswd">
      </div>
      <span id="verifynote" class="warn hidden">패스워드가 불일치</span>
      </TD>      
    </TR>
 
    
    
<!--     <TR>
      <TH>*패스워드</TH>
      <TD><input type="text" name="password" size="15"></TD>
      <td>패스워드를 적어주세요.</td>
    </TR>
 
    <TR>
      <TH>*패스워드 확인</TH>
      <TD><input type="text" name="repassword" size="15"></TD>
      <td>패스워드를 확인합니다.</td>
    </TR> -->
    
<!--     <TR>
      <TH>이미지</TH>
      <TD><input type="text" name="image" size="15"></TD>
      <td>이미지 입력</td>
    </TR> -->
    
     <TR>
      <TH>등급</TH>
      <TD><input type="text" name="grade" size="15" value="Y"></TD>
      <td>이미지 입력</td>
    </TR>
    
    <TR>
      <TH>*이름</TH>
      <TD><input type="text" name="name" size="15"></TD>
      <td>고객실명를 적어주세요.</td>
    </TR>
    
    <TR>
      <TH>닉네임</TH>
      <TD><input type="text" name="nickname" size="15"></TD>
      <td>고객실명를 적어주세요.</td>
    </TR>    
    
  <!--   <TR>
      <TH>*이메일</TH>
      <TD><input type="text" name="email" size="25">
      <input type="button" value="Email중복확인"
      onclick="emailCheck(document.frm.email.value)">
      </TD>
      <td>이메일을 적어 주세요.</td>
    </TR>  -->
    
    
        <TR>      
      <TH><label for="email">*이메일:</label></TH>
      <TD>    
      <div class="col-sm-4">
      <input type="text" class="form-control" name="email" id="email">
      </div>
      <!-- <button type="button" class="btn btn-default" id="email_check">중복 체크</button> -->
      <div id="emessage" style="display:none;"></div>
     <!--  <input type="button" value="Email중복확인" class="btn btn-default" onclick="emailCheck(document.frm.email.value)"> -->
      </TD>      
    </TR>
    
  </TABLE>
  

    <input type='submit' value='회원가입'> 
    <input type='button'  class=”close-button” value='회원가입' onclick=" join(); return false;"> 
    <input type='reset' value='취소'>

</FORM>
 
 <script> 
 
function join(){ 		
	if(frm.id.value == "") {
	    alert("값을 입력해 주세요.");
	     frm.id.focus(); 
	    return false;
	    
	  } else if(frm.password.value == "") {
	    alert("값을 입력해 주세요.");
	    frm.password.focus(); 
	    return false;
	    
	  } else if(frm.email.value == ""){
		  alert("값을 입력해 주세요.");
		  frm.email.focus(); 
		  return false;
	
	  }else if($('#emessage').html() !='<font color="green">사용 가능</font>'){		  
		   /* alert($('#emessage').html()); */
		  /* alert("이메일을 다시 확인해주세요."); */
		  alert('1');
		  frm.email.focus(); 
		  return false;	
		  
	  } else if($('#idmessage').html() !='<font color="green">사용 가능</font>'){
		 /*  alert("아이디를 다시 확인해주세요."); */
		 /* alert($('#idmessage').html()) */
		  alert('2');
		  frm.id.focus(); 
		  return false;	
		  
	  }else{		 
		  $('#frm').submit();			  
		  parent.document.location.reload(); 
	  }	      
}
</script> 
 
<!--   -->
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
