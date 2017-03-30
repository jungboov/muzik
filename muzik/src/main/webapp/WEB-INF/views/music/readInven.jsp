<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<script>
$(function(){
	$("#playMyList > span").prepend('<img style="width:14px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/play.png" />');
 	$("#appendInven > span").prepend('<img style="width:16px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/plus.png" />');
 	$("#changeInven > span").prepend('<img style="width:15px;height:15px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/change.png" />');
 	$("#deleteBtn >  span").prepend('<img style="width:14px;height:14px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/minus.png" />');
 	$("#deleteAllBtn > span").prepend('<img style="width:14px;height:14px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/delete.png" />');
});
</script>
<body>
<!--deleteAll Modal -->
<div id="confirmDeleteAll" class="modal" role="dialog" data-backdrop="static" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title text-success">전체 삭제</h4>
      </div>
      <div class="modal-body">
        <p>현재 보고 계신 목록을 지우시려면 '삭제'를 눌러주세요.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-lg" id="deleteAll"  >삭제</button>
        <button type="button" class="btn btn-info btn-lg" id="dclose1">취소</button>
<!--         <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">취소</button> -->
      </div>
    </div>

  </div>
</div>
<!-- deleteSelect Modal -->
<div id="confirmDelete" class="modal" role="dialog" data-backdrop="static" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" id="dclose2" aria-hidden="true">&times;</button>
        <h4 class="modal-title text-success">선택 삭제</h4>
      </div>
      <div class="modal-body">
        <p>선택한 곡을 지우시려면 '삭제'를 눌러주세요.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-lg" id="deleteSelect"  >삭제</button>
        <button type="button" class="btn btn-info btn-lg"  id="dclose2">취소</button>
<!--         <button type="button" class="btn btn-info btn-lg"  data-dismiss="modal">취소</button> -->
      </div>
    </div>

  </div>
</div>

<button type="button" class="btn btn-default" id="playMyList" data-invenid="${invenId}"><span>리스트 듣기</span></button>
<button type="button" class="btn btn-default" id="changeInven" data-invenid="${invenId}" data-title="${title}"><span>이름 변경</span></button>
<button type="button" class="btn btn-default" id="appendInven" data-invenid="${invenId}" data-title="${title}" title="체크한 곡을 목록에 추가"><span>추가</span></button>
<span class="w3-right">	
	<a  id="deleteBtn" class="btn btn-default" data-invenid="${invenId}" data-toggle="modal" href="#confirmDelete"><span class="w3-text-black">선택 삭제</span></a>
	<a  id="deleteAllBtn" class="btn btn-default" data-invenid="${invenId}" data-toggle="modal" href="#confirmDeleteAll"><span class="w3-text-black" >전체 삭제</span></a>
</span>
	<button type="button" class="btn btn-success" id="changeInvenSubmit" style="display: none;" ">변경</button>
	<button type="button" class="btn btn-warning" id="changeInvenCancel" style="display: none;" ">변경 취소</button>
<table class="table table-bordered">
	<tr>
		<th colspan="2">제목</th>
		<th>가수</th>
		<th>앨범</th>
	</tr>
<c:forEach items="${readInven}" var="dto">
	
	<tr>
		<td class="w3-center" id="td_label"><input type="checkbox" class="w3-check" name="deleteSelector"  data-chartid="${dto.chartid }"></td>
		<td>${dto.title }</td>
		<td>${dto.artist}</td>
		<td>${dto.album }</td>
	</tr>
</c:forEach>	
</table>
</body>
</html>