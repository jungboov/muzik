<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">
		if (f.weekid.value == "") {
			alert("weekid를 입력하세요.");
			f.title.focus();
			return false;
		}
// 		if (f.content.value == "") {
// 			alert("내용을 입력하세요.");
// 			f.content.focus();
// 			return false;
// 		}

	}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
	<DIV class="title">주간차트 등록</DIV>
<div class="container text-center">
	<Form name='frm' method='POST' action='./wcreate'
		onsubmit="return input(this)" class="form-horizontal">
		<div class="col-sm-1"></div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="week">key:</label>
			<div class="col-sm-6">
				<input type="text" name="week" class="form-control" id="week" placeholder="Enter weekid">
			</div>
		</div>
		<DIV class="bottom">
			<input type='submit' value='전송' class="btn btn-success">
		</DIV>
	</Form>
</div>
</body>
</html>
