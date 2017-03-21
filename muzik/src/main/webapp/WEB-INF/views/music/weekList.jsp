<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
}
.search{
	text-align: center;
  	width: 100%;
	maring: 10px auto;
} 
.tr-inverse{
	background-color: #5b94d1;
  	border-color: #ffffff; 
 	 color:#ffffff;
}
.artist{
	color:#1a75ff;
}
#element_to_pop_up { 
    background-color:#fff;
    border-radius:15px;
    color:#000;
    display:none; 
    padding:20px;
    min-width:800px;
    min-height: 460px;
}
.b-close{
    cursor:pointer;
    position:absolute;
    right:10px;
    top:5px;
}

/*clip:rect(top right bottom left);*/
/* <top> : 위를 기준으로 시작하는 위치 */
/* <right> : 왼쪽을 기준으로 끝나는 위치 */
/* <bottom> : 위를 기준으로 끝나는 위치 */
/* <left> : 왼쪽을 기준으로 시작하는 위치 */
.btn-like{
	border: none;
	background-color: LightGray; 
}
button{
	opacity: 1.0 !important
}

</style>
<!-- js파일 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- link -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/template/images/dh1.jpg" type="image/x-icon" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script type="text/javascript">
function read(chartid){
 	var url="./read";
 	url+="?chartid="+chartid;
	
	location.href=url;
}
//순위변동
 $(document).ready(function(){	
 	$("span.up").before("&#8593;");
 	$("span.up").css("color", "#ff471a");
 	$("span.down").before("&#8595;");
 	$("span.down").css("color", "#0066ff");
 	$("span.new").css("color", "#ffd633");
 });
//체크박스 전체선택
$(document).ready(function(){	
	$('button#checkAll1').click(function(){
		$("input#input_check").prop("checked",true);
		$("button#checkAll1").hide();
		$("button#checkAll2").show();
	});
	$('button#checkAll2').click(function(){
		$("input#input_check").prop("checked",false);
		$("button#checkAll2").hide();
		$("button#checkAll1").show();
	});
// 	  	$("input:checkbox[name='input_check']").attr("checked","checked");
});
//top100듣기
$(document).ready(function(){
	$("#playChart").click(function(){
        var url = "./top100Player";  
        url+="?week=${weekList[0].period}";
        window.open(url,"top100", "width=640,height=410"); 
	});
});
//내 리스트 듣기
	$(document).on("click","#playMyList",function(){		
		var invenId=$(this).data("invenid");
        var url = "./selectPlayer";  
        url+="?invenId="+invenId;
        window.open(url,"child", "width=640,height=410"); 
//         window.open(url,"_blank", "width=640,height=400,status=no,toolbar=no"); 
        //<a onfocus=blur() href="javascript:void(window.open('http://링크주소','win0','width=1024,height=768,status=no,toolbar=no,scrollbars=no'))">메뉴</a>
	});

