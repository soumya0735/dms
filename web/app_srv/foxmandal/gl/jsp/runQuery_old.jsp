<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder" %>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" %>
<%@page import="java.util.ArrayList" %>
<%@page import="in.cdacnoida.icmr.gl.model.glModel,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <%
        DBQueryManager dbq=new DBQueryManager();
ArrayList arr=new ArrayList();
 boolean isSuccess=false;
String strQueryStatus="";







 int iCol=2;
String strQueryType="select";// delete, update, insert, select
String curDate="19-05-2014";
String query="select get_user_name(str_user_id) , str_e_mail from tdc_user_registration where str_user_type='A'";
  
  
  
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
         if(curDate.equals(dateFormat.format(date)))
        {
         System.out.println("Matched");
        // for insert/update/delete query
 if (strQueryType.equals("delete")|| strQueryType.equals("insert") || strQueryType.equals("update") )
{
         isSuccess=dbq.insert(query);
strQueryStatus=strQueryType+" Executed";
}
        // for select query
      
     if (strQueryType.equals("select"))
{
        arr=dbq.fetchData(query);
strQueryStatus=strQueryType+" Executed";
}
        }
        else{
        strQueryStatus="Query Execution Date not Matched";
        }
       
        %>
    </head>
    <body>


<%=strQueryStatus%><br><br>
<%if(strQueryType.equals("delete") || strQueryType.equals("insert") || strQueryType.equals("update")) { %>
Status :  <%=isSuccess%>
<%} else if (strQueryType.equals("select")) { %>

<table  border="1">
<tr>
<%

for(int iSmall=0;iSmall<iCol;iSmall++)
{%>
<th>Heading <%=iSmall+1%></th>
<%}

for(int iCount=0;iCount<arr.size();iCount=iCount+iCol)
{
%>
<tr>
<%
for(int iSmall=0;iSmall<iCol;iSmall++)
{
%>
<td><%=arr.get(iCount+iSmall).toString()%></td>
<%}
%>
</tr>
<%}
%>
</table>

<%}%>




</body>
</html>