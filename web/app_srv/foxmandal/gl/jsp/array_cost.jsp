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
       <style type="text/css">
    .divStyle {
   // width:200px;
    height:100px;
    margin:0px auto;
    }
    </style>
   
 <script language="javascript" type="text/javascript">
    
    
    
    
   

    
    
    
    
    
    
    
    
    function savevalue()
     {
   
      var uid=document.forms[0].userid.value;
  
      alert("uid"+uid);
      document.forms[0].action="/ICMR/collAction.do?hmode=ADD&uid="+uid
      document.forms[0].submit();
     
     }
 
    
    
    
    
    

    
    
     </script> 
    

    
  </head>
  <BODY topmargin="0"   background="images/background.jpg"  >
 
<html:form   method="post"   action="/collAction" >
    <div align="center">
    <center>
   <fieldset>
    <table class="form" id="space">
	<tr>
	<th colspan="2" height="28">
	   Collaborating Agency Details</th>	</tr>     
     
	
    <tr>
	
  <td width="40%"  colspan="2">
  <p align="center">
	
	 
   </td>
 
 
	
  
  </tr>
  
  
 
	 
  
  </table>
 </fieldset>
 </center>
 </div>


 <%
  
  double dur=0;
   ArrayList al1=new ArrayList();
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
  <%
 int count=1;
 if(dur>0)
 {
 
 
 %>
  
        
          <% for(int j=0;j<dur;j++)
          {
          %>
               <tr>
             <td><html:text styleClass="mandatoryTbox"  property="year"  styleId="year"  size="30" value="<%=Integer.toString(count)%>" /></td>
             <%
             if(al1.size()>0)
              {
              for(int loopnum =0; loopnum<al1.size(); loopnum++)
             {
                if(loopnum%2!=0){
              
               %>
            
            
            
          
           <td><html:text styleClass="mandatoryTbox"  property=""  styleId=""  size="30"  /></td>
          
          <%}}}count++;
          }
          %>
          </tr>
          
          
         <% }
          %>
          
           
           
           

 </table>
 
 
 </td></tr>
 
    <tr>        
  <td   colspan="8">
  <p align="center">
  <html:button  styleClass="generalButton" property="btnDone" value="Done" onclick="savevalue()" />
	
	 
   </td>
 
 
	
  
  </tr>
  </table>
 </fieldset>
 
 </div>
 
   
 </html:form >
 
  </body>
</html>