//선택곡있는지 체크
$(document).ready(function(){	
	$("#addSelect").click(function(){		
	    if($("input:checkbox:checked").length==0){
	    	alert("선택된 곡이 없습니다.");
	    }else{
	    	$("#titlePanel").show();	    	
	    }
	});
});
//선택곡 듣기
$(document).ready(function(){		
	$("#playSelect").click(function(){
		var myList=new Array();
	    var list;	
		
	    $("input[name='input_check']:checkbox:checked").each(function (index){    	
			myList.push($(this).val());
		});
	    list=myList.join(",");
	    
	    if($("input[name='input_check']:checkbox:checked").length==0){
			
	    }else{	
	    	var url = "./playSelect";  
	        url+="?myList="+list;
	        window.open(url,"child", "width=640,height=410");
	        chrome.tabs.update(undefined, {url: 'http://example.com'});
// 			$.post("./playSelect",
// 			        {
// 			          myList: list         			          
// 			        },		      
// 			        function(data,status){
// 			            if(status="success"){
// 			            	$("#titlePanel").hide();
// 			            	$("#inventoryPanel").show();
// 			            	$("#inventoryPanel").html(data);
// 			            }else{
// 			            	alert("오류");
// 			            }
			            	
// 			 });
	   }
	});	
});
//선택곡 담기 & 취소
$(document).ready(function(){	
	$("#addCancel").click(function(){
		$("#titlePanel").hide();
	});
	$("#addSubmit").click(function(){
		var myList=new Array();
	    var list;
	    $("#titlePanel").show();	
		
	    $("input[name='input_check']:checkbox:checked").each(function (index){    	
			myList.push($(this).val());
			//myList[index]=$(this).val();
		});
	    list=myList.join(",");
	    if($("input[name='input_check']:checkbox:checked").length==0){
			$("#titlePanel").hide();
	    }else{	
			$.post("./addSelect",
			        {
			          myList: list,	         
			          invenname: $("#myTitle").val()
			        },		      
			        function(data,status){
			            if(status="success"){
			            	$("#titlePanel").hide();
			            	$("#inventoryPanel").show();
			            	$("#inventoryPanel").html(data);
			            }else{
			            	alert("오류");
			            }
			            	
			 });
	   }
	});	
});
//선택곡을 기존 보관함에 담기 & 취소
$(document).on("click","#appendInven",function(){
		var myList=new Array();
	    var list;	
		
	    $("input[name='input_check']:checkbox:checked").each(function (index){    	
			myList.push($(this).val());
			//myList[index]=$(this).val();
		});	
	    list=myList.join(",");	    
	    if($("input[name='input_check']:checkbox:checked").length==0){
			$("#titlePanel").hide();
	    }else{	

			$.post("./appendInven",
			        {
					  invenId: $(this).data("invenid"),
			          addList: list,	         
			          title: $(this).data("title")
			        },		      
			        function(data,status){
			            if(status="success"){
			            	$("#modalBody").html(data);	
			            }else{
			            	alert("오류");
			            }
			            	
			 });
	   }
});
//Inventory, readInnven(보관함 상세히 보기)
$(document).on("click","a#read_inven",function(){				
    	var invenId=$(this).data("invenid");
    	var invenname=$(this).text();
    	

		$.post("./readInven",
		        {
				  invenId: invenId,
				  invenname: invenname,
		        },		       
		        function(data,status){
		            if(status="success"){
		            	$("#modalHeader").html(invenname+"'s list");
		            	$("#modalBody").html(data);	
		            	//$("#playMyList").data("data-invenId", invenId);
		            }else{
		            	alert("오류");
		            }		            	
		 });
});	
//Inventory, updateInvenTitle - 변경버튼 눌렀을 때
$(document).on("click","#changeInven",function(){	
		var title=$("#changeInven").data("title");
    	$("#modalHeader").hide();
    	$("#changeTitle").show();
    	$("#changeTitle").val(title);
    	$("#changeInvenSubmit").show();
    	$("#changeInvenCancel").show();
    	
    	
    	$("#playMyList").hide();
    	$("#changeInven").hide();
    	$("#deleteBtn").hide();
    	$("a#deleteAllBtn").hide();
    	
});	
//updateInvenTitle - 변경취소
$(document).on("click"," #changeInvenCancel,button[data-dismiss='modal']",function(){				
    	$("#modalHeader").show();
    	$("#changeTitle").hide();
    	$("#changeInvenSubmit").hide();
    	$("#changeInvenCancel").hide();
    	
    	$("#playMyList").show();
    	$("#changeInven").show();
    	$("#deleteBtn").show();
    	$("a#deleteAllBtn").show();
});	
//updateInvenTitle -변경 sumbit
$(document).on("click","#changeInvenSubmit",function(){	
    	var invenId=$("#changeInven").data("invenid");
    	var title=$("#changeInven").data("title");
   		var changeTitle=$("#changeTitle").val();
		$.post("./updateInvenTitle",
		        {
				  invenId: invenId,
				  title: changeTitle
		        },				       
		        function(data,status){		        	
		            if(status="success"){
		            	$("#modalHeader").html(data+"'s list");
		            	
		            	$("#modalHeader").show();
		            	$("#changeTitle").hide();
		            	$("#changeInvenSubmit").hide();
		            	$("#changeInvenCancel").hide();
		            	
		            	$("#playMyList").show();		            	
		            	$("#changeInven").show();
		            	$("#deleteBtn").show();
		            	$("a#deleteAllBtn").show();
		            }else{
		            	alert("오류");
		            }		            	
		 });
});	
//Inventory, deleteInven -선택한 것 제거
$(document).on("click","#deleteSelect",function(){		
	 
		var invenId=$(this).data("invenid");
    	var list=new Array();
    	var chartidList;
		    	
         $("input[name='deleteSelector']:checkbox:checked").each(function (index){    		 
 			list.push($(this).data("chartid"));
 			//myList[index]=$(this).val();
 		});
    	 chartidList=list.join(",");
    	 $('#confirmDelete').modal('hide');//modal close
 	    if($("input[name='deleteSelector']:checkbox:checked").length==0){
 			//$("#confirmDelete").hide();
 	    					
 	    }else{		    
			$.post("./deleteSelect",
			        {
					  invenId: invenId,
					  deleteList: chartidList
			        },		       
			        function(data,status){
			            if(status="success"){			 
			            	$("#modalBody").html(data);	
			            	//$("#playMyList").data("data-invenId", invenId);
			            }else{
			            	alert("오류");
			            }		            	
			 });
 	    }
});	 
//Inventory, deleteAll - 보고있는 리스트 전부 제거
$(document).on("click","#deleteAll",function(){				
		var invenId=$(this).data("invenid");
		var url="./deleteAll";
    	url+="?invenId="+invenId;
    	location.href=url;
});	
//Inventory, deleteAll - modal invenid 전달
$(document).on("click","a[href='#confirmDeleteAll']",function(){		
		var invenid=$(this).data("invenid");
		$("button#deleteAll").attr("data-invenid",invenid);
});	
//Inventory, deleteSelect - modal invenid 전달
$(document).on("click","a[href='#confirmDelete']",function(){		
		var invenid=$(this).data("invenid");
		$("button#deleteSelect").attr("data-invenid",invenid);
});	
//Inventory, 2nd modal close - closeDeleteAll
$(document).on("click","#dclose1",function(){		
		$('#confirmDeleteAll').modal('hide');
});	
//Inventory, 2nd modal close- closeDeleteSelect
$(document).on("click","#dclose2",function(){		
	$('#confirmDelete').modal('hide');
});	
// //Inventory, td_label(td 클릭시 label 효과) 
// $(document).on("click","#td_label",function(){		
// 		var child=$(this).children();
// 		if(child.prop("checked")==false){
// 			child.prop("checked",true);
// 		}else{
// 			child.prop("checked",false);
// 		}		
// });	
// //musiclist, td_label
// $(document).on("click","#week_label",function(){		
// 	var child=$(this).children();
// 	if(child.prop("checked")==false){
// 		child.prop("checked",true);
// 	}else{
// 		child.prop("checked",false);
// 	}
// });
//보관함 show()&hide
$(document).ready(function(){
	$(document).on("click","button#closeInven",function(){	
		$("#inventoryPanel").hide();
	});
	$("#showInven").click(function(){
    	var id="${sessionScope.id}";
		$.post("./inventory",
// 		        {
// 				  id: id		         
// 		        },		      
		        function(data,status){
		            if(status="success"){
		            	$("#titlePanel").hide();
		            	$("#inventoryPanel").show();
		            	$("#inventoryPanel").html(data);
		            }else{
		            	alert("오류");
		            }		            	
		 });
	});
});
//보관함 hide()
$(function(){
	$("button#closeInven").click(function(){
		$("#inventoryPanel").hide();
	});
});
//좋아요 hover event
$(document).ready(function(){	
	$("button#btn_mlike").hover(
			 function() {
				$( this ).children(".odd").css("color","red");
			 }, function() {
				$( this ).children(".odd").css("color","white");					
			 }
		);	
});
//좋아요 ++
$(document).ready(function(){	
	$('button#btn_mlike').click(function(){		 
		var odd=$(this).children(".odd");
		var even=$(this).children(".even");
		var id;
		var btn=$(this);
		var flag=${empty sessionScope.id};
		
		if(flag){		
			if(confirm("로그인해야 이용가능 기능입니다. \n로그인 페이지로 이동하시겠습니까?")){
				//alert("이동 !");
				location.href="${pageContext.request.contextPath}/member/login";	
			}
		}else{
			id="${sessionScope.id}";
			$.post("./updateMlike",
		        {
				  id: id,
		          chartid: $(this).data("chartid"),
		          artist: $(this).data("artist"),
		          title:$(this).data("title")
		        },		      
		        function(data,status){
		        	 
		            if(status="success"){
		            	
		            	even.html(data);
		            	btn.attr("disabled",true)
		            	odd.attr("class","odd w3-text-red w3-large");		            	
		            }else{
		            	alert("오류");
		            }		            
			});
		}
		});	
});
//기간 선택해서 리스트보기
$(function(){
	$("#scroll_week").change(function(){
		var week=$(this).val();
		var url="./weekList";
		url+="?week="+week;
		if($(this).data("change")=='true'){			
			location.href=url;
		}else{
			location.reload();
		}
			
	});
});

