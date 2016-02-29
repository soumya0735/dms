<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>writequery</title>
   
  </head>
  <body>
  
  <form action="runQuery.jsp" method="POST" >
  <table>
  <tr>
 <td> Date: </td> 
 <td><input type="text" name="curDate" /></td>
 </tr>
  <tr>
 <td> Query type : </td> 
 <td><input type="text" name="strQueryType" /></td>
 </tr>
  <tr>
 <td> No of Columns : </td> 
 <td><input type="text" name="iCol" /></td>
 </tr>
  <tr>
 <td> Query : </td> 
 <td><textarea cols="80" rows="8" name="query" ></textarea></td>
 </tr>
 <tr>
 <td> Password : </td> 
 <td><input type="password" name="strPassword" /></td>
 </tr>
 </table>
 <button type="submit" value="Execute Query" >Executre Query</button>
  </form>
  </body>
</html>