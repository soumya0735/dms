<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
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
        





        String iCol="0";
        String strQueryType="";// delete, update, insert, select
        String curDate="";
        String query="";
          String strPassword="";
if(request.getParameter("strQueryType")!=null)
  strQueryType=request.getParameter("strQueryType").toString();
if(request.getParameter("curDate")!=null)
  curDate=request.getParameter("curDate").toString();
if(request.getParameter("query")!=null)
  query=request.getParameter("query").toString();
if(request.getParameter("iCol")!=null)  
  iCol=request.getParameter("iCol").toString();
if(request.getParameter("strPassword")!=null)  
  strPassword=request.getParameter("strPassword").toString();

  
  
  
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        
        
        if(strPassword.equals("admin123$%^"))
        {
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
       }
       else
       {
       strQueryStatus="In-correct Password";
       }
        %>
    </head>
    <body>

strQueryType=<font color="Gray" > <%=strQueryType%></font><br>
curDate= <font color="Maroon" > <%=curDate%></font><br>
query= <font color="Blue" > <%=query%></font><br>
iCol=  <font color="Lime" > <%=iCol%></font><br>
<font color="Red" > <%=strQueryStatus%></font><br><br>
<%if(strQueryType.equals("delete") || strQueryType.equals("insert") || strQueryType.equals("update")) { %>
Status :  <%=isSuccess%>
<%} else if (strQueryType.equals("select")) { %>

<table align="center" border="1">
<tr>
<%

for(int iSmall=0;iSmall<Integer.parseInt(iCol);iSmall++)
{%>
<th><font color="Blue" >Heading <%=iSmall+1%></font></th>
<%}

for(int iCount=0;iCount<arr.size();iCount=iCount+Integer.parseInt(iCol))
{
%>
<tr>
<%
for(int iSmall=0;iSmall<Integer.parseInt(iCol);iSmall++)
{
%>
<td><font color="Gray" ><%=arr.get(iCount+iSmall).toString()%></font></td>
<%}
%>
</tr>
<%}
%>
</table>

<%}%>




</body>
</html>