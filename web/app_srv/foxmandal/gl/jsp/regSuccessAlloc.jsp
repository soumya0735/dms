<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/jscss/home.css">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <title>User Registered</title>
      <jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include>
     <title>User Registered</title>
     <%
      String StrUsertype="X";
      if(session.getAttribute("userInfo")!=null)
      {
      UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
      StrUsertype=_userinfo.getStrUserType().toString();
      }
     %>
 </head>
 <script>
 
 function get()
 {
  
  if(document.forms[0].usrtype.value=="P")
 {
   window.location.href='/ICMR/proposerPage.do';
 }
  else if(document.forms[0].usrtype.value=="E")
 {
  window.location.href='/ICMR/expertPage.do';
 }
   else if(document.forms[0].usrtype.value=="A")
 {
  window.location.href='/ICMR/allocatorPage.do';
 }
  else if(document.forms[0].usrtype.value=="W")
 {
  window.location.href='/ICMR/workGroupPage.do';
 }
 else
 {
        if(document.forms[0].usrtype.value.length>1)
        {
          window.location.href='/ICMR/multipleProfilePage.do';
        }
  
 }
   
  
 }
 </script>
  <body>
  <html:form action="/registrationAction.do">
  <div class="container container2">

 <div class="row">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-header.jsp"></jsp:include> 
        </div>
   <div class="grey_border rounded padded three fifth centered gap-top gap-bottom">   
            <article class="row">
                <div class="whole">
                <center>
                   <b>User Information has been Updated Successfully!!! </b><br>
                  </center>
                </div>
                
                <div class="whole">
                <center>
                  <input type="button" value="Ok" onClick="get()" style="submitbutton">
                  </center>
                </div>
                 <input type="HIDDEN" name="usrtype" value="<%=StrUsertype%>"  />
            </article>
    </div>
<div class="pad-top double">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-footer.jsp"></jsp:include>   
        </div>
    </div>

    </html:form>
     <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
    </body>
</html>