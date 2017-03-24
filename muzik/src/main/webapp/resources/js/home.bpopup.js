// Semicolon (;) to ensure closing of earlier scripting
          // Encapsulation
          // $ is assigned to jQuery
          ;(function($) {

               // DOM Ready
              $(function() {

                  // Binding a click event
                  // From jQuery v.1.7.0 use .on() instead of .bind()
                  $('#my-button').bind('click', function(e) {
                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content',
                          loadUrl: './member/login',                          
                          onClose: function() {location.reload();}
                      }); 
                                           
                  });       
                  
                 
                  $('#my-button1').bind('click', function(e) {

                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up1').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content1',
                          loadUrl: './member/create',                          
                          onClose: function() {location.reload();}                      	
                      });                      
                  });       
                  
                  $('#my-button2').bind('click', function(e) {

                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up2').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content2',
                          loadUrl: './member/general_login',                          
                          onClose: function() {location.reload();}                      	
                      });                      
                  });   
                  
                  $('#my-button3').bind('click', function(e) {

                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up3').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content3',
                          loadUrl: './member/general_create',                          
                          onClose: function() {location.reload();}                      	
                      });                      
                  });  
                  
                  
                  $('#my-button4').bind('click', function(e) {

                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up4').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content4',
                          loadUrl: './member/read',                          
                          onClose: function() {location.reload();}                      	
                      });                      
                  }); 
                  
                  $('#my-button5').bind('click', function(e) {

                      // Prevents the default action to be triggered. 
                      e.preventDefault();

                    /*   // Triggering bPopup when click event is fired
                      $('#element_to_pop_up').bPopup(); */
                      // Triggering bPopup when click event is fired
                      $('#element_to_pop_up5').bPopup({
                          content: 'iframe', //'ajax', 'iframe' or 'image'
                          contentContainer: '.content5',
                          loadUrl: './member/update',                          
                          onClose: function() {location.reload();}                      	
                      });                      
                  });   
                  
                  
                  
                             
                  
                  
                  /* $('#element_to_pop_up').bPopup({
                      onOpen: function() {
                    	  alert('onOpen fired'); }, 
                      onClose: function() { 
                    	  alert('onClose fired'); }
                  }, 
                  function() {
                      alert('Callback fired');
                  });     */               
            
                                           
       

              });

          })(jQuery); 
          
          
          (function($){
                /*Popup for Details Button*/
               $('#btndetails').bind('click', function(e)
      	          {
                 // Prevents the default action to be triggered. 
       	            e.preventDefault();               
     	              $('#element_to_pop_up').bPopup();
                      var html = $("#element_to_pop_up").html();
                      $("#element_to_pop_up").html(html+ "Some text");
		            });
       		    })(jQuery);     