<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">

</head>
<body>

	<div class="container">
  <h2>create popBest</h2>
  <form class="form-horizontal" action="./popcreate" method="post">
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="email">Email:</label> -->
<!--       <div class="col-sm-10"> -->
<!--         <input type="email" class="form-control" id="email" placeholder="Enter email"> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="pwd">Password:</label> -->
<!--       <div class="col-sm-10">           -->
<!--         <input type="password" class="form-control" id="pwd" placeholder="Enter password"> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="form-group">         -->
<!--       <div class="col-sm-offset-2 col-sm-10"> -->
<!--         <div class="checkbox"> -->
<!--           <label><input type="checkbox"> Remember me</label> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">생성</button>
      </div>
    </div>
  </form>
</div>

	<div class="panel"></div>
</body>
</html>
