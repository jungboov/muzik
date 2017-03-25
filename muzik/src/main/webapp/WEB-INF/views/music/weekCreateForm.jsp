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

</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
	<DIV class="title">주간차트 등록</DIV>
	<a href="http://gaonchart.co.kr/main/section/chart/online.gaon?nationGbn=T&serviceGbn=ALL&termGbn=week" class="btn btn-link">Gaon !</a>
<div class="container text-center">
	<Form name='frm' method='POST' action='./wcreate'
		onsubmit="return input(this)" class="form-horizontal">
		<div class="col-sm-1"></div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="period">key:</label>
			<div class="col-sm-6">
				<input type="text" name="period" class="form-control" id="period" placeholder="Enter Day (ex: 170215)">
			</div>
		</div>
		<div class="col-sm-1"></div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="url">url:</label>
			<div class="col-sm-6">
				<input type="text" name="url" class="form-control" id="url" placeholder="Enter URL">
			</div>
		</div>
		<div class="col-sm-1"></div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="type">type:</label>
			<div class="col-sm-6">
				<select multiple name="chartType" class="form-control" id="type">
					<option value="kpop">K-Pop</option>
					<option value="pop">Pop</option>
				</select>
			</div>
		</div>
		<DIV class="bottom">
			<input type='submit' value='전송' class="btn btn-success">
		</DIV>
	</Form>
</div>
</body>
</html>
