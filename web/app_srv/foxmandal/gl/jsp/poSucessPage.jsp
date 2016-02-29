<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <title>untitled</title>
    
     
    
     <%
      String strEmpId="";
      String strStatus="";
      String StrUsertyoe="X";
      if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertyoe=_userinfo.getStrUserType().toString();
      }
      
    
     %>
     <script language="javascript">
     function callfile()
  {
  
   
    var a=document.forms[0].strEmpId.value;

  document.forms[0].method="post";
  document.forms[0].action="/ICMR/invPOAction.do?hmode=getPFXFile&strEmpId="+document.forms[0].strEmpId.value;
  document.forms[0].submit();
  }
     
     
 function get()
 {
    
   window.location.href='/ICMR//app_srv/icmr/gl/jsp/quickpath.jsp';
 }
 
 
 
 function getWindow()
 {
    
   if(document.forms[0].usertype.value=="O")
    {
  window.location.href='/ICMR/pohome.do';
     }
     
     else 
     {
         window.location.href='/ICMR/divisionHeadhome.do';  
     }
     
  }
 
 </script>
  </head>
   <logic:notPresent name="updated">
  <body background="/ICMR/app_srv/icmr/gl/images/background.jpg" onload="callfile()"  >
   </logic:notPresent>
    <logic:present name="updated">
     <body background="/ICMR/app_srv/icmr/gl/images/background.jpg"  >
    </logic:present>
  <html:form  action="/invPOAction.do">
  <div style=" position :relative; top :100px; align:left; width:100%; height:50%;">
   <hr width=100% size="15" color="#7dcee7">
  <table width="100%" align="left" bgcolor="silver" height="60%" border="1">
  <tr>
  <td align="center">
  <table width="70%" align="center" bgcolor="#ccffff"  > 
  <tr><td align="center"></td></tr>
   <tr>
    <td>
   
  
  <logic:present name="updated">
    
        <center>
    <b>User information has been updated successfully! </b><br>
   
   </center>
    </logic:present>
    
  <logic:notPresent name="updated">   
    
   
    <%
    if(session.getAttribute("StrEmpId")!=null)
    {
     strEmpId=session.getAttribute("StrEmpId").toString();
    }
    if(session.getAttribute("Status")!=null)
    {
    strStatus=session.getAttribute("Status").toString();
    }
    %>
   
   
   
   <center> <b>User has been Registered Successfully!!! </b> </center> <br>
   
    <input type="hidden" name="strEmpId" value="<%=strEmpId%>" >
    <div align="center" >
    <font color="Gray" size="2">
    <%=strStatus%>
 <br> 
 if Download doesnt Start Automatically, Then Please <label class="filelinks"  onclick="callfile();">Click Here</label> to Download Your PFX file
</font>
  </div>
   <br
    </logic:notPresent>
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
    <center>Copyright &copy; 2008 . All Rights Reserved.</center>
    </div>
    </html:form>
    </body>
</html>