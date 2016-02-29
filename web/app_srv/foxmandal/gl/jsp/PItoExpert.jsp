<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@ page import=" java.io.File" %>
<jsp:useBean id="_dbq" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" scope="session"/>
<%@ page import="java.util.*"%>
<html:html>
  <head>
  
   
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
   
    <title>Proposer to  Expert Registration</title>
       
    <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css"></link>
    
    
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validNumber.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/expertReg.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
   <script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.dataTables.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
   <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/demo_table.css">         
<script  LANGUAGE="JavaScript" TYPE="text/javascript">

function openPersonelReport() 
{
var strUserId=document.forms[0].strPropId.value;

 document.forms[0].action="/ICMR/PDFReportXMLParser?reportName=piProfile&where_clause1="+strUserId;
 document.forms[0].submit();
}


function check_mandatory_piexpert(thisEvent)
{
var flag1=true;

if(thisEvent.value=='Submit')
{
      
 if(document.forms[0].majorArea.value=="")
    {
    alert("Mandatory Field Missing  Major Discipline.")
     flag1=false;
    return false;
               }
               else{
                   flag1=true;
                  }
   
            if(flag1==true)
              {
               confirmation = confirm("Do you want to proceed with submission?");
                      if(confirmation == true)
                        {
                          document.forms[0].action="/ICMR/registrationAction.do";
                          document.forms[0].hmode.value="piexpertRegisterSave";
                          document.forms[0].submit();
                        }
                 
              }
          
}
     
      return true;
  }