</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<div class="container ">
<h3 class="text-center">주간 차트</h3><br>
<div class="w3-right">
<!-- 	<label for="sel1">Select list:</label> -->
  	<select class="form-control" id="scroll_week">
    <option data-change="false">날짜를 선택해주세요.</option>
    <option selected="select">${scroll_week[0]}</option>    
    <c:forEach items="${scroll_week}" var="scroll"  begin="1">
    <option data-change="true">${scroll }</option>
    </c:forEach>
  </select>
</div>
<!-- Modal -->
  <div class="modal" id="readInven" role="dialog" aria-hidden="true" data-backdrop="static">
<!--   <div class="modal" id="readInven" role="dialog" aria-hidden="true" data-backdrop="static"> -->
<!--   <div class="modal fade" id="readInven" role="dialog" aria-hidden="true"> -->
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="modalHeader"></h4>
          <div class="form-group row">     				
          	<div class="col-sm-6">
          		<input type="text" id="changeTitle" class="form-control" maxlength="20" size="20" style="display: none;">
          	</div>	
   		 </div>
        </div>
        <div class="modal-body" >
        <div id="modalBody"></div>
        </div>
        <div class="modal-footer" id="modalFooter">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<form>
	<div>
		<button type="button" class="btn btn-default" id="checkAll1"><span class="">전체선택</span></button>
		<button type="button" class="btn btn-default" id="checkAll2" style="display: none"><span class="">전체해제</span></button>
		<button type="button" class="btn btn-default" id="playSelect"><span class="">듣기</span></button>
		<button type="button" class="btn btn-default" id="addSelect"><span class="">담기</span></button>
		<button type="button" class="btn btn-default" id="showInven"><span class="">보관함</span></button>
		<button type="button" class="btn btn-default" id="playChart"><span class="">Top100듣기</span></button>
		
	</div>
	<div id="titlePanel" style="display: none">
		<input type="text" id="myTitle" placeholder="Enter ListNmae" class="form-control">
		<input type="button" id="addSubmit" class="btn btn-success" value="곡 담기">
		<input type="button" id="addCancel" class="btn btn-danger" value="취소">
	</div>
	<div  class="w3-card-4" id="inventoryPanel" style="display: none">
	</div>
	<div class="table-responsive">
	  <TABLE class="table table-hover ">
			<tr class="tr-inverse">
				<th colspan='3' style="margin: auto;">순위</th>
				
				<th>제목 & 가수</th>
				<th>앨범</th>
				<th>좋아요</th>
			</tr>
	<c:choose>
	<c:when test="${empty weekList}">  
	<%-- <c:when test="${fn:length(albumList)==0}">   --%>
	    <TR>
	      <TD colspan='4'>음원 차트를 가져오지 못했습니다.</TD>
	    </TR>
	</c:when>
	<c:otherwise>
		<c:forEach  var="dto" items="${weekList}" >	
	    <TR>
	      <td class="w3-center"><input type="checkbox" class="w3-check"  title="<${dto.title}> 선택" id="input_check" name="input_check" value="${dto.chartid}"><br></td>
	      <Td class="w3-center "><span class="w3-xlarge"><b>${dto.rank}</b></span><br>(${dto.chRank})</td>
	      <td>
		      <a href="./read?chartid=${dto.chartid}"  onClick="window.open(this.href, 'viewMV', 'width=680, height=780'); return false;">
	<%-- 	      <a rel="shadowbox" href="read?rank=${dto.rank}"  target="_blank"> --%>
		      	<img class="thumb_size w3-card-4 w3-hover-opacity" height="60" width="auto" src="${dto.thumbnail}">
		      </a>
	      </td>
		  <td> ${dto.title}<br><span class="artist">${dto.artist}</span></td>	
	      <TD>${dto.album}</TD>
	      <TD>      	      	
	      <c:set value="${false}" var="flag"/>
	      <c:forEach  var="chartid" items="${checkedLike}" >	      		
	      		<c:if test="${dto.chartid==chartid}">
	      			<button type="button" id="btn_mlike" class="btn btn-warning" title="이미 눌렀습니다!" disabled="disabled" 
      				data-chartid="${dto.chartid}" data-artist="${dto.artist}" data-title="${dto.title}" >
	      			<span class="odd w3-text-red w3-large">&#10084;</span>
	      			<span class="even"> ${dto.mlike}</span>
	      			<c:set value="${true}" var="flag"/>
      				</button>
	      		</c:if>      		     				   				
      	 </c:forEach>
      	 <c:if test="${!flag}">				      			       			 
   				<button type="button" id="btn_mlike" class="btn btn-warning" title="${dto.title} 좋아요!" 
      			data-chartid="${dto.chartid}" data-artist="${dto.artist}" data-title="${dto.title}" >
	      			<span class="odd w3-large">&#10084;</span>
	      			<span class="even"> ${dto.mlike}</span>
      			</button>
		</c:if>      								    		
	      </TD>	      	
	    </TR>
		</c:forEach>  
	</c:otherwise>
	</c:choose>   
	 </table>
	</div>
</form>
</div>
<br>
</body>
</html>