<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>

<head>

<title>New Page 1</title>
<script type='text/javascript' src="/ICMR/app_srv/icmr/gl/jssrc/quickmenu.js"></script>
<link rel='stylesheet' type='text/css' href="/ICMR/app_srv/icmr/gl/theme/quickmenu_styles.css"/>
</head>

<%
  String strUserType = "";
  String strUserId="";
  if(session.getAttribute("userInfo")!=null)
    strUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
    strUserId=((UserInformation)session.getAttribute("userInfo")).getStrUserID();
%>
<script>
function openPersonelReport() {
var strUserId="<%=strUserId%>";
var str = "/ICMR/PDFReportXMLParser?reportName=piProfile&where_clause1="+strUserId;
     window.open(str, 'child', 'scrollbars,width=500,height=500');     
}

 function logout()
  {
  var log=confirm("Do You Really Want to Logout ?");
  if(log==true)
     location.href="/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
   }
   
   function showMessage() 
   {
   alert('Right Now this Functionality is not available for you');
   }
   function updateInstitute(){
       var str = "/ICMR/app_srv/icmr/mm01/jsp/propMenuUpdateInstitute.jsp";
     window.open(str, 'child', 'scrollbars,width=500,height=500');     
   }
   
</script>


<body>
   
<ul id="qm0" class="qmmc">
	<li>
  <%if(strUserType.length() >1)
  {
  %>
  <a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a>
  <%}
else
{
%>
<a href="/ICMR/proposerPage.do">User Home</a>
<%}%>
  </li>
	<li><a class="qmparent" href="javascript:void(0)">Pre-Proposals</a>
            <ul>
            <li><a href="/ICMR/abstractsubmission.do">New / Edit </a></li>
            <li><a href="/ICMR/abstractList.do">View Submitted Pre-Proposals </a></li>
            </ul>
        </li>

	<li><a class="qmparent" href="javascript:void(0)">Full Proposals</a>

		<ul>
                <!--li><a href="javascript:showMessage();">Submit</a></li-->
		<li><a href="/ICMR/proposalSub.do">Submit</a></li>
		
       <li><a href="/ICMR/proposalList.do">View Submitted Proposals</a></li>
     <!--li><a href="javascript:showMessage();">View Submitted Proposals</a></li-->
   <!-- <li><a href="/ICMR/viewReviewprop.do">View Reviewed Proposal </a></li>  -->
		</ul></li>
    
    
    <li><a class="qmparent" href="javascript:void(0)">Project</a>

		<ul>
		<!--<li><a href="/ICMR/onGoingProject.do">View OnGoing Project</a></li>-->
                <li><a href="javascript:showMessage();">View OnGoing Project</a></li>
		</ul></li>
    
    
    
  <!-- <li><a href="#">View Prsg Meeting</a></li>-->
         <%if(strUserType.equals("PE"))
  {
  %>
	<li><a href="/ICMR/registrationAction.do?hmode=expertupdateprofile">Update Profile</a></li>
        <%}else{%>
        <li><a href="/ICMR/registrationAction.do?hmode=query">Update Profile</a></li>
        <%}%>
    <li>
            <a class="qmparent" href="javascript:void(0);">Personal</a>
		<ul>
                <li><a href="#" onclick="updateInstitute()"> Update Institute</a></li>
                    <li><a href="/ICMR/registrationAction.do?hmode=changepassword"> Change Password </a></li>
                    <!--li><a href="/ICMR/app_srv/icmr/gl/jsp/DownoadPFX.jsp">Download PFX</a></li-->
                    <li><a href="/ICMR/downLoadPFX.do">Download PFX</a></li>
                    <li><a href="javascript:openPersonelReport()">View Profiile</a></li>
		</ul>
            </li>    
	<li><a href="javascript:logout();">Logout</a></li>
        

 <!--  <li><a href="/ICMR/viewPrsgMeeting.do">View Prsg Meeting</a></li>
	<li><a href="/ICMR/registrationAction.do?hmode=query">Update Profile</a></li>
   
	<li><a href="javascript:logout();">Logout</a></li>
       =--> 

 
<li class="qmclear">&nbsp;</li></ul>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
	
	</body>

</html>

