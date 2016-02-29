<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
<head>
    

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
<title>New Page 1</title>

</head>
<body>
 <nav class="inline menu padded">
<ul id="qm0">
        <li>
        <a href="/ICMR/financePage.do">User Home</a>
          </li>
          
	    <li class="menu">
         <a class="qmparent" href="javascript:void(0);">Full Proposals</a>
              <ul>
        <li><a  href="/ICMR/InstallmentPendingProposals.do">Proposals pending for Ist Installment</a></li>
        <li><a  href="/ICMR/PRCRecomProp.do">View PRC Recommended Proposals</a></li>
              </ul>
	    <li class="menu">
        <a class="qmparent" href="javascript:void(0);">Projects</a>
		<ul>
                <li><a href="/ICMR/OnGoingProjects.do">Ongoing Projects</a></li>
		</ul>
        </li>
	   
            <li class="menu">
        <a class="qmparent" href="javascript:void(0);">Personal</a>
        <ul>    
        <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li>
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