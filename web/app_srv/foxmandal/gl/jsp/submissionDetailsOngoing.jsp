<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" %>
<head>
<script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.simplemodal.js" type="text/javascript"></script>
<script src="/ICMR/app_srv/icmr/gl/jscss/basic.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/jscss/basic.css"></link>
<style type="text/css">
 
#noti_Container {
    position:relative;     /* This is crucial for the absolutely positioned element */
    border:0px blue; /* This is just to show you where the container ends */
    width:25px;
    height:25px;
}
.noti_bubble {
    position:absolute;    /* This breaks the div from the normal HTML document. */
    top: -6px;
    right:-6px;
    padding:1px 2px 1px 2px;
    background-color:red; /* you could use a background image if you'd like as well */
    color:white;
    font-weight:bold;
    font-size:0.85em;
 
    /* The following is CSS3, but isn't crucial for this technique to work. */
    /* Keep in mind that if a browser doesn't support CSS3, it's fine! They just won't have rounded borders and won't have a box shadow effect. */
    /* You can always use a background image to produce the same effect if you want to, and you can use both together so browsers without CSS3 still have the rounded/shadow look. */
    border-radius:30px;
    box-shadow:1px 1px 1px gray;
}</style>
   



        <script>
    $(document).ready(function () {
    
        $('.ajax-popup-link').magnificPopup( {
            type : 'iframe'
            
        });
    });
  </script>

</head>

<%
String propID="";
String versionID="";
String sessUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
boolean accessFlag=false;
if(sessUserType.equals("A"))
  accessFlag=true;

System.out.println("sessUserType   "+sessUserType);
if(request.getParameter("strProposalId")!=null)
{
        propID=request.getParameter("strProposalId");
        }
   

if(request.getParameter("strVersionId")!=null)
{
        versionID=request.getParameter("strVersionId");
        }

//For document
 DBQueryManager  _dbq= new DBQueryManager();
 String doc_query="select count(*) from proposer_doc_uploads_details cpud, proposal_doc_required_document cprd where cpud.status='U' and cpud.doc_id=cprd.doc_id and num_proposal_id='"+propID+"'";     
     System.out.println("doc_query   "+doc_query);
      String  al_doc=_dbq.fetchSingleData(doc_query);
      System.out.println("al_doc  "+al_doc);

//

/*start:preparing url*/
    
   String urlForDurationExtension="/ICMR/openProjectDurationExtension.do?strProposalId="+propID+"&strVersionId="+versionID+"&scheme_id="+1;
/*End:preparing url*/

String advanceMenuList="";
advanceMenuList=advanceMenuList+"<a class=\"hyplinks helptext\" target=\"_blank\" style=\"cursor:pointer;\" id="+propID+"/"+versionID+" onclick=\"releaseBudget();\">Release Budget</a>#@@#";
advanceMenuList=advanceMenuList+"<a class=\"hyplinks helptext\" target=\"_blank\" style=\"cursor:pointer;\" onclick=\"monitorBudget('1');\">Modify Budget</a>#@@#";   //todo:change the hardcoded value to the scheme id
advanceMenuList=advanceMenuList+"<a class=\"hyplinks ajax-popup-link helptext\" href="+urlForDurationExtension+" target=\"_blank\" style=\"cursor:pointer;\" >Extend Project Duration</a>#@@#"; //todo:change the hardcoded value to the scheme id
%>








<script type="text/javascript">


function getDocDetails(thefield)
{   
        var _values = thefield.id;
        var usertype=document.getElementById("userType").value;
    
        var abstractID = _values
        var stageID;
        if(usertype=="A")
            stageID='3';
        else 
            stageID='%';
        
         var versionID = 'F1';
        var goifokay = "/ICMR/decisionOnUploaded.do?strAbstractID="+abstractID+"&strVersionID="+versionID+"&stageID="+stageID;
        window.open(goifokay,'Child','dependent=yes,scrollbars=yes,height=500,width=950,top=250,left=150');
        return false;
}

//Added by Vijay Kumar Chauhan
//Module:extend duration of project
//This method is called from child window
function saveDurationToExtend(finalDurationCollectData,finalDurationAnalyzeData,finalDurationInMonths,finalDurationInYears,remarks,mailText,sendMail){

    $("#durationMail").val(mailText);
    $("#sendMail").val(sendMail);
    document.forms[0].finalDurationCollectData.value=finalDurationCollectData;
    document.forms[0].finalDurationAnalyzeData.value=finalDurationAnalyzeData;
    document.forms[0].finalDurationInMonths.value=finalDurationInMonths;
    document.forms[0].finalDurationInYears.value=finalDurationInYears;
    document.forms[0].action="/ICMR/projectDurationExtension.do?hmode=saveDurationToExtend&remarks="+remarks;
    document.forms[0].method="post";
    document.forms[0].submit();
}




   function MonitorBudgetReasonTransfer(url){
    window.location.href=url;
}



