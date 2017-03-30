<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">
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

.btn-like{
	border: none;
	background-color: LightGray; 
}
button{
	opacity: 1.0 !important
}
.btn_top {
    position: fixed;
    bottom:3%;
    right:2%;	
    background:url('${pageContext.request.contextPath}/music/storage/small-up.png');
/*     background-image: url("./music/storage/up.png") no-repeat; */
    width:40px;
    height:40px;
}
.menuList{
	padding-top:10px;
	
}
.menulist div span{
	margin:10px;
}
.menuList div span:before {
  content: "";
  position: absolute;
  width: 80%;
  height: 2px;
  bottom: 0;
  left: 10%;
  background-color: #6633ff;
  visibility: hidden;
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transition: all 0.3s ease-in-out 0s;
  transition: all 0.3s ease-in-out 0s;
}
.menuList div{
	border:1px solid black;	
}
.menuList div:first-child{
	border:none;
}
.menuList div span:hover:before{
/* /border-bottom:2px solid blue; */
	visibility: visible;
    -webkit-transform: scaleX(1);
    transform: scaleX(1);
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
//순위변동
 $(document).ready(function(){	
 	$("span.up").before("&#8593;");
 	$("span.up").css("color", "#ff471a");
 	$("span.up").css("font-weight", "bold");
 	$("span.down").before("&#8595;");
 	$("span.down").css("color", "#0066ff");
 	$("span.down").css("font-weight", "bold");
 	$("span.new").css("color", "#d2d22d");
 	$("span.new").css("font-weight", "bold");
 });
 //버튼 이미지 처리
 $(document).ready(function(){	
	 	$("span#btn_play").prepend('<img style="width:14px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/play.png" />');
	 	$("span#btn_check").prepend('<img style="width:14px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/check.png" />');
	 	$("span#btn_add").prepend('<img style="width:16px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/plus.png" />');
	 	$("span#btn_inven").prepend('<img style="width:16px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/inven.png" />');	 	
	 	$("span#btn_close").prepend('<img style="width:16px;height:16px;margin-bottom:0px; margin-right:3px;" src="${pageContext.request.contextPath}/music/storage/close.png" />');
	 	$("#chart1 span:first-child").prepend('<img style="width:16px;height:auto;margin-bottom:0px; margin-right:3px; margin-top:-5px;" src="${pageContext.request.contextPath}/music/storage/this.png" />');
 });
//  //리스트안에 뮤비hover할 때 버튼 이미지 처리
//  $(document).ready(function(){	
// 	 	$("a#playMV").hover(
// 	 		function(){
// 	 			$(this+":nth-child(2)").show();
// 	 		},function(){
// 	 			$(this+":nth-child(2)").hide();
// 	 		}
// 	 	);	
//  });
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
        url+="?period=${weekList[0].period}";
        url+="&chartType=kpop";
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
	$(document).on("click","#addSelect",function(){	
	    if($("input:checkbox:checked").length==0){
	    	alert("선택된 곡이 없습니다.");
	    }else{
	    	$("#titlePanel").show();	   
	    	$("#titlePanel > #myTitle").focus();
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
	    }else if($("#myTitle").val().length < 2){
	    	$("#myTitle").focus();
	    	$("#text_warning").show();
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
			            	$("#showInven1").hide();
			            	$("#showInven2").show();
			            }else{
			            	alert("오류");
			            }
			            	
			 });
	   }
	});	
	$('#myTitle').keyup(function(){
		if ($(this).val().length > 2){
			$("#text_warning").hide();
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
    	$("#appendInven").hide();
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
    	$("#appendInven").show();
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
		            	$("#appendInven").show();
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
			            	//$('#confirmDelete').modal().hide();//modal close
			            	$('#confirmDelete').modal('hide');//modal close
			            }else{
			            	alert("오류");
			            }		            	
			 });
 	    }
});	 
$(document).on("click","#close_backdrop",function(){ 	    	
	$("div.modal-backdrop").hide();
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
//보관함 show()&hide
$(document).ready(function(){
	$(document).on("click","button#closeInven",function(){	
		$("#inventoryPanel").hide();
		$("#showInven1").show();
		$("#showInven2").hide();
	});
	$("#showInven1").click(function(){
		$("#showInven1").hide();
		$("#showInven2").show();
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
	$("#showInven2").click(function(){
		$("#showInven1").show();
		$("#showInven2").hide()
	    $("#inventoryPanel").hide();
		
		        	
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
	var flag="${not empty param.period}";

	$("#scroll_week").change(function(){
		var period=$(this).val();	
		var selected = $(this).find('option:selected');
		var url="./weekList";
		url+="?period="+period;
		if(selected.data("change")=="yes"){		
			location.href=url;
		}else{
			location.reload();
		}
			
	});
});
//top으로 이동 하는 버튼
$(document).ready(function(){
    var $body = $(document.body), //자주 사용하기에 캐시되게 변수에 넣어준다
        $top = '';

    $top=$('<div>') //div 를 만들고 
            .addClass('btn_top') //top className을 주고
            .hide() //처음에는 숨겨둔다
            .click(function(){  // 클릭이 이벤트 할당
                $body.animate({ scrollTop: 0 }); //animation효과로 scollTop=0으로 이동 ==처음 위치로 이동
            })
            .appendTo($body); // body에 top을 넣는다

    //윈도우의 스크롤위치로 위로가기 버튼을 보여줘야기에 핸들러 작성
    $(window).scroll(function(){

        var y = $(this).scrollTop();

        if(y >= 100){
            $top.fadeIn();
        }
        else {
            $top.fadeOut();
        }
    });
});
$(function(){
	$("#chart1").click(function(){
		location.href="./weekList";
	});
	$("#chart2").click(function(){
		location.href="./weekPopList";
	});
});
</script>
</head> 
<body>
<!-- *********************************************** -->
<div id="element_to_pop_up" class="content">
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up1" class="content1">
		회원가입 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up2" class="content2">
		일반 로그인 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up3" class="content3">
		일반 회원가입 창
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up4" class="content4">
		회원정보
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
	<div id="element_to_pop_up5" class="content5">
		닉네임 수정
		<span class="button b-close">
			<span>X</span>
		</span>
	</div>
<!-- *********************************************** -->
<h2 class="iconPosition"><span class="glyphicon glyphicon-music"></span>_차 트</h2>
<hr class="w3-round border-position">
<div class="container ">
<div class="w3-center row menuList w3-xlarge w3-center">
	<div class="col-sm-3"></div>
	<div id="chart1" class="col-sm-3"><span><b>국내 주간</b></span></div>
	<div id="chart2" class="col-sm-3"><span><b>해외 주간</b></span></div>	
</div>
<br><br>
<div class="w3-right">
<!-- 	<label for="sel1">Select list:</label> -->
  	<select class="form-control" id="scroll_week">
    <option data-change='no'>날짜를 선택해주세요.</option>
    <option value="${scroll_week[0]}"
    	<c:if test="${empty param.period}">
    		selected="selected"
    	</c:if>
    >${scroll_week[0]} ~</option>    
    <c:forEach items="${scroll_week}"  varStatus="status" begin="1">
    <option data-change='yes' value="${scroll_week[status.count]}"
    	<c:if test="${param.period==scroll_week[status.count]}">
    		selected="selected"
    	</c:if>
    >${scroll_week[status.count]} ~ ${scroll_week[status.index-1]-1}
	
    </option>
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
          <button type="button" class="close" id="close_backdrop" data-dismiss="modal" aria-hidden="true">&times;</button>
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
          <button type="button" class="btn btn-default" id="close_backdrop" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<form>
	<div >
		<button type="button" class="btn btn-default" id="checkAll1">
			<span id="btn_check">전체선택</span>
		</button>
		<button type="button" class="btn btn-default" id="checkAll2" style="display: none">
			<span id="btn_check">전체해제</span>
		</button>
		<button type="button" class="btn btn-default" id="playSelect">
			<span id="btn_play">듣기</span>
		</button>
		<button type="button" class="btn btn-default" id="addSelect">
			<span id="btn_add">담기</span>
			</button>
		<button type="button" class="btn btn-default" id="showInven1">
			<span id="btn_inven">보관함</span>
		</button>
		<button type="button" class="btn btn-default" id="showInven2" style="display: none;background-color: #e6e6e6">
			<span id="btn_inven">보관함</span>
		</button>
		<button type="button" class="btn btn-default" id="playChart">
			<span id="btn_play" class="w3-center">Top100듣기</span>
		</button>
		
	</div>
	<div id="titlePanel" style="display: none; margin-bottom:5px;">
		<input type="text" id="myTitle" placeholder="Enter ListNmae" class="form-control">
		<p id="text_warning" class="text-danger">2글자이상 입력해주세요<p>
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
		      <a id="playMV" href="./read?chartid=${dto.chartid}"  onClick="window.open(this.href, 'viewMV', 'width=680, height=780'); return false;">
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