</script>
<script>
 var majorDiscIds="";
          var majorDiscNames="";
        function checkAllMajor(theField)
        {
        
       

            if(theField.checked==true)    
            {
               majorDiscIds=majorDiscIds+theField.id+",";
               majorDiscNames=majorDiscNames+theField.value+",";
            }
            else {
                majorDiscIds=majorDiscIds.replace(theField.id+",","");
                majorDiscNames=majorDiscNames.replace(theField.value+",","");
            }
          
            document.getElementById("majName").innerHTML='<p class="generaltext"  ><b>'+majorDiscNames+'</b></p>';
            document.forms[0].majorArea.value=majorDiscIds;
        }
  </script>
        <%
        
        String email=request.getParameter("emailid");
        System.out.println("email"+email);
        String strQuery = "select bd.NUM_DISCIPLINE_ID,bd.STR_DESCRIPTION,STR_THEMATIC_AREA_NAME from TDC_BROAD_DISCIPLINE_DTL bd,TDC_THEMATIC_AREA_MASTER thm where bd.NUM_THEMATIC_AREA_ID=thm.NUM_THEMATIC_AREA_ID order by STR_THEMATIC_AREA_NAME,bd.STR_DESCRIPTION";
        ArrayList arrlistmajorArea=new ArrayList();
        arrlistmajorArea=_dbq.fetchData(strQuery);
        String strQry="select STR_USER_ID , get_user_name(str_user_id) as name,STR_E_MAIL,nvl(STR_DESIGNATION,'NA') ,nvl(STR_ORGANISATION,'NA'),  nvl(NUM_MOBILE_NO,0),u.str_address1||' ,'||c.str_city_name||'-'||NUM_ZIP||' ,'||s.str_state_name  from TDC_USER_REGISTRATION u, TDC_CITIES c," +
             "tdc_states s  where STR_USER_TYPE='P' and u.num_city_id=c.num_city_id and u.num_state_id=s.num_state_id and STR_E_MAIL='"+email+"'order by name";
         ArrayList arrlistProposerList=new ArrayList();
        arrlistProposerList=_dbq.fetchData(strQry);
        %>
    </head>
    <body>
    <html:form  action="/registrationAction.do"  method="post">
    <div align="center">
    <center>
 <fieldset>
    <table class="form" id="space">
	<tr>
	<th colspan="2" height="28"><h3>
	  Proposer To Expert</h3></th>	</tr>     
          <input type="hidden" name="hmode" />
     <tr>
    <td colspan="2" align="left" ><b>Proposer Details</b> <span class="alerttext">*</span>
         <input type="hidden"  name="strPropId"  value="<%=arrlistProposerList.get(0).toString()%>" />         
                  </td>
             </tr>
                <tr>
            <td colspan="3" >
             <table class="data" >
             <% if(arrlistProposerList.size()>0)
               {%>
             <tr><td><b>User Id:-</b></td><td><%=arrlistProposerList.get(0).toString()%></td><td><div style="float:left">
         <a href="javascript:openPersonelReport()"><u>View Registration Details</u></a> </div></td></tr>
             <tr><td><b>Proposer Name:-</b></td><td><%=arrlistProposerList.get(1).toString()%></td></tr>
              <tr><td><b>Email Id:-</b></td><td><%=arrlistProposerList.get(2).toString()%></td></tr>
              <tr><td><b>Designation:-</b></td><td><%=arrlistProposerList.get(3).toString()%></td></tr>
               <tr><td><b>Name of Institute:-</b></td><td><%=arrlistProposerList.get(4).toString()%></td></tr>
                <tr><td><b>Address:-</b></td><td><%=arrlistProposerList.get(6).toString()%></td></tr>
                 <tr><td><b>Contact Number:-</b></td><td><%=arrlistProposerList.get(5).toString()%></td></tr>
                  <%}%>
    
           
   
  </table>
  
             
           </td></tr>  
           
           <tr> <td colspan="2" align="left"><b>Select Major Dicipline from List</b> <span class="alerttext">*</span>
                 
                  </td>
             </tr>
              <tr>
            <td colspan="2" >
 <table class="data" id="tab1">
     <thead><tr> 
      <th width="8%">Select</th>
          <th >Major Discipline</th>
          <th>Broad Area</th>
      </tr></thead>
      <%
     if(arrlistmajorArea.size()>0)
       {
            for(int i=0;i<arrlistmajorArea.size();i=i+3)
            {
       %>
        <tr> 
           <td width="5%" align="right"><input type="CHECKBOX" id="<%=arrlistmajorArea.get(i).toString()%>"  name="majorAreaId" onclick="checkAllMajor(this)" value="<%=arrlistmajorArea.get(i+1).toString()%>" /></td>
           <td width="30%" align="left" ><%=arrlistmajorArea.get(i+1).toString()%></td>
           <td width="30%" align="left" ><%=arrlistmajorArea.get(i+2).toString()%></td>
        </tr>
       <%   }
        }
      %>
  </table>
  <script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#tab1').dataTable();
			} );
  </script>	
<html:hidden  property="majorArea"/>
        </td>
	</tr>
              <tr>
	<td>
	 Major Discipline(s)</td>
        <td id="majName">
        
        
        </td>
	</tr>   
        <tr>
	<td>
	 Sub Discipline</td>
        <td>
        <html:textarea  rows="2" cols="18"  property="subDisc" styleClass="mandatoryTArea"  styleId="Sub Discipline" onblur="isAlphaNumeric(this);checkMaxlen(this,500,3)" ></html:textarea>
        <span class="alerttext">Maxlength 500</span>
        <span class="alerttext">(You may enter comma seperated values)</span>
        </td>
	</tr>   
        
               
                  <tr>
              
               <td colspan="2"> <p align="center"><input class="generalButton" type="BUTTON" name="save" id="outsetButton" onclick="check_mandatory_piexpert(this);" value="Submit"/>
               <input class="generalButton" type="BUTTON" name="reset" id="outsetButton" onclick="Cancel_piexpert(this);" value="Cancel"/></p></td>
               
               </tr>
               </table>
              
  
  
	
	</fieldset>
	</center>
  </div>
    </html:form>
    
  
  
    </body>
</html:html>