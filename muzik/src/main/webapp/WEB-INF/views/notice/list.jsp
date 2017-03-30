<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	function incheck(f) {
		//f는 매개변수로 form을 가리킨다.
		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
</script>


<script type="text/javascript">
	$(document).ready(function() {
		jQuery(".panel").hide();
		//content 클래스를 가진 div를 표시/숨김(토글)
		$(".flip").click(function() {
			$(".panel").not($(this).next(".panel").slideToggle(500)).slideUp();

		});
	});

	function bupdate(noticeid, nowPage) {

		var allData = {
			"noticeid" : noticeid,
			"nowPage" : nowPage
		};
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/update",
			type : 'GET',
			data : allData,
			success : function(data) {
				$(".panel").html(data);
				jQuery(".flip").hide(data);
			}
		});
	}
</script>

<script type="text/javascript">
	function bdelete(noticeid) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "${pageContext.request.contextPath}/admin/delete";
			url += "?noticeid=" + noticeid;
			url += "&col=${col}";
			url += "&word=${word}";
			url += "&nowPage=${nowPage}";
			location.href = url; // 이동하는 것 삭제누르는 순간 이동한다
		}
	}
</script>
<style type="text/css">
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
.search {
	width: 80%;
	text-align: center;
	margin: 1px auto;
}

#t1 {
	text-align: center;
}

.table1 {
	table-layout: fixed;
	word-break: break-all;
}

/*  table{   */
/*  width: 60%;  */
/*  margin: 0 auto;  */
/*  }  */
/*  tabla, th, td{ */
/*   	border: 0px solid black;  */
/*   	border-collapse: collapse;   */
/*   }   */
/*  th, td{  */
/*  	padding: px;  */
/*  	}  */
</style>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>

</head>
<!-- *********************************************** -->
<body>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">


				<DIV>
					<h2>공지사항</h2>
				</DIV>
				<c:forEach items="${list}" var="dto">
					<div class="flip" id="t1">
						<table width="600" class="table table-hover" id="table">
							<tr>
								<td style="text-align: left;">${dto.title}<c:if
										test="${util:newImg(fn:substring(dto.cdate,0,10)) }">
										<img src="${pageContext.request.contextPath}/images/new.gif">
									</c:if>
								</td>
								<td style="text-align: right; width: 70px;">관리자</td>
								<td style="text-align: right; width: 100px;">${fn:substring(dto.cdate,0, 10)}</td>
							</tr>
						</table>
					</div>


					<div class="panel">
						<TABLE width="600" class="table table-hover">
							<TR>
								<TD colspan="3">${dto.content}

									<DIV class='bottom'>

										<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
											<input type='button' value='수정' class='btn btn-primary'
												onclick="bupdate('${dto.noticeid}','${param.nowPage}')" />


											<input type='button' value='삭제' class="btn btn-danger"
												onclick="bdelete('${dto.noticeid}')">
										</c:if>
									</DIV>
								</TD>
							</TR>
						</TABLE>
					</div>
				</c:forEach>
				<br>
				<div style="text-align: center" class="flip">
					<form method="post" action="./list">
						<select name="col">
							<!-- 검색할 컬럼명 -->
							<option value="title"
								<c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>
							<option value="content"
								<c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
							<option value="total">전체출력</option>
						</select> <input type="text" name="word" value="${word}">
						<!-- 검색어 -->
						<input type="submit" value="검색" class="btn btn-info btn-sm">
						<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
							<button type="button" class="btn btn-info btn-sm"
								data-toggle="modal" data-target="#myModal">글 생성</button>
						</c:if>
					</form>
					<div class="text-center">${paging }</div>
				</div>



			</div>
		</div>
	</div>

	<br>
	<br>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 900px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">공지사항 등록</h4>
				</div>
				<div class="modal-body">

					<FORM name='frm' method='POST' action='./create'
						onsubmit="return incheck(this)" enctype="multipart/form-data">
						<TABLE class="table table-hover">
							<TR>
								<TH>성명</TH>
								<TD class="td1">관리자</TD>
							</TR>
							<TR>
								<TH>제목</TH>
								<TD class="td1"><input type="text" name="title"></TD>
							</TR>
							<TR>
								<TH>내용</TH>
								<TD><textarea rows="10" cols="50" name="content"></textarea>
								</TD>
							</TR>
						</TABLE>

						<div class="modal-footer">
							<input type='submit' class="btn btn-default" value='등록'>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</FORM>
				</div>
			</div>

		</div>
	</div>


</body>
<!-- *********************************************** -->

</html>