
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- <link rel="shortcut icon" href="http://t1.daumcdn.net/thumb/F32x32ht.u/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmedia%2Fimg-section%2Fsports13%2Flogo%2Fteam%2Fepl%2F1_120120.png%3Fv%3D20160711%27,%20%27F32x32%27)" /> -->
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/storage/ManchesterUnitedLogo.png" type="image/x-icon" /> --%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
	<!-- 상단 메뉴 -->
	<tiles:insertAttribute name="header" />
	<!-- 상단 메뉴 끝 -->

	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 20px;">
		<tiles:insertAttribute name="body" />
		<br>
	</div>
	<!-- 내용 끝 -->

	<!-- 하단 메뉴 시작 -->
	<tiles:insertAttribute name="footer" />
	<!-- 하단 메뉴 끝 -->
</body>
</html>
