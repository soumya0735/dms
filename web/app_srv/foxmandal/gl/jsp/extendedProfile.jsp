<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation"%>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></meta>
  <title>untitled</title>
 </head>
 <body>
  <fieldset>
   <% 
  String sessUserType = "";
  String strUserType = "";
  char [] chUser = null;
  if(session.getAttribute("userInfo")!=null)
    sessUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
 
  if(request.getAttribute("userType")!=null)
    strUserType = request.getAttribute("userType").toString();
  
   if(request.getAttribute("userType")!=null) 
    chUser = strUserType.toCharArray();
    else
    chUser = sessUserType.toCharArray();
  
     
  %>
   <div class="whole tablet">
    <div class="one sixth border-right ">
     <jsp:include page="/app_srv/icmr/gl/jsp/userProfile.jsp"></jsp:include>
    </div>
    <div class="five sixth pad-left pad-top gap-top double ">
     <div class="one half centered ">
      <div class="pad-bottom ">
       <% for(int i=0;i<chUser.length;i++)
  {
    if(chUser[i]=='P')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/proposerPage.do?userType=P"> Proposer </a>
       </div> </div>
       <%
    }
    if(chUser[i]=='A')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/allocatorPage.do?userType=A"> Allocator </a>
       </div> </div>
       <%
    }
    if(chUser[i]=='E')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/expertPage.do?userType=E"> Expert </a>
       </div> </div>
       <%
    }
    if(chUser[i]=='W')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/workGroupPage.do?userType=W"> Working Group&nbsp;Member </a>
       </div>
       <%
    }
    if(chUser[i]=='R')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/prsgHomePage.do?userType=R"> PRSG Member </a>
       </div>
       <%
    }
    if(chUser[i]=='M')
    {
    %>
       <div class="padded info message">
        <i class=" icon-circle-arrow-right blue"></i>
         
        <a href="/ICMR/proposerPage.do?userType=M"> Administrator </a>
       </div> 
       <%
    }
  }
    %>
     
    </div>
  </fieldset>
 </body>
</html>