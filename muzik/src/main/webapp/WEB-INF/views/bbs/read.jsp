<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="Stylesheet">

<script type="text/javascript">
//댓글관련 javascript 시작//
// no  -> bbsid의 값
// ino -> bbsid의 식별자
// function rcheck(tarea) {
// 	if ('${sessionScope.id}' == "") { 
// 		 if (confirm("로그인후 댓글를 쓰세요")) { 
// 			var url = "read";
// 			url = url + "?no=${dto.bbsid}";
// 			url = url + "&ino=bbsid";
// 			url = url + "&nowPage=${param.nowPage}";
// 			url = url + "&col=${param.col}";
// 			url = url + "&word=${param.word}";
// 			url = url + "&nPage=${nPage}"; 
// 			url = url + "&bflag=../bbs/read";//로그인 하여 read로 이동 
// 			location.href = url;
// 		 } else {
// 			tarea.blur();// 포커스 제거
// 		} 
// 	 } 
// } 

///////////////////////////////////////////////////////////////////////////
$(document).on("click", "#rupdate", function() {
	var rbbsid = $(this).data("rbbsid");
	$("#contentPanel" + rbbsid).hide();
	$("#updatePanel" + rbbsid).show();
});

$(function(){
	$("#rupdateSubmit").click(function(){
		var rbbsid=$(this).data("rbbsid");
		var content=$("#rcontent").val();
		
		$.post("./rupdate",
		        {
					rbbsid: rbbsid,	         
					content: content
		        },		      
		        function(data,status){
		            if(status="success"){
		            	$("#contentPanel" + rbbsid).show();
		            	$("#contentPanel" + rbbsid).html(data);
		            	$("#updatePanel" + rbbsid).hide();
		            }else{
		            	alert("오류");
		            }
		            	
		 });

	});
});

function updateCancel(rbbsid) {
	$("#contentPanel" + rbbsid).show();
	$("#updatePanel" + rbbsid).hide();
}

/*  function updateSubmit(rbbsid){
	var content = $("#updateContent" + rbbsid).val();
	$.post("./rupdate",{
		rbbsid : rbbsid,
		content : content,
	}, function(data, status){
			if(status = "success"){
				$("#contentPanel"+ rbbsid).show();
				$("#contentPanel"+ rbbsid).hide();
				$("#contentPanel"+ rbbsid).html(data);
			}else{
				alert("오류");
			}
	});
}  */


/* $(document).on("click", "#rdelete", function() {
	var rbbsid = $(this).data("rbbsid");
		$.post("./rdelete", {
				rbbsid : rbbsid,
		}, function (data, status) {
				if(status = "success"){
					$("#contentPanel"+ rbbsid).show();
					$("#contentPanel"+ rbbsid).hide();
					$("#contentPanel"+ rbbsid).html(data);
				}else{
					alert("오류");
				}			
		});
}); */

