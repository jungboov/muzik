<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<!--  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript">
function blist(){
	var url = "list";
	url+="?col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";				
	location.href=url;
}
function bupdate(){
	var url = "${pageContext.request.contextPath}/admin/update";
	url+="?no=${dto.no}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	
	location.href=url; // 이동하는 것 수정누르는 순간 이동한다

}
function bdelete(){
	var url = "${pageContext.request.contextPath}/admin/delete";
	url+="?no=${dto.no}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	
	location.href=url; // 이동하는 것 삭제누르는 순간 이동한다
}
// function breply(){
// 	var url = "reply";
// 	url+="?no=${dto.no}";
// 	url+="&col=${param.col}";
// 	url+="&word=${param.word}";
// 	url+="&nowPage=${param.nowPage}";
// 	location.href=url;
	
// }

// function down(filename){
// 	var url = "${pageContext.request.contextPath }/download";
// 	url+="?dir=/notice/storage";
// 	url+="&filename="+filename;
	
// 	location.href=url;
// }

</script>
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */

.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 40%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 40%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
}
</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">조회</DIV>
 

  <TABLE>
    <TR>
      <TD>${dto.title}</TD>
      <TD>${dto.grade}</TD>
      <TD>${fn:substring(dto.wdate,0, 10)}</TD>
    </TR>
    <TR>
      <TD colspan="3">${dto.content}</TD>
    </TR>
   </TABLE>
  
  <DIV class='bottom'>
  
    <input type='button' value='목록' onclick="blist()">
    <c:if test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
    <input type='button' value='수정' onclick="bupdate()">
    <input type='button' value='삭제' onclick="bdelete()">
    </c:if>
  </DIV>

  <div class="bottom">
  ${paging}
  </div>
 
</body>

</html> 