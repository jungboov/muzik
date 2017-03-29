<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
	<div class="container">
		<div id="player"></div>
	</div>
	<script type="text/javascript">
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      
//       alert("@"+$("#url").text().replace(/(^\s*)|(\s*$)/gi, ""));
      
//       var size=${fn:length(urlList)};
      var urlStr="8pdsQyMm2_4";
//       for(var index=0; index<size; index++){
//     	   urlStr+=",";
//     	   urlStr+=${urlList.get(index)};
//        }
		<c:forEach items="${mysong}" var="url" >
			urlStr+=",";
			urlStr+="${url}";
// 			console.debug("${url}");
		</c:forEach>

      var player;
      function onYouTubePlayerAPIReady() {
   
    	  player = new YT.Player('player', {
    	    height: '290',
    	    width: '400',
    	    //videoId: 'X6U6L_l7VEs',
    	    playerVars: { 
    	    	'autoplay': 1, 
    	    	'controls': 2, 
    	    	'playlist': [urlStr]},   	    	
//    	    	'playsinline': 1,
    	    	'showinfo': 0,
    	    events: {
    	      'onReady': onPlayerReady,
    	      'onStateChange': onPlayerStateChange
    	    }
    	  });
    	  }
  

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          //setTimeout(stopVideo, 6000);
//           done = true;
	
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
</body>
</html>