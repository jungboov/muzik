<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">



</head>

<body>

<DIV class="content">
	데이터 베이스 처리 중 오류 발생.<br>
	잠시 후 다시 시도하세요.
</DIV>

  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

</body>
</html> 