//////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
function input(f) {
	if(f.content.value == ""){
		alert("댓글 내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}

// function rupdate(rbbsid, rcontent) {
// 	var rf = document.fn;
// 	rf.rcontent.value = rcontent;
// 	rf.rbbsid.value = rbbsid;
// 	//rf.rsubmit.value = "수정";
// 	rf.action = "./rupdate"
// }

function rdelete(rbbsid) {
	if (confirm("정말삭제 하겠습니까?")) {
		var url = "./rdelete";
		url = url + "?rbbsid="+rbbsid;
		url = url + "&bbsid=${dto.bbsid}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&nPage=${nPage}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		location.href = url;
	}
}


function blist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}	

function bupdate() {
	var url = "update";
	url += "?bbsid=${dto.bbsid}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

function bdelete(bbsid) {
	if(confirm("삭제하시겠습니까?")){
	var url = "delete";
	url += "?bbsid=${dto.bbsid}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&oldfile=${dto.filename}";
	location.href=url;
	}
}

function down(filename) {
	var url = "${pageContext.request.contextPath}/download";
	url += "?dir=/bbs/storage";
	url += "&filename="+filename;
	location.href = url
}
function readGo(bbsid) {
	var url = "read";
	url += "?bbsid="+bbsid;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
</script>

<style type="text/css">
a{
	color: white;
}
.a{
	color: navy;
}
.position1{padding-right: 0px; width: 60px;}
.position2{padding-right: 20px;width: 120px;}
.position3{width: 58px;padding-right: 0px;}
.position4{width: 46px;}

</style>

</head> 

<body>


<div class="w3-container mainPosition" id="services">
<h2 class="iconPosition"><span class="glyphicon glyphicon-th-list"></span>_게시판</h2>
<hr class="w3-round border-position">
</div> 


 
<div class="container">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
  <TABLE class="table">
    <TR>
      <TH style="width: 61px;">제목</TH>
      <TD colspan="5">${dto.title}</TD>
    </TR>
     
     <TR>
      <TH>닉네임</TH>
      <TD>${dto.viewcnt}</TD>
      <TH class="position1">등록일</TH>
      <TD class="position2">${fn:substring(dto.cdate,0,10)}</TD>
      <TH class="position3">조회수</TH>
      <TD class="position4">${dto.viewcnt}</TD>
     </TR> 
      
     <TR> 
      <TH>내용</TH>
      <TD colspan="5">${dto.content}</TD>
     </TR> 
     
    
    
    <TR> 
      <TH>파일</TH>
      <TD>
      <c:choose>
      <c:when test="${empty dto.filename}">파일없음</c:when>
      <c:otherwise>
       ${dto.filename}(${dto.filesize div 1024}KB) 
      <a class="a" href="javascript:down('${dto.filename}')">
      <span class="glyphicon glyphicon-save"></span>
      </a>
      </c:otherwise>
      </c:choose>
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' class="btn btn-default" value='등록' onclick="location.href='./create'">
    <input type='button' class="btn btn-default" value='목록' onclick="blist()">
    <input type='button' class="btn btn-default" value='수정' onclick="bupdate()">
    <input type='button' class="btn btn-default" value='삭제' onclick="bdelete('${dto.bbsid}')">
  </DIV>
  <br>
<div style="text-align: center;">
<c:set var="noArr" value="${noArr}"/>
<c:forEach var="i" begin="0" end="1">
	<c:choose>
		<c:when test="${noArr[i]>dto.bbsid}">
			<a style="color: black; font-size: 17px; position: static;" href="javascript:readGo('${noArr[i]}')">
			 다음글<span style="font-size: 17px" class="glyphicon glyphicon-triangle-right"></span> 
			 </a>
			 
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${noArr[i]==dto.bbsid}"></c:when>
				<c:otherwise>
				<span style="font-size: 17px" class="glyphicon glyphicon-triangle-left"></span>
				<a style="color: black; font-size: 17px;" href="javascript:readGo('${noArr[i]}')"> 이전글 |</a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
 <hr>
<div class="rcreate">
  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)"><!-- onsubmit="return input(this)" -->
  <textarea style="vertical-align: bottom;" rows="1" cols="95" name="content" ></textarea> <!-- onclick="rcheck(this)" -->
  <input class="btn btn-default btn-sm" type="submit" name="rsubmit" value="등록">
  <input type="hidden" name="bbsid" value="${dto.bbsid}">
  <input type="hidden" name="id" value="CR7">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">           
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="rbbsid" value="0">
  </form>
  </div>

 <hr>
 <form action="./rupdate" name="fn" onsubmit="return input(this)" method="POST">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">           
  <input type="hidden" name="bbsid" value="${dto.bbsid}">
  <input type="hidden" name="id" value="CR7">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="rcontent" value="${param.content}">
  <!-- <input type="hidden" name="rbbsid" value="0"> -->
  
<c:forEach var="rdto" items="${rlist}">
  
  <div id="contentPanel${rdto.rbbsid}">내용: ${rdto.content}</div>
  <div style="display: none;" id="updatePanel${rdto.rbbsid}" >
	  <input style="width: 300px;" id="rcontent" type="text" value="${rdto.content}">
	  <button class="btn btn-default btn-sm" type="submit" id="rupdateSubmit" data-rbbsid='${rdto.rbbsid}'>수정</button>
	  <button class="btn btn-default btn-sm" type="button" onclick="updateCancel('${rdto.rbbsid}')">취소</button>
  </div>
  		<p style="margin-bottom: 0px;">날짜: ${rdto.cdate}</p>
  		<p style="margin-bottom: 0px;">닉네임: ${rdto.cdate}</p>
  		
  		
  		<a style="color: red; padding-left: 490px;" id="rupdate" data-rbbsid='${rdto.rbbsid}'>수정</a>
  		<a style="color: red;" href="javascript:rdelete('${rdto.rbbsid}')">삭제</a>
<hr>  
</c:forEach>
</form>
  
  
  <div class="bottom">
  ${paging}
  </div>

 </div>
 </div>
 </div>
</body>

</html> 
