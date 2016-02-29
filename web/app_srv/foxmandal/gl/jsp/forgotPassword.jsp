<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html;charset=windows-1252"%>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title> Forgot Password </title>
    <script src="../jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="../jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
     <script src="../jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
<script>
function functionSubmit()
{
    if(document.forgotPassword.userId.value == "" || document.forgotPassword.userId.value == null)
    {
      alert("Please Enter User Id");
      return false;
    }
   //  if(document.forgotPassword.emailId.value == "" || document.forgotPassword.emailId.value == null)
    //{
      //alert("Please Enter Email Id");
     // return false;
    //}
   //document.forgotPassword.submit(); 
  
}


function functionClose()
{

  window.close();
}





</script>
  </head>
  <body  topmargin="0" >
  <form name="forgotPassword" action="forgotPasswordResult.jsp" >
  <p align="left"><br>
			<font face="Verdana" size="2" color="#000080">Please fill in your 
			details to Retrieve Your Passwrod.</font></p>
  <fieldset style="border: 1px solid #00FFFF; padding: 2px;width:98%;">
    <table  align="center" border="0"  >
   
      <tr> 
        <td>
          <font face="verdana" style="font-size: 9pt"><strong style="font-weight: 400">&nbsp; User Id</strong></font><font color="red" style="font-size: 9pt">*</font>
        </td>
        <td><input type="text" id="userId" name="userId" maxlength="25" > </td>
     </tr><br>
   <!--  <tr> 
        <td>
          <font face="verdana" style="font-size: 9pt"><strong style="font-weight: 400">&nbsp; E-mail Id</strong></font><font color="red" style="font-size: 9pt">*</font>
        </td>
        <td><input type="text" id="emailId" name="emailId" maxlength="50" onblur="isEmail(this)"></td>
     </tr> -->
     <input type="HIDDEN" id="status" name="status">
     <tr>
      <td align="center" colspan="2">
        <input type="submit" name="Submit" value="Submit" onclick="return functionSubmit()" >
     &nbsp;
       <input type="button" name="Close" value="Close" onclick="functionClose()">
      </td>
     </tr>
    </table>
        </fieldset>
        
        
         <p align="left">
			<font face="Verdana" size="2" color="Maroon">Your Password will be sent to your registered mail-id.
		</font></p>
  </form>
  </body>
</html>
