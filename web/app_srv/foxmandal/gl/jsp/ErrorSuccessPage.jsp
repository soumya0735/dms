<%@ page contentType="text/html;charset=windows-1252" import="java.util.ArrayList"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Transaction Status Page</title>
  </head>
  <body bgcolor="white" >
<%
ArrayList parametersList = new ArrayList();
parametersList=(ArrayList)session.getAttribute("errorSuccessParametersList");

ArrayList printParaList = new ArrayList();
ArrayList printParaList2 = new ArrayList();

if(session.getAttribute("printList")!=null||session.getAttribute("printList")!="null"||session.getAttribute("printList")!="")
{
System.out.println("printParaList in if JSP---");
printParaList=(ArrayList)session.getAttribute("printList");
}
System.out.println("inside anshujain");

if(session.getAttribute("printList1")!=null)
   {
   System.out.println("inside printList2");
  printParaList2=(ArrayList)session.getAttribute("printList1");

System.out.println("printParaList2="+printParaList2.size());

System.out.println("printParaList2="+printParaList2.get(0));
System.out.println("printParaList2="+printParaList2.get(1));
}

//System.out.println("parametersList Size in JSP---"+parametersList.size());
//System.out.println("parametersList in JSP---"+parametersList);

String header=new String();
String form_name=new String();
String value1name=new String();
String value1= new String();

if(parametersList==null || parametersList.size()< 2)
{%>
<script>location.href("/ICMR/app_srv/icmr/gl/jsp/logout.jsp");</script>
<% }

if(parametersList!=null && parametersList.size()>=4)
  value1=parametersList.get(3).toString();new String();
String value2name=new String();
String value2=new String();
String value3name=new String();
String value3= new String();
String value4name=new String();
String value4=new String();
String backurl=new String();


if(parametersList!=null && parametersList.size()==11)
{
 header=parametersList.get(0).toString();
 form_name=parametersList.get(1).toString();
 value1name=parametersList.get(2).toString();
 value1=parametersList.get(3).toString();
 value2name=parametersList.get(4).toString();
 value2=parametersList.get(5).toString();
 value3name=parametersList.get(6).toString();
 value3= parametersList.get(7).toString();
 value4name=parametersList.get(8).toString();
 value4=parametersList.get(9).toString();
 backurl=parametersList.get(10).toString();
}
if(parametersList!=null && parametersList.size()==9)
{
 header=parametersList.get(0).toString();
 form_name=parametersList.get(1).toString();
 value1name=parametersList.get(2).toString();
 value1=parametersList.get(3).toString();
 value2name=parametersList.get(4).toString();
 value2=parametersList.get(5).toString();
 value4name=parametersList.get(6).toString();
 value4=parametersList.get(7).toString();
 backurl=parametersList.get(8).toString();
}
if(parametersList!=null && parametersList.size()==7)
{
 header=parametersList.get(0).toString();
 form_name=parametersList.get(1).toString();
 value1name=parametersList.get(2).toString();
 value1=parametersList.get(3).toString();
 value4name=parametersList.get(4).toString();
 value4=parametersList.get(5).toString();
 backurl=parametersList.get(6).toString();
}

 
%>


