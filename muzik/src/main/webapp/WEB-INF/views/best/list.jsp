<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">

$(function(){
	$("#chart1").click(function(){
		location.href="./list?chartType=kpop";
	});
	$("#chart2").click(function(){
		location.href="./list?chartType=pop";
	});
});
$(function(){
	$("#read_Best").click(function(){
		var period=$(this).text();
		var chartType=$(this).data("charttype");
		var bestid=$(this).data("bestid");
		
		alert(period+"_"+chartType);
		if(chartType=="kpop"){			
			$(".modal-title").html("Kpop_LikeBest "+period);
		}else if(chartType=="pop"){
			$(".modal-title").html("Pop_LikeBest "+period);
		}
		$.post("./read",
		        {
					bestid: bestid	 		
		        },		      
		        function(data,status){
		            if(status="success"){
		            	$(".modal-body").html(data);	
		            }else{
		            	alert("오류");
		            }
		            	
		 });
		
		
	});
});

</script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">

</head>

<body>
<br><br><br>
<div class="container ">
<div class="row">
	<div class="col-sm-6 col-sm-offset-3"></div>
	<button type="button" class="btn btn-primary" id="chart1"><i class="fa fa-arrow-right"></i>국내 차트</button>
	<button type="button" class="btn btn-danger" id="chart2">해외 차트</button>
		</div>
		</div>
	<br><br><br>
		<!-- Modal -->
  <div class="modal fade" id="readBest" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <p>오류</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>	
	<div class="container-fluid">
	<div class="row">
	<div class="col-sm-8 col-sm-offset-2 ">
<!-- 	<DIV class="title">국내차트</DIV> -->
	<c:choose>
		<c:when  test="${param.chartType eq 'kpop' }">		
			<h2 class="text-success">>국내 차트</h2>
		</c:when>
		<c:when  test="${param.chartType eq 'pop' && not empty param.chartType }">		
			<h2 class="text-success">>해외 차트</h2>
		</c:when>
	</c:choose>	
		<h6>버튼을 클릭하시면 주 단위 베스트곡을 볼수 있습니다.</h6>
	<c:forEach items="${list}" var="dto"  varStatus="status">
			
		<table class="table table-hover" >
			<tr>
				<td width="300">		
					<c:if test="${status.first}">						
						<a  class="btn btn-default" data-period="${dto.period}"  data-charttype="${dto.chartType}" 
						data-bestid="${dto.bestid}"	id="read_Best" data-toggle="modal" data-target="#readBest">					
							${dto.period} ~  
						</a>
					</c:if>	
					<c:if test="${!status.first}">	
					<a  class="btn btn-default" data-period="${dto.period}"  data-charttype="${dto.chartType}" 
						data-bestid="${dto.bestid}"	id="read_Best" data-toggle="modal" data-target="#readBest">					
							${dto.period} ~ ${list[status.index-1].period-1}
				    </a>
					</c:if>	
				</td>
				
			</tr>
		</table>
	</c:forEach>
	</div>
	</div>
	</div>
	<div class="text-center">
	${paging }
	</div>
	<br>
	<div class="text-center">
 	<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
		<input type='button' class="btn btn-defualt" value='등록'
				onclick="location.href='${pageContext.request.contextPath}/best/create'">
	</c:if>
	</div>
</body>
</html>