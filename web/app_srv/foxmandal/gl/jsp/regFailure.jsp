<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/jscss/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registration Failure</title>
      <jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include>
      <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
     <%
      String StrUsertyoe="X";
      if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertyoe=_userinfo.getStrUserType().toString();
      }
      
    
     %>
   
     <script>
     function get()
 {
    window.location.href='/ICMR/app_srv/icmr/gl/jsp/quickpath.jsp';
 }
 
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
 }
     </script>
 </head>
 <body>
   <html:form action="/registrationAction.do">
    <div class="container container2">
        <div class="row">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-header.jsp"></jsp:include> 
        </div>
        
        <div class="grey_border rounded padded three fifth centered gap-top gap-bottom">   
            <article class="row">
                     <fieldset>
                            <div class="whole">
                                <logic:present name="updateprofile">
                                <center>
                                <b>User Information has not been updated.</b><br>
                                
                                </center>
                                </logic:present>
                            </div>
                            
                            <div class="whole">
                                    <logic:notPresent name="updateprofile">   
                                    <center>
                                    <b>User has not been Registered. </b><br>
                                    </center>
                                    </logic:notPresent>
                            </div>
                            
                            
                            <div class="whole" align="center">
                                    <% if(session.getAttribute("userInfo")!=null)
                                    {%>
                                              <input type="button" value="Ok" onClick="getUpdate()" class="generalButton blue"/>
                                    <%}else{%>
                                             <input type="button" value="Ok" onClick="get()" class="generalButton blue"/>
                                    <%}%>
                            </div>
                           <input type="HIDDEN" name="usertype" value="<%=StrUsertyoe%>"  />
                           
                           
  
                     </fieldset>
            </article>
        </div>
    </div>
     <div class="pad-top double">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-footer.jsp"></jsp:include>   
        </div>
          </html:form>
  </body>
</html>