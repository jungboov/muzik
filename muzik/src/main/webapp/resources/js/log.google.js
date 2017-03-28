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
	  
	  $(document).ready(function() {
	  $('input[name=id]').attr('value',id); 
	  $('input[name=name]').attr('value',name); 
	  $('input[name=image]').attr('value',image); 
	  $('input[name=email]').attr('value',email); 
	});
}



function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }