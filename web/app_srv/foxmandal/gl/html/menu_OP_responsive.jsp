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
  <%if(strUserType.length() >1)
  {
  %>
  <a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a>
  <%}
else
{
%>
<a href="/ICMR/pohome.do">User Home</a>
<%}%>
  </li>
	<li class="menu"><a class="qmparent" href="javascript:void(0)">User Management</a>
		<ul>
                     <li><a href="/ICMR/invExpertAction.do" >Invite Expert</a></li>
                    <li><a href="/ICMR/viewexpertdetails.do" >Proposals Assigned to Expert</a></li>
                   <li><a href="/ICMR/piDetails.do">PI Details</a></li>
                    <li><a href="/ICMR/viewExpertsList.do" title="Experts List">Experts List</a></li>
		</ul>
         </li>
    <li class="menu">
     <a class="qmparent" href="javascript:void(0)">Project</a>
     <ul>
      <li>
       <a href="/ICMR/OnGoingProjects.do">View OnGoing Project</a>
      </li>
     </ul>
    </li>
            <li><a href="/ICMR/invPOAction.do?hmode=updateprofile">Update Profile</a></li>
            
            <li class="menu">
        <a class="qmparent" href="javascript:void(0);">Personal</a>
        <ul>    
        <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li>
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