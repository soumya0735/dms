<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/jscss/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registered</title>
      <jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include>
      <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
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
      <style type="text/css">
            .filelinks
            {
                font-size:10px;	
                font-style: italic;
                text-decoration: underline;
                color:Blue;
                cursor: pointer;
            }
        </style>
 </head>
 <script>
 function callfile()
  {
  document.forms[0].method="post";
  document.forms[0].action="/ICMR/registrationAction.do?hmode=getPFXFile&strEmpId="+document.forms[0].strEmpId.value;
  document.forms[0].submit();
  }
  
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
 else
 {
    
        if(document.forms[0].usertype.value.length>1)
        {
          
          window.location.href='/ICMR/multipleProfilePage.do';
        }
        
        
  
 }
 
 }
 </script>
  <logic:notPresent name="updated">
    <body onload="callfile()" >
  </logic:notPresent>
  <logic:present name="updated">
    <body>
  </logic:present>
  
  <html:form action="/registrationAction.do">
  <div class="container container2">
        <div class="row">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-header.jsp"></jsp:include> 
        </div>
        
        <div class="grey_border rounded padded three fifth centered gap-top gap-bottom">   
            <article class="row">
               
                     <fieldset>
                     
                     <div class="whole">
                    <logic:present name="updated">
                        <center>
                        <b>User Information has been updated Successfully!!! </b><br>
                        </center>
                    </logic:present>
                     </div>
                     
                     <div class="whole">
                                <logic:notPresent name="updated">   
                                <center>
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
                                <b>User has been Registered Successfully!!! </b>
                               </center>
                                <input type="hidden" name="strEmpId" value="<%=strEmpId%>" >
                                <div align="center" >
                                <font color="Gray" size="2">
                                <%=strStatus%>
                             If Download does not Start Automatically, Then Please <label class="filelinks" onclick="callfile()">Click Here</label> to Download Your PFX file
                            </font>
                              </div>
                               <br>
                               </logic:notPresent>
                               <input type="HIDDEN" name="usertype" value="<%=StrUsertyoe%>"  />
                     </div>
                     <div class="whole" align="center">
                            <% if(session.getAttribute("userInfo")!=null)
                            {%>
                            <input type="button" class="generalButton blue" value="Ok" onClick="getWindow()" >
                            <%}else{%>
                            
                            <input type="button" class="generalButton blue"  value="Ok" onClick="get()" >
                            <%}%>
                     </div>
                 
                     </fieldset>
               
            </article>
         </div>
         <div class="pad-top double">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-footer.jsp"></jsp:include>   
        </div>
         
  </div>
        
    </html:form>
   
    </body>
</html>