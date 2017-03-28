

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