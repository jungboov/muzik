<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

	<c:set var="guestReplyCount" value="${util:guestReplyCount(guestid,rdao)}" />
<!-- 	댓글 갯수 : -->
	<span style="color: red; size: 15px;"> 댓글번호:&nbsp;[${guestReplyCount}] </span>
