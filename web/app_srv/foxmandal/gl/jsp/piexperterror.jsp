<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Error Page</title>
  </head>
  <%
  
  String strParameter="";
 
  if(session.getAttribute("error")!=null)
  {
    strParameter=session.getAttribute("error").toString();
    
  }
    
    
  %>
  
  <body>
  <input type="hidden" id="errorcontrol"  value="<%=strParameter%>" />
 
  <% if(!strParameter.equals("")) 
  {  
  System.out.println("inside not null"); %>
   <script>
    alert("Data Could not be saved because\n"+document.getElementById("errorcontrol").value);
    location.href="/ICMR/registrationAction.do?hmode=pitoexpertRegister";
   </script>
   <%} %>
   
   
   
  </body>
</html>