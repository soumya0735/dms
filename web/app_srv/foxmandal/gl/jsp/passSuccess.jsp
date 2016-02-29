<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registered</title>
     <%
      String StrUsertyoe="X";
      if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertyoe=_userinfo.getStrUserType().toString();
      }
      
    
     %>
 </head>
 <script>
 
 function get()
 {
    
   window.location.href='/ICMR//app_srv/icmr/gl/jsp/quickpath.jsp';
 }
 function getWindow()
 {
 if(document.forms[0].usertype.value=="A")
 {
  window.location.href='/ICMR/allocatorPage.do';
 }
 else if(document.forms[0].usertype.value=="P")
 {
  window.location.href='/ICMR/proposerPage.do';
 }
  else if(document.forms[0].usertype.value=="E")
 {
  window.location.href='/ICMR/expertPage.do';
 }
  else if(document.forms[0].usertype.value=="W")
 {
  window.location.href='/ICMR/workGroupPage.do';
 }
else if(document.forms[0].usertype.value=="O")
 {
  window.location.href='/ICMR/pohome.do';
 }
 
 else if(document.forms[0].usertype.value=="H")
 {
  window.location.href='/ICMR/divisionHeadhome.do';
 }
 
 else if(document.forms[0].usertype.value=="D")
 {
  window.location.href='/ICMR/dghome.do';
 }
 else
 {
    
        if(document.forms[0].usertype.value.length>1)
        {
          
          window.location.href='/ICMR/multipleProfilePage.do';
        }
        
        
  
 }
 
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
   
    <b>User Password has been Changed Successfully!!! </b><br>
   
  
   
  

    </td>
    </tr>
    <input type="HIDDEN" name="usertype" value="<%=StrUsertyoe%>"  />
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
    <center>Copyright &copy; ICMR, All Rights Reserved.</center>
    </div>
    </html:form>
    </body>
</html>