<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" %>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
      <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">.
     <script src="/ICMR/app_srv/icmr/gl/jssrc/validNumber.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
      
    
   
 <script language="javascript" type="text/javascript">
    
    
    
    function savevalue()
     {
   
      var uid=document.forms[0].userid.value;
  
      alert("uid"+uid);
      document.forms[0].action="/ICMR/collTrailAction.do?hmode=ADD
      document.forms[0].submit();
     
     }
 
    
    
    
    
    

    
    
    
     </script> 
    

    
  </head>
  <BODY topmargin="0"   background="images/background.jpg"   >
 
<html:form   method="post"   action="/collTrailAction" >
    <div align="center">
    <center>
   <fieldset>
    <table class="form" id="space">
	<tr>
	<th colspan="2" height="28">
	   Collaborating Agency Details</th>	</tr>     
     
	  
  
 
	 
  
  </table>
 </fieldset></center>
 </div>


 <%
 DBQueryManager queryManage = new DBQueryManager();
 String qry="";
 ArrayList al=new ArrayList();
 qry="SELECT NUM_COST_ID, STR_COST_NAME FROM TDC_COST_MASTER";
 al=queryManage.fetchData(qry);
 
 System.out.println("ss"+al.size());
 int i=0;
 %>
 
 
 
 
 
 <div id="div1" >
  <fieldset>
 <table>
 
<thead>


 <%

if(al.size()>0)
{
  %>
       <tr>
       <th>Year</th>
        <%
       
        for(int loopnum =0; loopnum<al.size(); loopnum++)
        {
        if(loopnum%2!=0){ %>
          <th><%=al.get(loopnum).toString()%><input type="HIDDEN" name="collid" value="<%=al.get(loopnum-1).toString()%>"></th> 
       <%
           }
           }
           
         }%> 

           
     
           
            <th><img src="/ICMR/app_srv/icmr/gl/images/plus.gif"  onclick="addRowToTable();"><img src="/ICMR/app_srv/icmr/gl/images/minus.gif" onclick="removeRowFromTable();"></th>
           </tr> 

 </thead>
 
<tr><td colspan="8">
 <table id="tblcost" class="data">
   <tr>
        <td><input type="text" name="year" value="1" readonly="readonly"></td>
           <td><input type="text" name="capital"></td>
           <td><input type="text" name="consume"></td>
          <td><input type="text" name="manpower"></td>
           <td><input type="text" name="travel"></td>
           <td><input type="text" name="overhead"></td>
           <td><input type="text" name="cotingency"></td>
          
          
           </tr> 
           
           
           

 </table>
 
 
 </td></tr>
 
    <tr>        
  <td   colspan="8">
  <p align="center">
	<input type="button"  class="generalButton" value="Add"  onclick="savevalue()" name="A1"/> 

	 
   </td>
 
 
	
  
  </tr>
  </table>
 </fieldset>
 
 </div>
 <input type="hidden"   value="" name="hmode" /> 
    
 </html:form >
 
  </body>
</html>
