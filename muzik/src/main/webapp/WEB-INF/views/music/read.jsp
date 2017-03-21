<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${dto.title} 듣기</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>

	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
	<div class="container-fluid text-center">
		<table class="table">
		<tr>
			<td>
				<img src="${pageContext.request.contextPath}/music/storage/logo.jpg" width="640px" height="240px">
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td> -->
<%-- 				<h3>Rank ${dto.rank} | <span class="text-success">${dto.title}</span>-<span class="text-primary">${dto.artist }</span></h3> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr style="margin-top: -25px;">
			<td>
				<div id="player"></div>
			</td>
		</tr>
		<tr>
			<td>
<%-- 				<input type="button" value="pre" onclick="location.href='./read?weekid=${dto.weekid-1}'" class="btn"> --%>
<%-- 				<input type="button" value="next" onclick="location.href='./read?weekid=${dto.weekid+1}'" class="btn"> --%>
			</td>
		</tr>
		</table>
		
	</div>
	<script type="text/javascript">
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
      var player;
      function onYouTubePlayerAPIReady() {
   
    	  player = new YT.Player('player', {
    	    height: '390',
    	    width: '640',
    	    //videoId: 'X6U6L_l7VEs',
    	    playerVars: { 
    	    	'autoplay': 1, 
    	    	'controls': 2, 
    	    	'playlist': ['${dto.url}']},
    	    	events: {
    	    	      'onReady': onPlayerReady,
    	    	      //'onStateChange': onPlayerStateChange
    	    	    }
    	  });
    	  }
      function onPlayerReady(event) {
          event.target.playVideo();
        }
    </script>
</body>
</html>