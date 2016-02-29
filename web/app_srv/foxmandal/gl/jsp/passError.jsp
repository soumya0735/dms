<<%@ page contentType="text/html;charset=windows-1252"%>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registered</title>
     <script>
     function get()
 {
    location.href='/ICMR/registrationAction.do';
 }
 
    function getWindow()
 {
 location.href="/ICMR/changePassword.do";
 }
/* if(document.forms[0].usertype.value=="A")
 {
  location.href='/ICMR/allocatorPage.do';
 }
 else if(document.forms[0].usertype.value=="P")
 {
  location.href='/ICMR/proposerPage.do';
 }
  else if(document.forms[0].usertype.value=="E")
 {
  location.href='/ICMR/expertPage.do';
 }
  else if(document.forms[0].usertype.value=="W")
 {
  location.href='/ICMR/workGroupPage.do';
 }
 else
 {
       if(document.forms[0].usertype.value.length>1)
        {
          
          location.href='/ICMR/multipleProfilePage.do';
        }
 }*/
 //}
     </script>
 </head>
  <body background="/ICMR//app_srv/icmr/gl/images/background.jpg">
  <div style=" position :relative; top :100px; align:left;  width:100%; height:50%;">
   <hr width=100% size="15" color="#7dcee7">
  <table width="100%" align="center" bgcolor="silver" height="60%" border="1">
  <tr>
  <td align="center">
  <table width="40%" align="center" bgcolor="#ccffff"  > 
  <tr><td align="center"></td></tr>
    
    
    <center>
    <b>Password has NOT been changed successfully - this maybe due to incorrect original password or mismatch in the new and confirm password fields. </b><br>
   
   </center>
    
    </tr>
    
   <% if(session.getAttribute("userInfo")!=null)
    {%>
    <tr>
    <td align="center"><input type="button" value="Ok" onClick="getWindow()" style="submitbutton"></td>
    </tr>
    <%}else{%>
   
    <tr>
    <td align="center"><input type="button" value="Ok" onClick="get()" style="submitbutton"></td>
    </tr>
    <%}%>
    </table>
    </td>
    </tr>
    </table>
    <center>Copyright &copy; 2008 epps.com,India Limited. All Rights Reserved.</center>
    </div>
    </body>
</html>