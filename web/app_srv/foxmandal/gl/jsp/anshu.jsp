<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page language="java" import="in.cdacnoida.icmr.gl.adaptor.SendSMTPMailUsingGmail"%>
<%@ page import="java.util.*"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body>Successfull
  <%
 //String emailMsgTxt = "Test Message Contents";
 //String emailSubjectTxt = "A test from gmail";
 //String emailFromAddress = "tdcportal@gmail.com";
 //String[] filenames = { "c:\\create_tables_oracle.sql" };
   //String  sendTo="";
   //sendTo = "prabha005@gmail.com";
  
      String subject="test";
  
     SendSMTPMailUsingGmail  abc = new SendSMTPMailUsingGmail();
      abc.sendEmail(subject);
    
  
  %>
  </body>
</html>
