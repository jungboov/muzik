<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>

	<c:when test="${empty sessionScope.id}">
		<c:set var="str">
			Hello! it's party time ^^;;	
		</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">			
			안녕하세요 ${sessionScope.id} 님!<br>
			${sessionScope.grade} 등급<br>
			${sessionScope.nickname} 별명
		</c:set>	
	</c:otherwise>
</c:choose>

<html>

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/home.bpopup.js"/>"></script>


<head>


    <title>Home</title>
<style type="text/css"> 

</head>
<style>
    #element_to_pop_up, #element_to_pop_up1, #element_to_pop_up2, #element_to_pop_up3, #element_to_pop_up4, #element_to_pop_up5 {
        background-color: #fff;
        border-radius: 15px;
        color: #000;
        display: none;
        padding: 20px;
        min-width: 400px;
        min-height: 400px;
    }

    .b-close {
        cursor: pointer;
        position: absolute;
        right: 10px;
        top: 5px;
    }
    iframe{ 
    min-width: 600px;
    min-height: 400px;
    } 
      
    span.button.b-close {
    position: absolute;
    top: 5px;
    right: 8px;
    cursor:pointer;
    }
     
</style>

<body>

  <%--  <input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath }/member/login'">
   <input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/member/create'">
    <input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/member/logout'">
    <input type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath }/member/delete'"> --%>

   
	<!-- Button that triggers the popup  -->

	
	<!-- Element to pop up -->
	<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
	<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
	<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
	<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
		
	
	<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
	<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>
	
<%--	<br><br>
	 <c:choose>
	<c:when test="${empty sessionScope.id}">
	<button id="my-button">로그인</button>
	<button id="my-button1">회원가입</button>		
		<br><br>
	<button id="my-button2">일반회원 로그인</button>
	<button id="my-button3">일반 회원가입</button>	
	</c:when>
	<c:otherwise>
	
	<input type="button" value="회원정보" onclick="location.href='${pageContext.request.contextPath }/member/read'">
	<input type="button" value="회원목록" onclick="location.href='${pageContext.request.contextPath }/admin/list'">
	<input type="button" value="회원정보 수정" onclick="location.href='${pageContext.request.contextPath }/member/update'">
	<button id="my-button4">회원정보</button>
	<button id="my-button5">회원정보 수정</button>	
	<br><br>
	<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/member/logout'">
    <input type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath }/member/delete'">
   	</c:otherwise>
    </c:choose> --%>
    <img src="${pageContext.request.contextPath}/resources/image/ibiza.jpg">
    
  <br><br>
${str}


</body>
</html>
