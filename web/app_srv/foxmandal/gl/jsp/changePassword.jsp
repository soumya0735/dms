<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></meta>
    <title>Tdc Change Password</title>
    <script language="javascript" type="text/javascript">
      function savePassword() {

          var old_pass = document.forms[0].passwordold.value;

          var new_pass = document.forms[0].password.value;

          var conf_pass = document.forms[0].confirmpassword.value;

          if (old_pass.length == 0) {
              alert("Old Password should not be Blank.");
              return false;
          }
          if (new_pass.length == 0) {
              alert("New Password should not be Blank.");
              return false;
          }
          if (conf_pass.length == 0) {
              alert("Confirm Password Should not be Blank.");
              return false;
          }

          if (new_pass != conf_pass) {
              alert("Confirm Password is not same as New Password");
              document.forms[0].new_pwd.value = "";
              document.forms[0].con_pwd.value = "";
              return false;
          }
          else {
              document.forms[0].method = "post";

              document.forms[0].action = "/ICMR/registrationAction.do?hmode=changepassUPDATE";

              document.forms[0].submit();

              return true;
          }

      }

      function passspace(theValue) {
          var val1 = theValue.value;
          var len = val1.length;
          for (var i = 0;i < len;i++) {
              if (val1.charAt(i) == " ") {
                  alert("Space not allowed!");
                  theValue.value = "";
                  theValue.focus();
                  return false;
              }
          }
      }
    </script>
  </head>
  <html:form action="/registrationAction.do">
    <div class="row padded">
      <fieldset>
      <div class="row">
        <div class="one half centered" id="space">
          <div class="whole bold blue align-center">
            <h4>Change Password</h4>
          </div>
          <div class="whole pad-bottom">
            <div class="one half">
             <label class="bold"> Old Password 
              <span class="alerttext">*</span></label>
            </div>
            <div class="one half">
              <html:password styleClass="mandatoryTbox" property="passwordold"
                             maxlength="20" styleId="passwordold"
                             onblur="passspace(this)"/>
            </div>
          </div>
          <div class="whole pad-bottom">
            <div class="one half">
            <label class="bold">    New Password 
              <span class="alerttext">*</span></label>
            </div>
            <div class="one half">
              <html:password styleClass="mandatoryTbox" property="password"
                             maxlength="20" styleId="password"
                             onblur="passspace(this)"/>
            </div>
          </div>
          <div class="whole pad-bottom">
            <div class="one half">
             <label class="bold">   Confirm Password 
              <span class="alerttext">*</span></label>
            </div>
            <div class="one half">
              <html:password styleClass="mandatoryTbox"
                             property="confirmpassword" maxlength="20"
                             styleId="confirmpassword"/>
            </div>
          </div>
          <div class="whole align-center">
            <input type="Button" class="button" name="sub"
                    onclick="savePassword()" value="Submit"/>
          </div>
        </div>
        </div>
      </fieldset>
    </div>
  </html:form>
</html>