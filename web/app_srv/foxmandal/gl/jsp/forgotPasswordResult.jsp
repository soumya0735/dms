<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.mail_sende"%>


<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

    <title>Forgot Password</title>
  </head>
  
  <%
  String strUserId="";
  String strEmailId="";

   
DBQueryManager _dbq = new DBQueryManager();
DataEncoder dataEncoder = new DataEncoder();
mail_sende mailSender = new mail_sende();
List listData = new ArrayList();
String msg="";
String msg1 = "";
String msg2 = "";
String password = "";
String name = "";
String strDecodedPassword = "";
String subject = "";
String message = "";

 
  if(request.getParameter("userId")!=null)
   strUserId=request.getParameter("userId").toString();
  
  // if(request.getParameter("emailId")!=null)
      //strEmailId=request.getParameter("emailId").toString();
      
      
      
      if(strUserId != "" )
       {
           String query = "SELECT STR_PASSWORD,initcap(STR_FNAME)||initcap(nvl(STR_MNAME,' ')),initcap(nvl(STR_LNAME,' ')),STR_E_MAIL  FROM TDC_USER_REGISTRATION WHERE STR_USER_ID='"+strUserId+"' ";
           System.out.println("Query"+query);
          try{
          listData = _dbq.fetchData(query);
          if(listData.size()>0)
          {
          
            password = listData.get(0).toString();
            name=listData.get(1).toString();
            strEmailId=listData.get(3).toString();
            msg = " Dear "+name+ ",\n Your Password has been sent to your E-mail Id";
             
            strDecodedPassword = dataEncoder.decode(password);
       
            subject = "Your ICMR Portal Password Retrieved";
            message ="Dear "+listData.get(1).toString();
            message = "\n \n Information Regarding User-Id  and Password is given below \n  "+
               "User Id :  "+strUserId+ ""+
              "\n Password : "+strDecodedPassword+"";
      
            //String [] strRecipients = {strEmailId};
         
             mailSender.TransferToMailServer(strEmailId,subject,message);
          }
          else
          {
           msg = "You have entered wrong User Id  . \n ";
           msg =msg+ "User Id : "+strUserId ;
          
          }
       }
          catch(Exception e)
          {
            System.out.println("error is in java code  "+e);
          }
          finally
          {
          listData.clear();
          }
       }  
       
    %>
    
    <script>
   
    function functionClose1()
     { 
         window.close();
      }
      
    </script>
  <body bgcolor="#E0FFFF"  background="images/background.jpg"  topmargin="0">
  <table  align="center"  border="0" bgcolor="#E0FFFF" >
       <tr colspan="2" valign="middle" align="center" bordercolor="white"> 
        <td>&nbsp; </td>
      </tr>
      <tr colspan="2" valign="middle" align="center" bordercolor="white"> 
        <td>&nbsp; </td>
      </tr>
      <tr> 
        <td colspan="2" valign="middle" align="center" bordercolor="blue">
          <font face="verdana" size="2" color="#0066cc"><strong> <%= msg%> </strong></font>
        </td>
      </tr>
       
      <tr> 
        <td> &nbsp; </td>
      </tr>
       <tr> 
        <td colspan="2" valign="middle" align="center" bordercolor="blue">
          <input type="button" name="Close" value="Close" onclick="functionClose1()">
        </td>
      </tr>
  </table>
  </body>
</html>
