<html>
<head>

<%@ page import ="java.util.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

<title>ICMR Portal.....Developed and Designed by C-DAC, Noida</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
   <script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.dataTables.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
   <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/demo_table.css">   
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,java.util.Date,java.text.SimpleDateFormat" %>
<jsp:useBean id="DBQueryManager" scope="session" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" />

<%
request.getSession(false);
//UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
%>

<%
        String search_string1[]={""};
	String target[]={""};											//Target field in the parent form
	String search_string[]={""};									//Search Fields Labels
	String isSubmit = new String();
	String where_clause = new String();
  String ckClose = new String();
  String function_name=new String();
	
	if (request.getParameter("target")!=null)
		target =request.getParameter("target").toString().split("#");
	if (request.getParameter("col")!=null)
		search_string =request.getParameter("col").toString().split("#");
	if (request.getParameter("coll")!=null)
		    search_string1=request.getParameter("coll").toString().split("#");
	if (request.getParameter("isSubmit")!=null)
	 	 isSubmit = request.getParameter("isSubmit").toString().toUpperCase();
	 	

	if (request.getParameter("where_clause")!=null)
	 	 where_clause = request.getParameter("where_clause").toString().toUpperCase();
  
  if (request.getParameter("ckClose")!=null)
	 	 ckClose = request.getParameter("ckClose").toString().toUpperCase();
   if (request.getParameter("function")!=null)
	 	 function_name = request.getParameter("function").toString();  
   else    
     function_name="";
%>

<Script language="JavaScript" type="text/javascript">

 var str = "";
 var ckClose = "NO";
function Onclickradio()
{
	if (document.form1.radio1==null)
	{
	 alert("No record available for selection");
	 return false;
	}
	
	if(document.form1.radio1.length >1)
	{
   for(i=0;i<document.form1.radio1.length;i++)
		{
			if(document.form1.radio1[i].checked==true)
			{
				str=document.form1.radio1[i].value;		//str contains all values seperated by #
        ckClose="YES";
			}
		}
   } 

  if(document.form1.radio1.length >1)
	{
   document.form1.ckClose.value="NO";
   for(i=0;i<document.form1.radio1.length;i++)
		{
			if(document.form1.radio1[i].checked==true)
			{
				ckClose="YES";
        document.form1.ckClose.value="YES";
        //alert("ckClose==="+ckClose);
        break;
			}    
		}
	}
	else
	{
		if(str == null)
			str = "";
		else
			str=document.form1.radio1.value;
	}
        
    if(str !="" ) // if any radio button is selected
	{
        
	var	arraylist=str.split('#');

<% if (target.length>0)			//target contains the number of parent-form-fields
		{
			for(int int_ctr=0;int_ctr<target.length;int_ctr++)
			{
				if (!target[int_ctr].equals(""))
				{
%>                                      
			window.opener.document.<%=target[int_ctr]%>.value=arraylist[<%=int_ctr%>];
<%
				}
			}if(!function_name.equals("")){%>
      window.opener.<%=function_name%>();
	<% }	}
%>
	}
}


function function_closeConnection(var_1)
{

  
   if(document.form1.ckClose.value=="NO")
    {
        alert("First Select Any Record");
        return false;
    }
    if("<%=isSubmit%>"=="YES")
    {
      //  alert("Pankaj");
		window.opener.document.forms[0].submit();
    window.close();
    }
    else
    {
      window.close();
    }
}
</script>
</head>
<body>
<form name="form1" method="post">
<input type="hidden" name="ckClose" value="<%=ckClose%>">
<div class="content"  id="active" align="center">
 <center><span class="formheading">Document Details</span></center>
<table class="display" id='tab1'>
      <thead>
     <tr>
     <th width="2%" ></th>
     <th width="2%" >Sl.No.</th>
     <th width="8%">Doc Name</th>
     <th width="6%" >Doc Short Name</th>
     <th width="10%" >Doc Description</th>
     <th width="6%">Duration Type</th>
     <th width="5%">Duration</th>
     <th width="15%">Doc Stage</th>  
    </tr>
    </thead>
<%  
try
{
      	String Query="";
	ArrayList ArrayList_1= new ArrayList();
        DBQueryManager  _dbq= new DBQueryManager();
	Query=request.getParameter("query");
	Query=Query+ " order by " + request.getParameter("order");
        System.out.println("Query is"+Query);
        ArrayList_1=_dbq.fetchData(Query);
        System.out.println("Size of ArrayList is = "+ArrayList_1.size());
	String str=new String();
	str="";
        if(ArrayList_1.size()>0)
        {
            int count1=0;
            for(int ii=0;ii<ArrayList_1.size();ii=ii+10)
            {
            
for(int k=0;k<10;k++)
str=str+ArrayList_1.get(ii+k)+"#";
str=str.substring(0,(str.length()-1));
//System.out.println("Value of str is = "+str);
%>
                <tr>
                <td><input type="radio" name="radio1" value="<%=str%>" id="<%=ArrayList_1.get(ii)%>"
                onClick="{Onclickradio();function_closeConnection(this);}" /></td>
                <td><%=++count1%></td> 
                <td align="left"><%=ArrayList_1.get(ii+1)%></td>
                <td align="left"><%=ArrayList_1.get(ii+2)%></td>
                <td align="left"><%=ArrayList_1.get(ii+3)%></td>
                <td align="left"><%=ArrayList_1.get(ii+4)%></td>
                <td align="left"><%=ArrayList_1.get(ii+5)%></td>
                <td align="left"><%=ArrayList_1.get(ii+9)%></td>
                </tr>
<%
                str="";
            }
        }
        else
        {
%>
            <tr>
            <td colspan="11"><center>No Records Found.</center></td>
            </tr>
<%      }
}

catch(Exception e)
{
    e.printStackTrace();
} 
%>
</table>
<div id="pageNavPosition" align="center">
<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
			$('#tab1').dataTable();
			} );
</script></div>
</div>
<br/><br/><br/>
<div align="center">
<input type="button" name="Return"  class="submitbutton" value="Close" tabindex="11"
	onClick="window.close(self);" /> 
        </div>
</form>
</body>
</html>
