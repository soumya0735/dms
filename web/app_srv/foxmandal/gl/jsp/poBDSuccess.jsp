<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registered</title>
     <%
      System.out.println("Inside poBDSuccess");
      String StrUsertype="X";
      if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertype=_userinfo.getStrUserType().toString();
      }
     
     
     
     %>
 </head>
 <script>
 
 function get()
 {
 window.opener.location.reload();
 window.close();
 }
 
 </script>
  <body background="/ICMR//app_srv/icmr/gl/images/background.jpg" >
  <html:form action="/registrationAction.do">
  <div style=" position :relative; top :100px; align:left; width:100%; height:50%;">
   <hr width=100% size="15" color="#7dcee7">
  <table width="100%" align="left" bgcolor="silver" height="60%" border="1">
  <tr>
  <td align="center">
  <table width="40%" align="center" bgcolor="#ccffff"  > 
  <tr><td align="center"></td></tr>
    <tr>
    <td>
    <center>
    <b>Major discipline and broad area of this PO has been updated successfully!!! </b><br>
   
   </center>

    </td>
    </tr>
    
   
    <tr>
    <td align="center"><input type="button" value="Ok" onClick="get()" style="submitbutton"/></td>
    </tr>
   <input type="HIDDEN" name="usrtype" value="<%=StrUsertype%>"  />
   
    
    
    </table>
    </td>
    </tr>
    </table>
    <center>All Rights Reserved.</center>
    </div>
    </html:form>
    </body>
</html>