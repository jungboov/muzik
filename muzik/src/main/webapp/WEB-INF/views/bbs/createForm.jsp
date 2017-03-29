<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.bpopup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/other.bpopup.js"/>"></script>
<link href="<c:url value='/css/bpopup.css'/>" rel="stylesheet">
<script>
$(document).ready(function() {
    $('#contactForm').bootstrapValidator({
        container: '#messages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            id: {
                validators: {
                    notEmpty: {
                        message: '이름을 입력해주세요.'
                    }
                }
            },
            
           email: {
                validators: {
                    notEmpty: {
                        message: '이메일을 입력해주세요'
                    },
                    emailAddress: {
                        message: '이메일 형식에 맞이 않습니다. 다시한번 확인해주세요.'
                    }
                }
            },
            
            title: {
                validators: {
                    notEmpty: {
                        message: '제목을 입력해주세요.'
                    },
                    stringLength: {
                        max: 100,
                        message: '제목은 100자까지 제한되어 있습니다.'
                    }
                }
            },
            
            content: {
                validators: {
                    notEmpty: {
                        message: '내용을 입력해주세요.'
                    },
                    stringLength: {
                        max: 500,
                        message: '내용은 500자까지 제한되어 있습니다.'
                    }
                }
            },
            
            passwd: {
                validators: {
                    notEmpty: {
                        message: '비밀번호를 입력해주세요.'
                    },
                    stringLength: {
                        max: 15,
                        message: '최소 6자리 까지 입력해주세요.'
                    }
                }
            },
            filename: {
                validators: {
                    notEmpty: {
                        message: '파일을 선택하세요.'
                    },
                    
                }
            }
        }
    });
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
<style type="text/css">
a{
	color: white;
}
</style>
</head> 
<body>

<div id="element_to_pop_up" class="content"><span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up1" class="content1">회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up2" class="content2">일반 로그인 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up3" class="content3">일반 회원가입 창<span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up4" class="content4">회원정보 <span class="button b-close"><span>X</span></span></div>
<div id="element_to_pop_up5" class="content5">닉네임 수정<span class="button b-close"><span>X</span></span></div>

<div class="w3-container mainPosition" id="services">
<h2 class="iconPosition"><span class="glyphicon glyphicon-th-list"></span>_자유게시판</h2>
<hr class="w3-round border-position">
</div> 
 
<FORM name='frm' 
      method='POST' 
      action='./create' 
      enctype="multipart/form-data"
      id="contactForm"
      class="form-horizontal">
      
    <div class="form-group">
        <label class="col-md-3 control-label">제목</label>
        <div class="col-md-6">
            <input type="text" class="form-control" name="title" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">내용</label>
        <div class="col-md-6">
            <textarea class="form-control" name="content" rows="5"></textarea>
        </div>
    </div>
    
        <input type="hidden" class="form-control" name="id" value="${sessionScope.nickname}"/>
>
    <div class="form-group">
        <label class="col-md-3 control-label">파일등록</label>
        <div class="col-md-6">
            <input type="file" class="form-control buttonPadding" name="fileMF"/>
        </div>
    </div>
    
    <!-- #messages is where the messages are placed inside -->
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <button type="submit" class="btn btn-default">등록</button>
            <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
        </div>
    </div>      

</FORM>
</body>
</html> 
