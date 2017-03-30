<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script type="text/javascript">
	
</script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">

</head>
<body>

	<div class="container">
	<div class="row">
	<div class="col-sm-8 col-sm-offset-4 ">
  <h2>Best 주간 차트 생성</h2>
  <form class="form-horizontal" action="./create" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="period">period:</label>
      <div class="col-sm-10">
        <input type="text" name="period" class="form-control" id="period" style="width: 100px;" placeholder="Enter period">
<!--       	<input type="text" name="title2" class="form-control" id="title2" style="width: 100px;" placeholder="Enter title"> -->
      </div>
    </div>
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
        <button type="submit" class="btn btn-default" style="font-size:20px">생성<i class="material-icons">create_new_folder</i></button>
      </div>
    </div>
  </form>
</div>
</div>
</div>
	<div class="panel"></div>
</body>
</html>
