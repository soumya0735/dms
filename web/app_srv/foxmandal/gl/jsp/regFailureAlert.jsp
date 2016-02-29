<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Error Page</title>
  </head>
  <script>
      function getUpdate()
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
 else
 {
       if(document.forms[0].usertype.value.length>1)
        {
          
          window.location.href='/ICMR/multipleProfilePage.do';
        }
 }
 }</script>
  <%
  System.out.println("inside Errror Page");
  String strParameter="";
   String StrUsertype="";
  String Email="";
  DataEncoder dataEncoder=new DataEncoder();
  if(session.getAttribute("error")!=null)
  {
    strParameter=session.getAttribute("error").toString();
    Email=session.getAttribute("Email").toString();
    Email=dataEncoder.encode(dataEncoder.encode(Email));
  }
         if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertype=_userinfo.getStrUserType().toString();
      }
    System.out.println("strParameter"+strParameter+Email);
  %>
  
  <body>
  <input type="hidden" id="errorcontrol"  value="<%=strParameter%>" />
  <input type="hidden" id="email"  value="<%=Email%>" />
  <input type="HIDDEN" name="usertype" value="<%=StrUsertype%>"  />
   <% if(session.getAttribute("userInfo")==null)
    { if(!strParameter.equals("")) 
  {  
  System.out.println("inside  null"); %>
   <script>
    alert("Data Could not be saved because\n"+document.getElementById("errorcontrol").value);
    location.href="/ICMR/registrationAction.do?hmode=expertRegister&flag=E&uid="+document.getElementById("email").value;
   </script>
   <%}}
   else
   {if(!strParameter.equals("")) 
  {  
  System.out.println("inside not null"); %>
  <script>
    alert("Data Could not be saved because\n"+document.getElementById("errorcontrol").value);
    location.href="/ICMR/registrationAction.do?hmode=partialexpertRegister&flag=E&uid="+document.getElementById("email").value;
   </script>
   <%}}%>
   
   
   
  </body>
</html>