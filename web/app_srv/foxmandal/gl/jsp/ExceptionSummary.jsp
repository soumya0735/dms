<%@ page contentType="text/html;charset=windows-1252"%>

<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  
  <%
  String strParamValue="";
  
 
  
  if(session.getAttribute("userInfo")==null)
  {%>
    <script>
     alert("Your Session has expired");
     location.href="/ICMR/app_srv/icmr/gl/jsp/quickpath.jsp";
    </script>
 <% } else if(request.getParameter("exceptionType")!=null)
       {
        strParamValue=request.getParameter("exceptionType").toString();
        System.out.println(""+strParamValue);
        
         UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
         String usertype=_userinfo.getStrUserType();
       if(strParamValue.equals("file"))
        {  %>
            <script>
            alert("Requested file is not available at server");
            window.close();
            </script>
    
      <%}else if(strParamValue.equals("database"))  
        { %>
            <script>
            alert("Some Error occured during server transaction");
            </script>
      <% }
       else if(strParamValue.equals("page")) 
          { %>
            <script>
            alert("'There is no data to view");
              window.close(self);
            </script>
       <%} %>
       
    
    
    
    
       <script>
       if("<%=usertype%>"=="A")
      location.href="/ICMR/allocatorPage.do";
    else if("<%=usertype%>"=="E")
     location.href="/ICMR/expertPage.do";
    else  
     location.href="/ICMR/proposerPage.do";
    </script>
<%}%>
  </body>
</html>
