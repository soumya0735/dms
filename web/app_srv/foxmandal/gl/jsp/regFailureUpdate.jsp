<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Error Page</title>
  </head>
  <%
  
  String strParameter="";
  String Email="";
  DataEncoder dataEncoder=new DataEncoder();
  if(session.getAttribute("error")!=null)
  {
    strParameter=session.getAttribute("error").toString();
    
  }
    
    
  %>
  
  <body>
  <input type="hidden" id="errorcontrol"  value="<%=strParameter%>" />
  <input type="hidden" id="email"  value="<%=Email%>" />
  <% if(!strParameter.equals("")) 
  {  
  System.out.println("inside not null"); %>
   <script>
    alert("Data Could not be saved because\n"+document.getElementById("errorcontrol").value);
    location.href="/ICMR/registrationAction.do?hmode=query";
   </script>
   <%} %>
   
   
   
  </body>
</html>