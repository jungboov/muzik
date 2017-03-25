<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<html xmlns:fb="http://ogp.me/ns/fb#">

<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script> 
  
  
  <meta name="google-signin-client_id" content="369119761072-0de78lhvd8oo7i9b54sg7u44pu6d4v2k.apps.googleusercontent.com">
</head>
<body>
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<!-- 구글 로그인 관련 스크립트 -->

 <script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	 
	  var id= profile.getId();
	  var name= profile.getName();
	  var image= profile.getImageUrl();
	  var email= profile.getEmail();
	  var grade= 'G';
	  
	  $(document).ready(function() {
	  $('input[name=id]').attr('value',id); 
	  $('input[name=name]').attr('value',name); 
	  $('input[name=image]').attr('value',image); 
	  $('input[name=email]').attr('value',email); 
	  $('input[name=grade]').attr('value',grade); 
	});
}
</script> 

<a href="#" onclick="signOut();">Sign out</a>

 <script>
  function signOut() {
	  var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      location.reload(true);
	      console.log('User signed out.');
	    });
  }
  
</script> 

<!-- 페이스북 로그인 관련 스크립트 -->
      <div id="fb-root"></div>
  <script>
        window.fbAsyncInit = function() {
			
			//초기화
			FB.init({
				appId      : '653125614858857', // App ID
				//channelUrl : '//127.0.0.1:8020/rotuebook_html5/WebContent/testCase//FB_channel.html', // Channel File
				status     : true, // check login status
				cookie     : true, // enable cookies to allow the server to access the session
				xfbml      : true  // parse XFBML
			});
			
			// Additional initialization code here
			/*
			FB.ui({ method: 'feed', 
			  message: 'Facebook for Websites is super-cool'
			 });
			*/
			
			//페이지 로드 했을시 호출 
			FB.getLoginStatus(function(response) {
				if (response.status === 'connected') {
					
					FB.api('/me', function(user) {
						if (user) {
							console.log(user.name);			
							
							var image = 'http://graph.facebook.com/' + user.id + '/picture';
							$('input[name=image]').attr('value',image); 
							
							var name = user.name
							$('input[name=name]').attr('value',name); 
							
							var id = user.id
							$('input[name=id]').attr('value',id); 
							
							
							var grade = 'F';
							$('input[name=grade]').attr('value',grade); 
																			
						}
					});			
					
					FB.api('/me', {fields: 'email'}, function(response) {
						$('input[name=email]').attr('value',response.email);						
					});
					
					var uid = response.authResponse.userID;
					var accessToken = response.authResponse.accessToken;
					 console.log(accessToken);
					 
					 
					 
				} else if (response.status === 'not_authorized') {
					// the user is logged in to Facebook, 
					// but has not authenticated your app
				} else {
					// the user isn't logged in to Facebook.
				}				
			});	
		  
        };				
		
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/ko_KR/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
		 //end Load the SDK Asynchronously
		 
      </script>
   <hr>
     
     <p>login 버튼</p>
    <!--HTML Tag --> 
    <!--<div class="fb-login-button">Login with Facebook div</div>-->
    <!--XFBML Tag -->
    <fb:login-button 
    scope="email,user_likes,user_photos" onlogin='window.location.reload(true);'
    show-faces="false" width="200" max-rows="1"></fb:login-button><br>
    <a href="#" id="auth-loginlink" style="float:left; font-size: small;" onclick="FB.login(function() { document.location.reload(); });">[login]</a><br>
    <!-- <a href="#" onclick="FB.login();">[login]</a><br> -->
    <hr>
    
    <p>logout 버튼</p>
    <a href="#" id="auth-logoutlink" style="float:left;font-size: small;" onclick="FB.logout(function() { document.location.reload(); });">[logout]</a><br>
    <!-- <a href="#" onclick="FB.logout();">[logout]</a><br> -->
    <hr>
  

<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/member/create" >
<input type="text" name="id" value="" />
<input type="text" name="name" value="" />
<input type="text" name="image" value="" />
<input type="text" name="email" value="" />
<input type="text" name="grade" value="" />
<input type="text" name="nickname" id="nickname" value="" /><div id="nmessage" style="display:none;"></div>
<input type='button'  class=”close-button”  value='회원가입' onclick="join()"> 
<!-- <input type="submit" value="submit"> -->
</form>  

<script>

$(document).ready(function(){
	$("#nickname").keyup(function(){
		$.ajax({
			url:"./nickname_proc",
			data:({
			nickname: $("input[name=nickname]").val()
			}),
			success: function(data){
				if(jQuery.trim(data)=='YES'){
					$('#nmessage').html("<font color=green>사용 가능</font>");
					$('#nmessage').show();
				}else{
					$('#nmessage').html("<font color=red>사용 불가능</font>");
					$('#nmessage').show();
				}
			}				
			});
		});		
	});


</script>

<script>
function join() {	
	
	if($('#nmessage').html() !='<font color="green">사용 가능</font>'){
		 /*  alert("아이디를 다시 확인해주세요."); */
		 /* alert($('#idmessage').html()) */
		  alert('3');
		  frm.nickname.focus(); 
		  return false;			  
	 }else{		 
		  $('#frm').submit();			  
		  parent.document.location.reload(); 
	 }	 
	
	      
}
</script>  
  
</body>
</html>