<html>
  <head>
    <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252"></meta>
    <title>Prsg Menu</title>
    <script type='text/javascript' src="/ICMR/app_srv/icmr/gl/jssrc/quickmenu.js"></script>
<link rel='stylesheet' type='text/css' href="/ICMR/app_srv/icmr/gl/theme/quickmenu_styles.css"/>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>


<script>
 function logout()
  {
  var log=confirm("Do You Really Want to Logout ?");
  if(log==true)
     window.location.href="/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
  
  
   }
   
   </script>
   
   <%
  String strUserType = "";
  if(session.getAttribute("userInfo")!=null)
    strUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
  
%>
   
   
  </head>
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
<a href="/ICMR/prsgHomePage.do">User Home</a>
<%}%>
  </li>
	<li><a href="/ICMR/viewPrsgMeeting.do">View Prsg Meeting</a></li>

          <!--li><a href="/ICMR/docReport.do">View Document Report</a></li-->
	

		<li><a href="/ICMR/registrationAction.do?hmode=query">Update Profile</a></li>
     <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li>
	<li><a href="javascript:logout();">Logout</a></li>
<li class="qmclear">&nbsp;</li></ul>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
	
  
  
  
  
  
  
  </body>
</html>