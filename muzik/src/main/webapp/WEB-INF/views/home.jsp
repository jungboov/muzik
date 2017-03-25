<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${empty sessionScope.id}">
        <c:set var="str">
            Spring MVC Blog 페이지 입니다.    
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="str">
            안녕 ${sessionScope.id} 님!
        </c:set>    
    </c:otherwise>
</c:choose>

<c:set var="title">My Spring MVC Blog</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
    <c:set var="title">관리자 페이지</c:set>
</c:if>
<html>
<head>
    <title>Home</title>
<style type="text/css"> 

</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
</head>
<body>
<div class= "title"><%-- <%=title %> --%>${title}</div>
    <div class="content"><img src="${pageContext.request.contextPath}" width="50%">
    <h1><%-- <%=str %> --%>${str}</h1>
    <%-- <%if(id==null){    %> --%>
    <c:choose>
    <c:when test="${empty sessionScope.id}">
    <input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath }/member/login'">
    </c:when>
    <c:otherwise>
<%--    <%}else{ %> --%>
    <input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/member/logout'">  
    </c:otherwise>
    </c:choose>
<%--    <%} %> --%>
    <P>  The time on the server is ${serverTime}. </P>
    </div>


</body>
</html>
