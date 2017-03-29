<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%

	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

/* a링크 기본글씨색 검정, 밑줄 없음 */
.top_a {
	color: black;
	text-decoration: none;
}

.affix a {
	color: white !important;
	text-decoration: none;
}

/* 밑에창 */
#panel {
	margin-left: -20px;
 	padding-right:20px; 
 	padding-top:25px; 
	padding-bottom: 20px;
	display: none;
	background-color: black !important;
	color: white !important;
	width: 100%;
	z-index: 3;
	position: absolute;
	opacity: 0.8;
}
#panel li{
	padding-top:4px;
}
#menubar{
	font-color:black;
	padding-top:10px;
	padding-bottom:20px;
}
/* 마우스 올라갈때 화면색 검정으로 바뀌는 부분 */
#flip:hover {
	background-color: black;
	color: white ;
		
}

/* 큰 제목 부분에 마우스 올라갈때 */
#top_menu li:hover {
	padding-bottom: 0px;
	/* border-bottom: solid 0px white; */
}

/* 큰 제목 부분 */
#top_menu {
	height: 50px;
	padding-bottom: 15px;
	padding-top: 50px;
/* 	 !important; */
/* 	border-bottom: solid 1px white; */
}

.affix {
	top: 0;
	width: 100%;
	left: 0;
	right: 0;
	z-index: 9999 !important;
	right: 0;
	background-color: black;
	color: white;
	opacity: 0.8;
}

.affix + .container-fluid {
	position: relative;
	/*    top: 50px; */
}

#fix {
	position: fixed;
	overflow: hidden;
	width: 100%;
	top: 0;
}

/* 내용부분 여백 설정 */
.main1 {
	margin-top: 10px;
}
</style>
<script>

/* 마우스 올라갈때 밑에창 열리면서 글자색 검정->흰색 변환 */
$(document).ready(function() {
	$("#flip").mouseenter(function() {
		$("#panel").slideDown(1);
		$("#top_a1").css("color", "white");
		$("#top_a2").css("color", "white");
		$("#top_a3").css("color", "white");
		$("#top_a4").css("color", "white");
		$("#top_a5").css("color", "white");
		$("#top_a6").css("color", "white");
	});
});

/* 마우스 나갈때 밑에창 닫히면서 글자색 흰색->검정 변환 */
$(document).ready(function() {
	$("#flip").mouseleave(function() {
		$("#panel").slideUp(1);
		$("#top_a1").css("color", "black")
		$("#top_a2").css("color", "black")
		$("#top_a3").css("color", "black")
		$("#top_a4").css("color", "black")
		$("#top_a5").css("color", "black")
		$("#top_a6").css("color", "black")
	});
});

