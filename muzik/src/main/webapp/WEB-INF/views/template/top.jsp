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
<title></title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<!-- Links (sit on top) -->
	<nav class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 공통 -->
				<!-- 홈 게시판 이미지 방명록 -->
				<li><a href="${root}/" class="navbar-brand "><span class="glyphicon glyphicon-home"></span> Home</a></li>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="${root}/guest/list?col=&word=&nowPage=1"><span class="glyphicon glyphicon-list-alt"></span> guest</a></li>
				<li><a href="${root}/mgbook/list?col=&word=&nowPage=1"><span class="glyphicon glyphicon-picture"></span> Mgbook</a></li>
				<li><a href="${root}/guestbook/list?col=&word=&nowPage=1"><span class="glyphicon glyphicon-pencil"></span> Guest Book</a></li>
				<li><a href="${root}/gbook/list?col=&word=&nowPage=1"><span class="glyphicon glyphicon-pencil"></span> Gbook</a></li>

				<!-- 비회원 -->
				<!-- 회원가입 로그인 -->
				<%
					if (id == null) {
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${root}/member/login"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
				<li><a href="${root}/member/agree"><span class="glyphicon glyphicon-user"></span> Join</a></li>
			</ul>
			<!-- 일반회원 -->
			<!-- 내정보(수정 사진변경 탈퇴) 로그아웃 -->
			<%
				} else if (id != null && grade.equals("H")) {
			%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${root}/member/read"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
				<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
			</ul>
			<!-- 관리자 -->
			<!-- 회원목록 로그아웃 -->
			<%
				} else if (id != null && grade.equals("A")) {
			%>
			<li><a href="${root}/admin/list"><span class="glyphicon glyphicon-user"></span> Member List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- 내용 시작 -->
	<div>