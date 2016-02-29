<html>
  <head>
    <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252"></meta>
    <title>DG Menu</title>
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
  <!--<%if(strUserType.length() >1)
  {
  %>
  <a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a>
  <%}
else
{
%> -->
<a href="/ICMR/dghome.do">User Home</a>
<!-- <%}%> -->
  </li>
	<li>
                <a class="qmparent" href="javascript:void(0)">User Management</a>
                <ul>
         <li><a href="/ICMR/invitePO.do" >Invite Program Officer/Division Head</a></li>
         <li><a href="/ICMR/invExpertAction.do" >Invite Expert</a></li>
          <li><a href="/ICMR/viewpodetails.do" title="Program Officer Details">PO Details</a></li>
          <li><a href="/ICMR/manageUser.do">Block/Unblock User</a></li>
           <li><a href="/ICMR/piDetails.do">PI Details</a></li>
           <!-- <li><a href="/ICMR/viewExpert.do">Expert List</a></li>-->
          <li><a href="/ICMR/registrationAction.do?hmode=partialexpertRegister">Expert Partial Registration</a></li>
   </ul>
	</li>	
                    
            
                
             <li>
            <a class="qmparent" href="javascript:void(0);">Personal</a>
		<ul>   
    <li><a href="/ICMR/invPOAction.do?hmode=updateprofileDG">Update Profile</a></li>
                
     <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li>
      <li><a href="/ICMR/downLoadPFX.do">Download PFX</a></li>
      </ul>
          </li>
	<li><a href="javascript:logout();">Logout</a></li>
          

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
	
  
  
  
  
  
  
  </body>
</html>