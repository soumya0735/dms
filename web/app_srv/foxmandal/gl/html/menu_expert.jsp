
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>



<script>
 function logout()
  {
  var log=confirm("Do You Really Want to Logout ?");
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

 <nav class="inline menu padded">
<ul>


	<li>
  <%if(strUserType.length() >1)
  {
  %>
  <a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a>
  <%}
else
{
%>
<a href="/ICMR/expertPage.do">User Home</a>
<%}%>
  </li>
    <li><a class="qmparent"  href="/ICMR/expertAllocatedFull.do">Detailed Proposal(s) </a></li>
                   <li class="menu">
            <a class="qmparent" href="javascript:void(0);">Personal</a>
		<ul>    
     <li><a href="/ICMR/registrationAction.do?hmode=changepassword">Change Password</a></li>
      <li><a href="/ICMR/downLoadPFX.do">Download PFX</a></li>
       <!--<li><a class="qmparent" href="javascript:showMessage();">Update Profile</a></li>-->
       <li><a class="qmparent" href="/ICMR/registrationAction.do?hmode=expertupdateprofile">Update Profile</a></li>
      </ul>
          </li>
        
	<li><a href="javascript:logout();">Logout</a></li>
  

</ul>
</nav>
	




