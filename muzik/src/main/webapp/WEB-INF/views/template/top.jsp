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
<script>
	/* 마우스 올라갈때 밑에창 열리면서 글자색 검정->흰색 변환 */
	$(document).ready(function() {
		$("#flip").mouseenter(function() {
			$("#panel").slideToggle(1);
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
			$("#panel").slideToggle(1);
			$("#top_a1").css("color", "black")
			$("#top_a2").css("color", "black")
			$("#top_a3").css("color", "black")
			$("#top_a4").css("color", "black")
			$("#top_a5").css("color", "black")
			$("#top_a6").css("color", "black")
		});
	});
</script>
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
	margin-top: 1px;
	padding: 20px;
	display: none;
	background-color: black !important;
	color: white !important;
	opacity: 0.8 !important;
	width: 100%;
}

/* 마우스 올라갈때 화면색 검정으로 바뀌는 부분 */
#menubar:hover, #flip:hover {
	background-color: black;
	color: white !important;
	opacity: 0.8;
}

/* 큰 제목 부분에 마우스 올라갈때 */
#top_menu li:hover {
	padding-bottom: 0px;
	/* border-bottom: solid 0px white; */
}

/* 큰 제목 부분 */
#top_menu {
	height: 70px;
	padding-bottom: 15px;
	padding-top: 50px;
	color: white !important;
	/* border-bottom: solid 1px white; */
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
	width: 100%;
}

/* 내용부분 여백 설정 */
.main1 {
	margin-top: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#rows').affix({
			offset : {
				top : 2000
			}
		});
	});
</script>
</head>
<body id="myHeader">
	<div id="flip" class="w3-center w3-container ">
		<div class="w3-center w3-container">
			<img src="https://s3.amazonaws.com/lg-vectors/bitmaps/583093/390385.png?logo_version=1">
		</div>
		<div id="menubar" class="w3-center w3-container" data-spy="affix" data-offset-top="43" style="padding-left: 0px; padding-right: 0px;">
			<div class="w3-row w3-xlarge" id="row">
				<ul style="list-style-type: none" id="top_menu">
					<li class="w3-col m2">
						<a id="top_a1" class="top_a" href="#">
							<span class="w3-border-0">item1</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a2" class="top_a" href="#">
							<span class="w3-border-0">item2</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a3" class="top_a" href="#">
							<span class="w3-border-0">item3</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a4" class="top_a" href="#">
							<span class="w3-border-0">item4</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a5" class="top_a" href="${root}/guest/list?col=&word=&nowPage=1">
							<span class="w3-border-0">방명록</span>
						</a>
					</li>
					<li class="w3-col m2">
						<a id="top_a6" class="top_a" href="#">
							<span class="w3-border-0">item5</span>
						</a>
					</li>
				</ul>
			</div>

			<div class="w3-center" id="panel">
				<div class="w3-row m2">
					<ul class="w3-col m2" style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item222</span>
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
					<ul class="w3-col m2" style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item222</span>
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
					<ul class="w3-col m2" style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item222</span>
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
					<ul class="w3-col m2" style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item222</span>
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
					<ul class="w3-col m2" style="list-style-type: none">
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

					<ul class="w3-col m2" style="list-style-type: none">
						<li>
							<a class="w3-text-white" href="#">
								<span class="w3-border-0">item222</span>
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
				</div>
			</div>
		</div>
	</div>

	<div class="main1 container-fluid">