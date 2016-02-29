<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.mail_sender"%>


<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title> Allocator Varification Form </title>
    <script src="../jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="../jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="../jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>

<%
  int listSize = 0;
  int i=0;
  String [] userId_Type;
  String [] userIdArray;
  StringTokenizer sst = null; 
  String userId = "";
  String userType = "";
  String [] str_query_array; 
  String msg = "";
  String msg1 = "";
  String str_query = "";
  List arrlistUserDetail = new ArrayList();
  String str_name = "";
  String str_e_mail = "";
  String subject = "";
  String message = "";
  
  
  
DBQueryManager _dbq = new DBQueryManager();
mail_sender mailSender = new mail_sender();

if(!request.getParameterValues("userId").equals(null) )
{
  int size = request.getParameterValues("userId").length;
  userId_Type = new String[size];
  userId_Type = request.getParameterValues("userId");
  //System.out.println("userid ... "+userId_Type[0].toString());
  str_query_array = new String[size];
  userIdArray = new String[size];
  
  
for(i = 0;i < size;i++)
 {
  sst = new StringTokenizer(userId_Type[i].toString(),"-");
  userId = sst.nextToken().toString(); 
  userIdArray[i] = userId;
  userType = sst.nextToken().toString();
  str_query=str_query+ "UPDATE TDC_USER_REGISTRATION SET STR_USER_TYPE='"+userType+"',STR_ALLOC_VERIFIED='Y' WHERE STR_USER_ID='"+userId+"'#@#";
  }
str_query_array=str_query.split("#@#");
try
{
int[] count={};
if(str_query_array.length >0)
{
count = _dbq.batchInsert(str_query_array);

}
//System.out.println("size of count....."+count);

if(count!=null || count.length >0)
{
  for(i=0;i<size;i++)
  {
    str_query = "SELECT INITCAP(R.STR_FNAME) || INITCAP(NVL(R.STR_MNAME,' ')) || INITCAP(NVL(R.STR_LNAME,' ')),R.STR_E_MAIL FROM TDC_USER_REGISTRATION R WHERE R.STR_USER_ID='"+userIdArray[i]+"'";
    arrlistUserDetail = _dbq.fetchData(str_query);
    if(arrlistUserDetail.size() > 0)
    {
      str_name = arrlistUserDetail.get(0).toString();
      str_e_mail = arrlistUserDetail.get(1).toString();
      try{     
            //subject = "Varification Intimation";
           // message = "Dear "+str_name+", \n \t Your verification process is successfully completed."+
          //  " Now you can Login into the TDC Portal. \n\n\n  Regards\n TDC portal Team";
      
         //   String [] strRecipients = {str_e_mail};
       
         //   mailSender.TransferToMailServer(strRecipients,subject,message);
            
          }
          catch(Exception e)
          {
          System.out.println("error is in java code"+e);
          }
      
    }
  }
  msg = "Allocator varification is successfully done.";
  msg1 = "Intimation is sent to the verified users on their e-mail id.";
}
else
{
    msg = "Allocator varification is not successfully done.";
    msg1 = "";
}
}
catch(Exception e)
{
  System.out.println("Error is here....."+e);
}
}
else
{
  msg = "No user is selected for Allocator varification.";
  msg1 = "";
}





%>

<script>

 function functionClose1()
   { 
       window.close();
    }

</script>
</head>
  <body  bgcolor="#E0FFFF"  topmargin="0">
  <form name="allocatorVarrificationResult" action="allocatorVarification.jsp">
  <table  align="center" border="0" bgcolor="#E0FFFF">
       <tr colspan="2" valign="middle" align="center" bordercolor="white"> 
        <td>&nbsp; </td>
      </tr>
      <tr colspan="2" valign="middle" align="center" bordercolor="white"> 
        <td>&nbsp; </td>
      </tr>
      <tr> 
        <td colspan="2" valign="middle" align="center" bordercolor="blue">
          <font face="verdana" size="2" color="#000080"><strong> <%= msg%> </strong></font>
        </td>
      </tr>
       <tr> 
        <td colspan="2" valign="middle" align="center" bordercolor="blue">
          <font face="verdana" size="2" color="#000080"><strong> <%= msg1%> </strong></font>
        </td>
      </tr>
      <tr> 
        <td> &nbsp; </td>
      </tr>
       <tr> 
        <td colspan="2" valign="middle" align="center" bordercolor="blue">
          <input type="submit" name="Back" value="Back" >
        </td>
      </tr>
  </table>
  </form>
  </body>
</html>
