<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="${pageContext.request.contextPath}/music/weekList" onclick="w3_close()"	class="w3-padding"><i class="fa fa-music fa-fw w3-margin-right"></i>WeekList</a>
<a href="${pageContext.request.contextPath}/music/wcreate" onclick="w3_close()"	class="w3-padding"><i class="fa fa-music fa-fw w3-margin-right"></i>WeekCreate</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
