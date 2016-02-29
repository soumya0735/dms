<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.mst.MasterDOMParser_tag" %>

<%
response.setHeader("expires","0");
response.setHeader("expires","now");
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Master Page</title>
    <%String strFormName=request.getParameter("formName").toString();%>
  
  </head>
  <body>
  
  <%
  
  System.out.println("strFormName"+strFormName);
  MasterDOMParser_tag _master=new MasterDOMParser_tag();
 
  
 
 // System.out.println("---"+strBuf.toString());
  out.print(_master.creatingContent(request,response,strFormName));
 
  %>

 
  </body>
</html>
