<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>testLogin</title>
    <script>
    function checkValue(){
    document.forms[0].action="/ICMR/testLogin.do?hmode=checkValue";
    document.forms[0].method="post";
    document.forms[0].submit();
    
    
    }
    </script>
  </head>
  <body>
      <html:form action="/testLogin.do">
        <table
        <tr>
          <td>User Name</td>
          <td><html:text property="username"/></td>
        </tr>
         <tr>
          <td>Password</td>
          <td><html:password property="password"/></td>
        </tr> 
        
        <tr>
          <td colspan="2"><html:button property="saveButton" onclick="checkValue()"/></td>
        </tr> 
        </table>
        
        
      </html:form>
  </body>
</html>