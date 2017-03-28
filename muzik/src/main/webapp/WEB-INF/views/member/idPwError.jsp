<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:choose>
 	<c:when test="${flag}">YES</c:when>
 	<c:otherwise>NO</c:otherwise> 
 </c:choose> 