<br><br>
 <% if(header.length()>0 && header.substring(0,1).equals("S")){%>
  <table width="65%" border="0" cellspacing="0" cellpadding="0" align="center" >
          <tr> 
		    			<td width="44" height="44" nowrap="nowrap"  background="/ICMR/App_srv/gl/images/resultantPage/TLCorner.gif">&nbsp;</td>
              <td colspan="3" nowrap="nowrap"  background="/ICMR/App_srv/gl/images/resultantPage/CFT1.gif"><div align="center">
              <% if(header!=""){%>
              <font size="4" face="Arial, Helvetica, sans-serif"  ><br><b><%=header%></b></font></div>
               <%}else
                {%>
                  <font size="4" face="Arial, Helvetica, sans-serif" >Success Page</font></div>
                     
                <%}%>
              </td>
              <td width="44" nowrap="nowrap"  height="44" background="/ICMR/App_srv/gl/images/resultantPage/TRCorner.gif">&nbsp;</td>
        </tr>
        <tr>
					   <td height="44" nowrap="nowrap"  background="/ICMR/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
             <%if(form_name!=""){%>
               <td    colspan="3" ><div align="center" > <font size="3" color="#99ccff" face="Arial, Helvetica, sans-serif"><b><%=form_name%></b></font></div> </td>
                 <%}%>
                <td height="44" nowrap="nowrap"  background="/ICMR/App_srv/gl/images/resultantPage/RFT.gif">&nbsp;</td>
					 </tr>
           
           <tr> 
					    <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
               <td><div align="center"></div></td>
               
               <td width="35%" nowrap="nowrap" ><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value1name%></b></font></div></td>
               <td ><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value1%></b></font></div></td>
               
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/RFT.gif"></td>
					 </tr>
           
            <%if(parametersList.size()>=9){%>
					  <tr>   
              <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
               <td ><div align="center"></div></td>
              
                <td width="35%" nowrap="nowrap" ><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value2name%></b></font></div></td>
               <td ><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value2%></b></font></div></td>
                  
                  
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/RFT.gif">&nbsp;</td>
					 </tr>
          <%}%>
           <%if(parametersList.size()==11){%>
           <tr> 
					   <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
               <td><div align="center"></div></td>
                 

                 <td nowrap="nowrap" ><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value3name%></b></font></div></td>
               <td><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value3%></b></font></div></td>
              
               
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/RFT.gif">&nbsp;</td>
					 </tr>
          <%}%>
  
              <tr> 
					      <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
                <td> <div align="center"></div> </td>
                 <%if(value4!=""){%>
                  <td nowrap="nowrap"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value4name%></b></font></div></td>
               <td><div align="left"><font size="2" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value4%></b></font></div></td>
                 <%}else{%>
                 <td></td>
                 <td></td>
                 <%}%>
                <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/RFT.gif">&nbsp;</td>
					 </tr>
               
               
                    
		 					<tr>
		    				<td width="44" height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/LFT.gif">&nbsp;</td>
                 <%if(backurl!="" && printParaList!=null){%>
		    				<td colspan="3" ><div align="center"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=backurl%>"><b>Click Here to Go Back</b></a></font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="4" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=printParaList.get(0).toString()%>" target="new">Print</a></p></font></div></td>
		    				 <%}else{%>
                <td colspan="3" ><div align="center"><font size="2" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=backurl%>"><b>Click Here to Go Back</b></a></p></font></div></td> 
                 <%}%>
                <td height="44" nowrap="nowrap" background="/NSCSM/App_srv/gl/images/resultantPage/RFT.gif">&nbsp;</td>
		  				</tr>   
               
               
		 					<tr>
		    				<td width="44" height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/BLCorner.gif">&nbsp;</td>
                 <%if(printParaList2!=null && printParaList2.size()>1 ){%>
		    			       <td colspan="2" background="/NSCSM/App_srv/gl/images/resultantPage/CFT.gif" ><div align="center">
                     <font size="4" face="Arial, Helvetica, sans-serif" color="#999933">
                     <a href="<%=printParaList2.get(1)%>" target="new"><b><%=printParaList2.get(0)%></b></a></p></font></div></td> 
                     <td  background="/NSCSM/App_srv/gl/images/resultantPage/CFT.gif" ><div align="center">
                     <font size="4" face="Arial, Helvetica, sans-serif" color="#999933">
                     <a href="<%=printParaList2.get(3)%>" target="new" ><b><%=printParaList2.get(2)%></b></a></p></font></div></td> 
                 <%}else{%>
                  <td colspan="3" background="/NSCSM/App_srv/gl/images/resultantPage/CFT.gif" ><div align="center">
                     </div></td> 
                 <%}%>
                <td height="44" nowrap="nowrap" background="/NSCSM/App_srv/gl/images/resultantPage/BRCorner.gif">&nbsp;</td>
		  				</tr>
  
  
  
<%
if(parametersList!=null)
  {parametersList.clear();}
  
  if(printParaList!=null)
  {
  System.out.println("I am going to remove the attributes");
  printParaList.clear();
  session.removeAttribute("printList");
  }
    if(printParaList2!=null)
  {
   printParaList2.clear();
  session.removeAttribute("printList1");
  }
  
  
%>  

</table>

<%}
 else {%>

  <table width="65%" border="0" cellspacing="0" cellpadding="0" align="center"  >
          <tr> 
		    			<td width="44" height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorTLCorner.gif">&nbsp;</td>
              <td colspan="3" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorCFT1.gif"><div align="center">
              <% if(header!=""){%>
              <font size="4" face="Arial, Helvetica, sans-serif"  ><br><b><%=header%></b></font></div>
               <%}else
                {%>
                  <font size="4" face="Arial, Helvetica, sans-serif" >Success Page</font></div>
                     
                <%}%>
              </td>
              <td width="44" nowrap="nowrap"  height="44" background="/NSCSM/App_srv/gl/images/resultantPage/ErrorTRCorner.gif">&nbsp;</td>
        </tr>
        <tr>
					   <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorLFT.gif">&nbsp;</td>
             <%if(form_name!=""){%>
               <td    colspan="3" ><div align="center" > <font size="5" color="green" face="Arial, Helvetica, sans-serif"><b><%=form_name%></b></font></div> </td>
                 <%}%>
                <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorRFT.gif">&nbsp;</td>
					 </tr>
           
           <tr> 
					    <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorLFT.gif">&nbsp;</td>
               <td><div align="center"><img src="/NSCSM/App_srv/gl/images/resultantPage/Errorbutton_multi_color.gif"  height="14"></div></td>
               
               <td width="35%" nowrap="nowrap" ><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value1name%></b></font></div></td>
               <td ><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value1%></b></font></div></td>
               
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorRFT.gif"></td>
					 </tr>
           
            <%if(parametersList.size()>=9){%>
					  <tr>   
              <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorLFT.gif">&nbsp;</td>
               <td ><div align="center"><img src="/NSCSM/App_srv/gl/images/resultantPage/Errorbutton_multi_color.gif"  height="14"></div></td>
              
                <td width="35%" nowrap="nowrap" ><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value2name%></b></font></div></td>
               <td ><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value2%></b></font></div></td>
                  
                  
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorRFT.gif">&nbsp;</td>
					 </tr>
          <%}%>
           <%if(parametersList.size()==11){%>
           <tr> 
					   <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorLFT.gif">&nbsp;</td>
               <td><div align="center"><img src="/NSCSM/App_srv/gl/images/resultantPage/Errorbutton_multi_color.gif"  height="14"></div></td>
                 

                 <td nowrap="nowrap" ><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value3name%></b></font></div></td>
               <td><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value3%></b></font></div></td>
              
               
               <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorRFT.gif">&nbsp;</td>
					 </tr>
          <%}%>

              <tr> 
					      <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorLFT.gif">&nbsp;</td>
                <td> <div align="center"><img src="/NSCSM/App_srv/gl/images/resultantPage/Errorbutton_multi_color.gif"  height="14"></div> </td>
                 <%if(value4!=""){%>
                  <td nowrap="nowrap"><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><b><%=value4name%></b></font></div></td>
               <td><div align="left"><font size="4" face="Arial, Helvetica, sans-serif" color="Navy"><b><%=value4%></b></font></div></td>
                 <%}else{%>
                 <td></td>
                 <td></td>
                 <%}%>
                <td height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorRFT.gif">&nbsp;</td>
					 </tr>
               
		 					<tr>
		    				<td width="44" height="44" nowrap="nowrap"  background="/NSCSM/App_srv/gl/images/resultantPage/ErrorBLCorner.gif">&nbsp;</td>
                 <%if(backurl!="" && printParaList!=null){%>
		    				<td colspan="3" background="/NSCSM/App_srv/gl/images/resultantPage/ErrorCFT.gif"><div align="center"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=backurl%>"><b>Click Here to Go Back</b></a></font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="4" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=printParaList.get(0).toString()%>" target="new">Print</a></p></font></div></td>
		    				 <%}else{%>
                <td colspan="3" background="/NSCSM/App_srv/gl/images/resultantPage/ErrorCFT.gif"><div align="center"><font size="4" face="Arial, Helvetica, sans-serif" color="Black"><a href="<%=backurl%>"><b>Click Here to Go Back</b></a></p></font></div></td> 
                 <%}%>
                <td height="44" nowrap="nowrap" background="/NSCSM/App_srv/gl/images/resultantPage/ErrorBRCorner.gif">&nbsp;</td>
		  				</tr>
  
  
  
<%
if(parametersList!=null)
  {parametersList.clear();}
  
  if(printParaList!=null)
  {
  System.out.println("I am going to remove the attributes");
  printParaList.clear();
  session.removeAttribute("printList");
  }
  
   if(printParaList2!=null)
  {
  System.out.println("I am going to remove the attributes");
  printParaList2.clear();
  session.removeAttribute("printList1");
  }
  
  
%>  
</table>
<%}%>

  </body>
</html>

