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
<a href="/ICMR/financePage.do">User Home</a>
</li>
	<li>
                <a  href="javascript:void(0);">Full Proposals</a>
		<ul>
                <li><a  href="/ICMR/PRCRecomProp.do">View PRC Recommended Proposals</a></li>
                <li><a  href="/ICMR/InstallmentPendingProposals.do">Proposals pending for Ist Installment</a></li>
                </ul>
        </li>
        <li>
        <a  href="javascript:void(0);">Projects</a>
        <ul>    
        <li><a href="/ICMR/OnGoingProjects.do">Ongoing Projects</a></li>
        </ul>
        </li>
                    
        <li>
        <a  href="javascript:void(0);">Personal</a>
        <ul>    
    <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li> 
        </ul>
        </li>
        <li><a href="javascript:logout();">Logout</a></li>
          

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>

  </body>
</html>