<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/checkSecurityPassword.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <% 
    UserInformation _userinfo;
    String strUserId="";
    String strUserType="";
     if(session.getAttribute("userInfo")!=null)
     {
        _userinfo=(UserInformation)session.getAttribute("userInfo");
        strUserId=_userinfo.getStrUserID();
        strUserType=_userinfo.getStrUserType();
     }
    %>
    
   </head> 
   <BODY onload="SettingField()">
    <div class="row padded">
      <fieldset>
      <div class="row">
        <div class="one half centered" id="space">
          <div class="whole bold blue align-center">
            <h4>Download PFX File</h4></div>
     <form name="f1">
     <div class="whole">
            <div class="one half">
             <label class="bold"> Private Key Password : </label>
            </div>
            <div class="one half">
        <input type="password" name="strDocSecurityPass" id="strDocSecurityPass" class="generalTbox" maxlength="50" /><img style="visibility:hidden" src="/ICMR/app_srv/icmr/gl/images/Correct.jpeg" id="rightTick"/>
     </div>
     </div>
        <div class="whole align-center">
     <input type="button" class="button" name="getFile" value="Get PFX File" onclick="getPFXFile()" />
   </div>
    <input  type="hidden" id="strEmpId" name="strEmpId" value="<%=strUserId%>" />
 </form>
    <div id="login" style="display:none;" >
</div>
   <br>
  <div id="loginpopupObject" style="border-width: medium;  border-color: inherit; display:none;top:30%;left:30%;position:absolute;height:25%;width:40%; z-index:1; background-color: White;">
        <br><br>
        <DIV align="center" ><img align="middle"  src="/ICMR/app_srv/icmr/gl/homeimages/indicator.gif" /></div>
        <DIV align="center" > <FONT color="Gray" size="3" >Please Wait.........</font></div>
  </div>
  </div>
  </div>
  </fieldset>
  </div>
    </body>
   </html>
   