$(document).ready(function(){
  if('${sessionScope.id}'!='' && '${sessionScope.grade}'=='A'){
			
		$("#memberlist").show();
	} else{
		$("#memberlist").hide();
	}
});

	
$(document).ready(function() {
	$('#rows').affix({
		offset : {
			top : 2000
		}
	});
});
$(document).ready(function() {
	$('#menubar').hover(function(){
		$('#top_menubar').css("backgroud-color","black");
		$('#panel ').css("color","#d9d9d9");
		$('#panel ').css("margin-left",0);

	});
	$('#top_menu ul li').hover(function(){
		$(this).css("border-bottom","1px solid white");
		

	});
	$("#menubar:hover").hover(function(){
			$("#menubar ").css("background-color","black");
			$("#menubar a").css("color","white");
		},function(){
			$("#menubar span").css("background-color","white");
			$("#menubar a").css("color","black");
		}
	);
});
</script>
</head>
<body id="myHeader">
	<div id="flip" class="w3-center">
		<div class="w3-center w3-container">
			<a  href="${pageContext.request.contextPath}"><img src="https://s3.amazonaws.com/lg-vectors/bitmaps/583093/390385.png?logo_version=1"></a>
		</div>
		<div id="menubar" class="w3-center " data-spy="affix" data-offset-top="43" style="list-style: none;">
			<div class="w3-row w3-xlarge" id="row">
				<ul style="list-style-type: none;" id="top_menu">
					<li class="w3-col m2">
						<a id="top_a1" class="top_a" style="color:black;" href="#" >
							<span class="w3-border-0" >공지사항</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a2" class="top_a" style="color:black;" href="${pageContext.request.contextPath}/music/weekList">
							<span class="w3-border-0">차 트</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a3" class="top_a" style="color:black;" href="${pageContext.request.contextPath}/bbs/list?col=&word=&nowPage=1">
							<span class="w3-border-0">자유게시판</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a4" class="top_a" style="color:black;" href="${pageContext.request.contextPath}/guest/list?col=&word=&nowPage=1">
							<span class="w3-border-0">방명록</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a5" class="top_a" style="color:black;" href="">
							<span class="w3-border-0">고객지원센터</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a6" class="top_a" style="color:black;" href="#">
							<span class="w3-border-0">로그인</span>
						</a>
					</li>
				</ul>
			</div>

			<div class="w3-center " id="panel">
			<ul style="list-style-type: none" id="list_menu">
					<li class="w3-col m2">
						<a id="top_a1" class="top_a" href="#">
							<span class="w3-border-0">공지사항</span>
						</a>
					</li>
					<li class="w3-col m2">
						<ul  style="list-style-type: none;margin-left:-18px" >
							<li>
								<a class="w3-text-white" href="${pageContext.request.contextPath}/music/weekList">
									<span class="w3-border-0">국내차트</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="${pageContext.request.contextPath}/music/weekPopList">
									<span class="w3-border-0">해외차트</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">인기주간</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">item4444</span>
								</a>
							</li>	
						</ul>					
					</li>
					<li class="w3-col m2">
						<ul  style="list-style-type: none;margin-left:-18px">
							<li>
								<a class="w3-text-white" href="${pageContext.request.contextPath}/music/weekList">
									<span class="w3-border-0">국내차트</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="${pageContext.request.contextPath}/music/weekPopList">
									<span class="w3-border-0">해외차트</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">인기주간</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">item4444</span>
								</a>
							</li>	
						</ul>
					</li>
					
					<li class="w3-col m2">
						<ul  style="list-style-type: none">
							<li>
								<a class="w3-text-white" href="${root}/guest/list?col=&word=&nowPage=1">
									<span class="w3-border-0">방명록</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">item333</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">item4444</span>
								</a>
							</li>
							<li>
								<a class="w3-text-white" href="#">
									<span class="w3-border-0">item4444</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="w3-col m2">
						<ul style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="${root}/faq/list">
								<span class="w3-border-0">F a Q</span>
							</a>
						</li>
						<li>
							<a class="w3-text-white" href="${root}/qna/list">
								<span class="w3-border-0">Q n A</span>
							</a>
						</li>
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item4444</span>
							</a>
						</li>
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item4444</span>
							</a>
						</li>

					</ul>
					</li>
					<li class="w3-col m2">
						<ul  style="list-style-type: none">
						
						<c:choose>
							<c:when test="${empty sessionScope.id}">
								<li>
									<a class="w3-text-white" href="#" id="my-button">
										<span class="w3-border-0">F&G 로그인</span>
									</a>
								</li>
								<li>
									<a class="w3-text-white" href="#" id="my-button1">
										<span class="w3-border-0">F&G 회원가입</span>
									</a>
								</li>
								<li>    
									<a class="w3-text-white" href="#" id="my-button2">
										<span class="w3-border-0">일반회원 로그인</span>
									</a>
								</li>
								<li>
									<a class="w3-text-white" href="#" id="my-button3">
										<span class="w3-border-0">일반회원 가입</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>	
									<a class="w3-text-white" href="#" id="my-button4">
										<span class="w3-border-0">회원정보</span>
									</a>
								</li>	
								<li>	
									<a class="w3-text-white" href="#" id="my-button5">
										<span class="w3-border-0">회원정보 수정</span>
									</a>
								</li>
								<li>	
									<a class="w3-text-white" href="${pageContext.request.contextPath }/member/logout">
										<span class="w3-border-0">로그아웃</span>
									</a>
								</li>
								<li>	
									<a class="w3-text-white" href="${pageContext.request.contextPath }/member/delete">
										<span class="w3-border-0">회원탈퇴</span>
									</a>
								</li>													
																					
							</c:otherwise>
						</c:choose>
						        	<li>	
										<a class="w3-text-white" id="memberlist"
										href="${pageContext.request.contextPath }/admin/list">
											<span class="w3-border-0">회원목록</span>
										</a>
									</li>	
									

						</ul>
					</li>
				</ul>			
					
					
					
					
				</div>
			</div>
		</div>
	</div>

	<div class="main1 container-fluid">

