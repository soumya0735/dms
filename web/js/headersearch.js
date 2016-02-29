	
	  // When the document loads do everything inside here ...
	  $(document).ready(function(){
	  
	  	$("#search_button1,#search_option,#book_search").mouseover(function() {
    		$("#search_option").css('display','block');
			//$("#search_option").focus();
 		 }).mouseout(function(){
    		
 		 });
		 $("#search1").focusin(function(){
    		$("#search_option").css('display','block');
                
 		 }).focusout(function(){
    		/*$("#search_option").css('display','none');*/
 		 });
		 
		 

		
		// When a link is clicked
		$("a.tab").click(function () {
			
			
			// switch all tabs off
			$(".active").removeClass("active");
			
			// switch this tab on
			$(this).addClass("active");
			
			// slide all content up
			$(".content").slideUp();
			
			// slide this content up
			var content_show = $(this).attr("title");
			$("#"+content_show).slideDown();
		  
		});
		$("#def_tab").click();
	
	  });