function monitorBudget(these){

    var width = window.outerWidth/1.4;
    var height = window.outerHeight/2;
    var left =(window.outerWidth-width)/2;
    var top = (window.outerHeight-height)/2;
    var url="";
    var strProposalId="<%=propID%>";
    var versionID="<%=versionID%>";
    
    var scheme_id=these;
    url="/ICMR/crp_propAction.do?hmode=monitorBudget&strProposalId="+strProposalId+"&strVersionId="+versionID+"&scheme_id="+scheme_id;
    //window.open(url, 'child', 'scrollbars,width=500,height=500');     
   
//    openURLInPopup(url,'600','600');  
    openURLInPopup(url,width,height,left,top);  
    
}



//Added by Vijay Kumar Chauhan
function releaseBudget()
{
//var abstractID=document.forms[0].abstractID.value;
//var versionID=document.forms[0].versionID.value;
    document.forms[0].method = "post";
    //document.forms[0].action ="/ICMR/releaseAction.do?calledFrom=onGoingProjects&strProposalId="+abstractID+"&strVersionId="+versionID;
    document.forms[0].action ="/ICMR/releaseAction.do?calledFrom=onGoingProjects";
    document.forms[0].submit(); 
}

</script>



<form action="" method="post">

<input type="HIDDEN" name="strProposalId" value="<%=propID%>" />
      <input type="HIDDEN" name="strVersionId" value="<%=versionID%>" />
      
      <!--Start:things to update-->
      
      <input type="hidden" name="finalDurationCollectData" />
      <input type="hidden" name="finalDurationAnalyzeData" />
      <input type="hidden" name="finalDurationInMonths" />
      <input type="hidden" name="finalDurationInYears" />
      <!--End:things to update-->
      
      <input type="hidden"  id="sendMail" name="sendMail"/>
      <input type="hidden"  id="durationMail" name="durationMail"/>


</form>


<%if(sessUserType.equals("A")){
System.out.println(" sessUserType ins submission "+sessUserType);
%>
        <div>
        <div class="eight tenth"></div>
        <div class="two tenth">
                             <jsp:include page="/app_srv/icmr/mm06/jsp/advanceMenu.jsp">
                                    <jsp:param name="links" value="<%=advanceMenuList%>"></jsp:param>
                            </jsp:include>
        </div>
                            
           </div>            
<%}%>



<!--Another section : with two include-->    

<fieldset class="fieldset pad-left pad-right">
      <h4>Details of PI(s)</h4>
    
                 
                    <jsp:include page="/app_srv/icmr/mm01/jsp/PI_Details.jsp">
                                <jsp:param name="abstractID" value="<%=propID%>"></jsp:param>
                                <jsp:param name="versionID" value="<%=versionID%>"></jsp:param>
                                <jsp:param name="isInstChangedAllowed" value="no"></jsp:param>
                        </jsp:include>   
                        
                                      <jsp:include page="/app_srv/icmr/mm02/jsp/proposal_details.jsp">
                        <jsp:param name="strAbstractID" value="<%=propID%>"></jsp:param>
                         <jsp:param name="strVersionID" value="<%=versionID%>"></jsp:param>

                       </jsp:include>
</fieldset> 



<!--Another section -->
<fieldset class="fieldset pad-left pad-right">
                        <h4>Institute wise sanctioned budget and remaining budget </h4>     
    
                                       <jsp:include page="/app_srv/icmr/mm02/jsp/view_release_budget.jsp">
                                        <jsp:param name="" value=""></jsp:param>
                                       </jsp:include>
   
  </fieldset> 
  
   <div class="whole pad-left pad-right pad-top">
      <div class="one third"><h4>Required Documents</h4></div>
     <div class="two third" id="noti_Container"  >
             <img src="/ICMR/app_srv/icmr/gl/images/attach-document.jpg" id="<%=propID%>" onclick="getDocDetails(this);" alt="click to see the list of documents" style="height:25px;width:25px;vertical-align:bottom;padding-left:0px;cursor:pointer;" />  
                <div class="noti_bubble"><% if(Integer.parseInt(al_doc)>0){ %> <%=al_doc%>  <%} else {%> <span>0</span> <%}%></div>
            </div> 
            <input type="hidden" name="userType" id="userType" value="<%=sessUserType%>"/>
   </div>
  
     
<!--Another section -->   
<fieldset class="fieldset pad-left pad-right">

        <h4>Project Budget</h4>     
                         <jsp:include page="/app_srv/icmr/mm01/jsp/view_crp_budget.jsp">
                                <jsp:param name="strProposalId" value="<%=propID%>"></jsp:param>
                                <jsp:param name="strVersionId" value="<%=versionID%>"></jsp:param>
                                <jsp:param name="includeHome" value="=no"></jsp:param>
                        </jsp:include>
   </fieldset> 
