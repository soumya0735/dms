<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>   
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import=" java.io.File,java.util.*"%>
<%@ page isELIgnored="false" %>
  <html>
<!-- CSS anf JS for responsive tables -->
<link rel="stylesheet" type="text/css" media="all" href="/ICMR/app_srv/icmr/communication/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="all" href="/ICMR/app_srv/icmr/communication/bootstrap-glyphicons.css">
<link rel="stylesheet" type="text/css" media="all" href="/ICMR/app_srv/icmr/communication/styles.css">
   <script type="text/javascript">
     $(function() {
       $('table').footable();
     });
</script>

  <script>
$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
      });
</script>

<script type="text/javascript">
    $(function() {
      $('table').footable();
    });
</script>

<script>
 $(document).on('click','#Save',function(e){
/* var value = $.trim($('#ProposalSequence').find(":selected").val());
 var usrid=$('#UserId').val();
 var usrFromid=$('#numFromRoleId').val();
 var usrToid=$('#numToRoleId').val();
 var username=$('#UserId').val();*/
 var msg=$('#TextMessage').val();
	/*if (value==0)
	{
		alert("Please select File Number");
	}
	
	else if(usrFromid==0)
		{
		alert("Please select Role for Sending Message");

		}
	else if(usrToid==0)
		{
		alert("Please select Role to Send Message");
		}
	else if(username==0)
		{
		alert("Please select User");
		}*/

		if(msg=='')
		{
			alert("Please enter your message");
		}
	 
	else{

			document.form.action = "/SERB/SaveSentMessgae";
			document.getElementById("form").submit();				
	}
  });

 $(document).on('click','#Reset',function(e){
	 $('#TextMessage').val('');
 });
 </script>


   
 
  </head>
  <body onload="bringData()">
  communication
 <html:form styleId="form" method="post" action="">
 <html:hidden property="numProposalId"></html:hidden>
 <html:hidden property="numToRoleId"></html:hidden>
 <html:hidden property="numToUserId"></html:hidden>
 <html:hidden property="numFromRoleId"></html:hidden>
 
         <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Communication
            </h4>
          </div>
           <div class="whole padded triple">
        
              <div class=" gap-left triple grey_border rounded whole" >
<c:forEach items="${SavedMessageList}" var="l"> 

  <ul class="timeline">
  
  
  
 <c:if test="${l.fromFlag==true}">
   <li><div class="tldate">${l.dtTrDate}</div></li>
   <li>
    <div class="tl-circ"></div>
    <div class="timeline-panel">
     
      <div class="tl-body">
        <p>${l.strMessage}</p>
      </div>
    </div>
  </li>
  </c:if>
  <c:if test="${l.fromFlag==false}">
    <li><div class="tldate">${l.dtTrDate}</div></li>
  
  <li class="timeline-inverted">
    <div class="tl-circ"></div>
    <div class="timeline-panel">
     
      <div class="tl-body">
        <p>${l.strMessage}</p>
      </div>
    </div>
  </li>
  </c:if>
  </ul>          
</c:forEach>


<div class="whole gap-top">
<div class="one half centered">
<div class="one fourth">


<form:label path="strMessage">Message<span class="red"><font size="3">*</font></span></form:label>
        </div>
        <div class="three fourth">
<form:textarea path="strMessage" id="TextMessage"></form:textarea>
        </div>
</div> <!--  end of one half div -->
</div>


     
        
        <div class="whole align-center pad-top pad-bottom">
            

        <input type="button" id="Save" value="Send" class="blue gap-right" name="Save"/><input type="button" value="Reset" id="Reset" class="blue"/>

    
        </div>
      
</div>
            
</div>
<!-- end of grey border-->


</section>
</article>

</html:form>
<!-- scripts-->

  <script src="/SERB/resources/app_srv/serb/gl/jssrc/jquery.easyui.js"></script>
  <script src="/SERB/resources/app_srv/serb/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>
<script>

$('#TextMessage').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[500]']
});


</script>
<!-- <script>
$(document).on('change','#numToRoleId',function(e){
	 // alert("here");
	var fromid = $('#numToRoleId').val();
      
		
			                $.ajax({
			                    type: "POST",
			                    url: "/SERB/getSendUserList",
			                    data: "numToRoleId=" + fromid,
			                    success: function(response) {
			                    	///alert(response.length);			             
			                    	$('#UserId').find('option').remove();
			                    	
			                    	var seloption = "";
		                    		seloption += "<option value='0'>Select User</option>";

			                    	
			                    	for(var i=0;i<response.length;i++)
			                    		{
			                    		//alert(response[i].regMaster.numUserId);
			                    		seloption += "<option value="+response[i].regMaster.numUserId+">"+response[i].regMaster.strFirstName+"</option>";
											}
					                $('#UserId').append(seloption);
			                       	$("#UserId").trigger("liszt:updated");
			                    },
							        });
			                    	
			                    	

});
			    
			          

</script> 

<script>
 function bringData(){
  
				var value = "ADL_F_D";
	       	 $.ajax(
		        {
			        type: "POST",
			        url: "/SERB/GetSubmittedRequestPIDs",
			        data: "requestName=" +value, 
			        success: function(response){
			        	
			        	$('#ProposalSequence').find('option').remove();
			 			var seloption = "<option value='0'>Select File Number</option>";
			 			for(var i = 0; i < response.length; i++)
			 			{
			 				seloption += "<option value='"+response[i].proposalId+"'>"+response[i].filename+"</option>";
			 			}	        
			 			$('#ProposalSequence').append(seloption);
			 			$("#ProposalSequence").trigger("liszt:updated");
			        	
			        	
			         },
			        
			        error: function(e){
			        	alert("Error in posting path here!");
			    	}
		        
		        });
	       	 
	       	 if($('#Duration').val()==0)
	       		 {
	       		$('#Duration').val("");
	       		 }
	       	if($('#Amount').val()==0.0 || $('#Amount').val()==0)
      		 {
      		$('#Amount').val("");
      		 }
				        
	}
 
 </script>-->
<script type="text/javascript" src="/SERB/resources/app_srv/serb/gl/jssrc/charCount.js"></script>
  <script> 
 $(document).ready(function(){	
		$('#TextMessage').val("");
		$("#Remarks").charCount({
			allowed: 250,		
			warning: 10,
			counterText: 'Characters left:  '	
		});
	});

 </script>

  <script src="/SERB/resources/app_srv/serb/gl/jssrc/chosen.jquery.js" type="text/javascript"></script>
  <script type="text/javascript">
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
 
</body>
</html>