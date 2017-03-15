<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

function input(f) {
	if(f.content.value == ""){
		alert("댓글 내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}

function rupdate(rbbsid, rcontent) {
	var f = document.rform;
	f.content.value = rcontent;
	f.rbbsid.value = rbbsid;
	f.rsubmit.value = "수정";
	f.action = "./rupdate"
}

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

</style>

</head> 

<body>


<div class="w3-container mainPosition" id="services">
<h2 class="iconPosition"><span class="glyphicon glyphicon-th-list"></span>_게시판</h2>
<hr class="w3-round border-position">
</div> 


 
<div class="container">
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
  <TABLE class="table table-hover">
    <TR>
      <TH>제목</TH>
      <TD>${dto.title}</TD>
    </TR>
     
     <TR>
      <TH>내용</TH>
      <TD>${dto.content}</TD>
     </TR> 
      
     <TR> 
      <TH>성명</TH>
      <TD>${dto.id}</TD>
     </TR> 
      
     <TR> 
      <TH>조회수</TH>
      <TD>${dto.cdate}</TD>
     </TR> 
      
     <TR> 
      <TH>등록</TH>
      <TD>${fn:substring(dto.cdate,0,10)}</TD>
    </TR>
    
    <TR> 
      <TH>파일명</TH>
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
<c:set var="noArr" value="${noArr}"/>
<c:forEach var="i" begin="0" end="1">
	<c:choose>
		<c:when test="${noArr[i]>dto.bbsid}">
			<a style="color: red;" href="javascript:readGo('${noArr[i]}')">다음글</a>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${noArr[i]==dto.bbsid}"></c:when>
				<c:otherwise>
				<a style="color: red;" href="javascript:readGo('${noArr[i]}')">이전글</a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:forEach>
 <hr>
  <c:forEach var="rdto" items="${rlist}">
  <div class="rlist">
   ${rdto.id}<br/>
   <p>${rdto.content}</p>
   <p style="color: red;">${rdto.cdate}</p>
   <%-- <c:if test="${rdto.id}"> --%>
   <span style="float: right;">
   <a style="color: red;" href="javascript:rupdate('${rdto.rbbsid}','${rdto.content}')">수정</a>|
   <a style="color: red;" href="javascript:rdelete('${rdto.rbbsid}')">삭제</a>
   </span>
   <%-- </c:if> --%>
  </div>
  </c:forEach>
  
  <div class="rcreate">
  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)"><!-- onsubmit="return input(this)" -->
  <textarea rows="1" cols="60" name="content" ></textarea> <!-- onclick="rcheck(this)" -->
  <input type="submit" name="rsubmit" value="등록">
  <input type="hidden" name="bbsid" value="${dto.bbsid}">
  <input type="hidden" name="id" value="CR7">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">           
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="rbbsid" value="0">
  </form>
  </div>
  
  <div class="bottom">
  ${paging}
  </div>
  
 </div>
 </div>
 </div>
</body>

</html> 
