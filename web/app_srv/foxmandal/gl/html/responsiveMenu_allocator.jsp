<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
<head>
    

<script>

function decisionOnUploaded()
{
    var goifokay = "/ICMR/decisionOnUploaded.do";
      window.location = goifokay;
}

 function logout()
  {
  var log=confirm("Do You Really Want to Logout");
  if(log==true)
     window.location.href="/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
   }
   function showMessage() 
   {
   alert('Right Now this Functionality is not available for you');
   }
</script>
<%
  String strUserType = "";
  if(session.getAttribute("userInfo")!=null)
    strUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
%>
<title>New Page 1</title>

</head>
<body>
 <nav class="inline menu padded">
<ul id="qm0">
<li>
  <%if(strUserType.length() >1)
  {
  %>
  <a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a>
  <%}
else
{
%>
<a href="/ICMR/allocatorPage.do">User Home</a>
<%}%>
  </li>
	<li class="menu"><a class="qmparent" href="javascript:void(0)">Add/Edit</a>
		<ul>
                       <li><a href="/ICMR/app_srv/icmr/gl/jsp/deleteProposal.jsp" target="_blank">Delete Duplicate Proposal</a></li> 
                <li><a href="/ICMR/abstractsubmission.do?hmode=Advertisement">Call for Advertisement</a></li>
                <li><a href="/ICMR/abstractsubmission.do?hmode=Document">Add/Edit Document Details </a></li>
                <li><a href="/ICMR/MasterForm.do?formName=Broad_Area_master">Broad  Area </a></li>
                <li><a href="/ICMR/MasterForm.do?formName=major_discipline">Major Discipline</a></li>
		<!--li><a href="javascript:showMessage();">Thematic Area</a></li-->
                <li><a href="/ICMR/MasterForm.do?formName=state_master">States</a></li>
		<!--li><a href="javascript:showMessage();">States</a></li-->
                <li><a href="/ICMR/MasterForm.do?formName=city_master">Cities</a></li>
		<!--li><a href="javascript:showMessage();">Cities</a></li-->
                <!--<li><a href="/ICMR/MasterForm.do?formName=document_type_master">Type of Document</a></li>-->
                <!--li><a href="javascript:showMessage();">Type of Document</a></li-->
                <!---li><a href="/ICMR/addParameterAction.do">Evaluation Parameter</a></li--->
		</ul></li>
	<li class="menu">
                <a class="qmparent" href="javascript:void(0)">User Management</a>
		<ul>
                       <!--<li><a href="/ICMR/registrationAction.do">Register User</a></li> -->
                       <!--li><a href="/ICMR/invExpertAction.do" >Invite Expert</a></li-->
                       <!--li><a href="javascript:showMessage();" >Invite Expert</a></li-->
                       <li><a href="/ICMR/invitePO.do" >Invite Program Officer/Division Head</a></li>
                       <li><a href="/ICMR/invExpertAction.do" >Invite Expert</a></li>
                       <li><a href="/ICMR/sendReminder.do"> PO Registration Status</a></li> 
                       <li><a href="/ICMR/viewpodetails.do" title="Program Officer Details">PO Details</a></li>
                       <li><a href="/ICMR/updatepodetails.do" title="Program Officer Broad Area Updation">Update Broad Area & Major Discipline of PO</a></li>
                       <!--<li><a href="/ICMR/ReportXMLParser?reportName=expertsList" title="Experts List" target="_new">Experts List</a></li>-->
                       <li><a href="/ICMR/registerDG.do?hmode=registerDG">Register DG</a></li>
                      <!-- <li><a href="/ICMR/changeExpertArea.do">Change Expert Area</a></li> -->
                       <li><a href="/ICMR/changeArea.do">Change Broad Area,Major Discipline,Related Discipline </a></li>
                       <li><a href="/ICMR/manageUser.do">Block/Unblock User</a></li>
                       <li><a href="/ICMR/piDetails.do">PI Details</a></li>
                       <li><a href="/ICMR/registrationAction.do?hmode=partialexpertRegister">Expert Partial Registration</a></li>
                       <li><a href="/ICMR/assignmajor.do">Major Discipline-Visibility to PI</a></li>
                       
		</ul>
        </li>
        
      <li class="menu">
                    <a class="qmparent" href="javascript:void(0)">Institute</a>
            <ul>
                    <li><a href="/ICMR/institutemasterAction.do">Add Institute</a></span></li>
                    <li><a href="/ICMR/institutemasterAction.do?hmode=changeinst">Edit Institutes</a></li>
                    <li><a href="/ICMR/institutemasterAction.do?hmode=mergeInst">Merge Institutes</a></li>
                    
           </ul>
      </li>
  
	<li class="menu">
         <a class="qmparent" href="javascript:void(0);">Pre-Proposals</a>
          <ul>
        <li><a  href="/ICMR/allocSubmittedAbstract.do">Pre-Proposals</a></li>
        
                
                </ul>
	<li class="menu">
        <a class="qmparent" href="javascript:void(0);">Proposal</a>
		<ul>
                <li><a href="/ICMR/NewProposalList.do">Full Proposals</a></li>
                 		
                <!--li><a href="/ICMR/ReviewedPropList.do">Reviewed proposals</a></li-->
		<!---li><a href="javascript:void(0);">Minutes of Meeting</a></li--->
		</ul>
        </li>
        <li class="menu">
	 <a class="qmparent" href="javascript:void(0);">Reports</a>
		<ul>
                <li><a href="/ICMR/jasperReport.do">Concept/Detailed Proposals</a></li>
                <li><a href="/ICMR/expertReport.do">Experts/PO Monitoring</a></li>
                <li><a href="/ICMR/InstDtlReport.do">Institutes List</a></li>
		<li><a href="/ICMR/viewExpertsList.do" title="Experts List">Experts List</a></li>
                <li> <a href="/ICMR/stateCityReport.do">State/City-wise Pre-proposals Status</a></li>
                <li> <a href="/ICMR/stateCityFullPropReport.do">State/City-wise Full-Proposals Status</a></li>
                </ul>
        </li>
	<li class="menu">
        <a class="qmparent" href="javascript:void(0);">Project</a>
		<ul>
		<li><a href="/ICMR/OnGoingProjects.do">View Ongoing</a></li>
                <!--li><a href="/ICMR/ongoingProjectList.do">View Ongoing</a></li-->
    	        <li><a href="javascript:showMessage();">Edit Project Cost</a></li>
                <!--li><a href="/ICMR/costeditprsg.do">Edit Project Cost</a></li-->
                <!---<li><a href="/ICMR/docReport.do">View Document Report</a></li> --->
                <li><a href="javascript:showMessage();">Close Project</a></li>
                <!--li><a href="/ICMR/closeProjectList.do">Close Project</a></li-->
                <li><a href="javascript:showMessage();">View Close Project</a></li>
                <!--li><a href="/ICMR/viewcloseProjectList.do">View Close Project</a></li-->
		</ul>
        </li>
           
            <li class="menu">
            <a class="qmparent" href="javascript:void(0);">Personal</a>
		<ul>
                    <li><a href="/ICMR/registrationAction.do?hmode=changepassword"> Change Password </a></li>
                    <!--li><a href="/ICMR/app_srv/icmr/gl/jsp/DownoadPFX.jsp">Download PFX</a></li-->
                    <li><a href="/ICMR/downLoadPFX.do">Download PFX</a></li>
		</ul>
            </li>  
           <li><a href="javascript:logout();">Logout</a></li>
          <li class="qmclear">&nbsp;</li>
                              </ul>
                              </nav>
<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
</body>
</html>