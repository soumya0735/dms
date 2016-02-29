<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
     <script type="text/javascript">
 function get()
 {
    
   window.location.href='/ICMR//app_srv/icmr/gl/jsp/quickpath.jsp';
 }
 
 </script>
  </head>
  <body background="/ICMR//app_srv/icmr/gl/images/background.jpg" >
  <html:form action="/invExpertAction.do">
  <div style=" position :relative; top :100px; align:left; width:100%; height:50%;">
   <hr width=100% size="15" color="#7dcee7">
  <table width="100%" align="left" bgcolor="silver" height="60%" border="1">
  <tr>
  <td align="center">
  <table width="40%" align="center" bgcolor="#ccffff"  > 
  <tr><td align="center"></td></tr>
    <tr>
    <td>
   
    
   <center>
   
    <b>User Already Registered  </b><br></br></center>
   
   
   
    <tr>
    <td align="center"><input type="button" value="Ok" onClick="get()" style="submitbutton" ></td>
    </tr>
   
    
    </table>
    </td>
    </tr>
    </table>
    <center>Copyright &copy; 2008 CDAC. All Rights Reserved.</center>
    </div>
    </html:form>
    </body>
</html>