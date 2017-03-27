<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<body>

<!-- top nav -->
<tiles:insertAttribute name="header" />
 
 
 
<!-- content -->
<tiles:insertAttribute name="body" />
 
 
 
<!-- footer -->
<tiles:insertAttribute name="footer" />
 
</body>
</html>
