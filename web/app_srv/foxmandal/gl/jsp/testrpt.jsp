<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <%@ page import="in.cdacnoida.icmr.gl.adaptor.mail_sende"%>


<%@ page import="java.util.*"%>

<% mail_sende mailSender = new mail_sende(); 
 String strEmailId="prabha005@gmail.com";
  String msg="";
  String  subject="";
   msg = " Dear  Your Password has been sent to your E-mail Id : "+strEmailId;
             
            
            subject = "Your TDC Portal test mail";
           
            //String [] strRecipients = {strEmailId};
         
             mailSender.TransferToMailServer(strEmailId,subject,msg);
             %>
    <title>untitled</title>
  </head>
  <body>
  
  <form>
  <input type="submit"  name="b1" value="submit">
  </form>
  </body>
</html>
