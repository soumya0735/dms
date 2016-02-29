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
	
     <li class="menu">
	 <a class="qmparent" href="javascript:void(0);">Reports</a>
		<ul>
                <li><a href="/ICMR/jasperReport.do">Concept/Detailed Proposals</a></li>
                <li> <a href="/ICMR/stateCityReport.do">State/City-wise Pre-proposals Status</a></li>
                <li> <a href="/ICMR/stateCityFullPropReport.do">State/City-wise Full-Proposals Status</a></li>
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