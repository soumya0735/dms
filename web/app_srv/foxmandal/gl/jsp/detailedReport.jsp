<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,java.util.*,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*;"%>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- For chosen combo -->
<script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.js"></script>  
<link href="/ICMR/app_srv/icmr/gl/theme/chosen.css" rel="stylesheet" type="text/css"/>
<!-- For chosen combo -->
<link href="/ICMR/app_srv/icmr/gl/theme/calendar-win2k-cold-1.css" rel="stylesheet" type="text/css">
<script src="/ICMR/app_srv/icmr/gl/jssrc/datepickupNew.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar.js"></script>
<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-setup.js"></script>
<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-en.js"></script>
<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/userReg.js"></script>
<script src="/ICMR/app_srv/icmr/gl/jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>

<%
    response.setHeader("expires","0");
    response.setHeader("expires","now");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires",-1);
%>
    <script type="text/javascript">
   /* This file is use to design UI to generrate State/City wise submitted pre-proposal status */
/**
 * 
 * @param strEvent 
 */
function loadStateUserLocal(strEvent)
{
    var selected=document.forms[0].stateId.value;
    var url="";
    var url1="";
    if(strEvent=='S')
    {
    if(selected!= null)
    url="/ICMR/registrationAction.do?hmode=getCity&matType="+selected;   
    }
        if (window.XMLHttpRequest) // Mozilla, Safari,...
        { 
                http_request4 = new XMLHttpRequest();
        //	alert('Mozilla');
        } 
        else if (window.ActiveXObject)  // IE
        {
        // alert('IE');
                try {
        
                        http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
        //alert('IE  2'+http_request4);
                }
                catch (e) {
                        try {
        
                                http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
        // alert('IE   3'+http_request4);
                        }
                        catch (e) {}
                }
        }
        if (!http_request4) {
                alert('Giving up :( Cannot create an XMLHTTP instance');
                return false;
        }
        if(strEvent=='S' )
        {
        http_request4.open("GET", url, true);
        http_request4.onreadystatechange = loadUomDataLocal;
        http_request4.send(null);
        }
        else if(strEvent=='U' && strUserID!="")
        {
        http_request4.open("GET", url1, true);
        http_request4.onreadystatechange = loadUserIDLocal;
        http_request4.send(null);
        }
}
/**
 * 
 */
function loadUomDataLocal()
{
        var frm=document.forms[0];
        if(http_request4.readyState == 4){
        if(http_request4.status == 200) {
        str = http_request4.responseXML.documentElement;
        var o=document.getElementById("strCity");
        len=o.childNodes.length;
        
        for(var rem=len;rem>1;rem--){
                o.removeChild(o.childNodes[rem-1]);
        }
        partOption1=document.createElement("option");
                                partOption1.value="%";
                                partOption1.innerText="-All City-";
                                partOption1.text="-All City-";
                                o.appendChild(partOption1);	
                        
        var x= str.getElementsByTagName("UOM");
        for(var y=0;y<x[0].childNodes.length;y++)
        {
            partOption1=document.createElement("option");
            partOption1.value=x[0].childNodes[y].attributes[1].nodeValue;
            partOption1.innerText=x[0].childNodes[y].attributes[0].nodeValue;
            partOption1.text=x[0].childNodes[y].attributes[0].nodeValue;
            o.appendChild(partOption1);										
        }
        }
        }
}
/**
 * 
 * @param dtFrom 
 * @param dtTo 
 */
function compareDate(dtFrom,dtTo)
  {
             var date1;
        var date2;
        var from_date="";
        var to_date="";
        from_date=dtFrom.split("-");
        to_date=dtTo.split("-");
        date1=new Date((from_date[2]),(from_date[1]-1),(from_date[0]));
        date2=new Date((to_date[2]),(to_date[1]-1),(to_date[0]));
        if(date1 >= date2 )
        {
                 return false;
        }    
        else
        {
         return true;
        }
  }
/**
 * 
 */
 function hideDetails(){
    document.getElementById("table4").style.display="block";
 document.getElementById("table2").style.display="none";
 
 }
  function showDetails(){
    document.getElementById("table4").style.display="none";
 document.getElementById("table2").style.display="block";
  }
function getReport()
{
    var subFromDate=document.forms[0].subFromDate.value;
    var subToDate=document.forms[0].subToDate.value;
    var deciFromDate=document.forms[0].deciFromDate.value;
    var deciToDate=document.forms[0].deciToDate.value;
    var reportDescription=document.forms[0].strRD.value;
       
    if(compareDate(subFromDate,subToDate)){
    if(reportDescription==="brief"){
    
            document.forms[0].method="post";
    document.forms[0].action="/ICMR/generatejasper.do?hmode=getGroupByReport";
    document.forms[0].submit();
    }
    else{
        if(compareDate(deciFromDate,deciToDate)){
        if(compareDate(subFromDate,deciFromDate)){
            getSelectedComboValues("strInstType","strInstCategory");  
             document.forms[0].method="post";
    document.forms[0].action="/ICMR/generatejasper.do?hmode=getReport";
    document.forms[0].submit();
        }
        else{
            alert("Decision From Date should be Greater than Submission From Date ");
            document.forms[0].deciFromDate.value="";
            document.forms[0].deciFromDate.focus();
        }
       }
        else{
                alert("Decision From Date should be less than Decision To Date ");
                document.forms[0].deciFromDate.value="";
                document.forms[0].deciToDate.value="";
                document.forms[0].deciFromDate.focus();
            }
    }
        }
    else{
        alert("Submission From Date should be less than Submission To Date ");
        document.forms[0].subFromDate.value="";
        document.forms[0].subToDate.value="";
        document.forms[0].subFromDate.focus();
    }
}
  
  /**
   *  Just calling the action which Re-load the page
   */
   function ResetValues(){
      document.forms[0].method="post";
      document.forms[0].action="/ICMR/jasperReport.do";
      document.forms[0].submit();
   }
   /**
    * 
    * @param ComboId 
    * @param hiddenField 
    */
   function getSelectedComboValues(ComboId,hiddenField){
    var values=$("#"+ComboId).val();
    var n="";
       if(values==null){
          var allId="";
           $("#"+ComboId+" option").each(function(i){
                allId=allId + $(this).val()+",";
            });
            n=allId.substring(0,(allId.length-1));  
       }else{
        //one or more has been selected 
          n = $("#"+ComboId+" option:selected").map(function(){return $(this).val(); }).get().join(",");
        }
        document.getElementById(hiddenField).value=n; 
     }
   
    </script>
   </head>
    <body>
     <%   
            String strQuery = ""; 
            String strState="";
            String strThemAreaQuery="";
            DBQueryManager  _dbq= new DBQueryManager();
            List arrlistStatelist = new ArrayList();
            strQuery="Select NUM_STATE_ID,STR_STATE_NAME from TDC_STATES order by STR_STATE_NAME";
            strThemAreaQuery="select num_thematic_area_id,str_thematic_area_name from tdc_thematic_area_master";
            
              List arrlistInstTypelist = new ArrayList();
              String strInstTypeQuery="select ins_type_id,ins_type from tdc_institute_type_master order by ins_type";
    %>
    <form name="frm" method="POST" action="" >
    <input type="hidden" name="user_id" value="" />
    <div align="center">
    <fieldset style="width:95%;">
    <table id="table1" width="90%" class="innerdata" align="center">
        <tr><td colspan="6" align="center"><font size="4" face="Verdana" ><strong>Proposals Report</strong></font></td></tr>  
        <tr><td width="120"><font size="3" face="Verdana" > Submission Between :</font></td>
            <td width="300"><input type="text"  id="subFromDate"  name="subFromDate" value="" onblur="days_between_future(this);isDate(this);" /><font size="3" face="Verdana" > To </font>
            <input type="text" id="subToDate" name="subToDate" value="" onblur="days_between_future(this);isDate(this);" /></td>
         </tr>
      <tr>
        <td width="120"><font size="3" face="Verdana">Report Description </font></td>
            <td width="300">
                <input type="radio" id="strRD" name="strReportDescription" value="detailed" checked="checked" onchange="showDetails()">Detailed</input>
                <input type="radio" id="strRD" name="strReportDescription" value="brief" onchange="hideDetails()">Brief</input>
         </td> 
      </tr>   
      </table>
      <table id="table4" width="90%" class="innerdata" align="center" style="display:none;">
      <tr>
        <td width="120"><font size="3" face="Verdana">Group By </font></td>
        <td width="300">
            <select id="group1" name="group1" >
                <option value="0">Broad Area Wise </option>
                <option value="1">State Wise</option>
                <option value="2">City Wise</option>
                <option value="3">Institution Type Wise</option>
                <option value="4">Status Wise</option>
            </select>
        </td> 
        </tr>
      </table>
      <table id="table2" width="90%" class="innerdata" align="center">
          <tr><td width="120"><font size="3" face="Verdana">Broad Area</font></td>
      <td width="300">
          <select id="thematicAreaId" name="thematicAreaId" >
              <option value="%">All Broad Areas</option>
              <% arrlistStatelist=_dbq.fetchData(strThemAreaQuery);
                  for(int ii=0;ii<arrlistStatelist.size();ii=ii+2){ %>
                          <option value="<%=arrlistStatelist.get(ii)%>" ><%=arrlistStatelist.get(ii+1)%> </option> 
                          <%}%>
          </select>
       </td>
      </tr>
      <tr>
            <td width="120"><font size="3" face="Verdana" > State:</font></td>
            <td width="300">
              <select  id="St" name="stateId" onChange="loadStateUserLocal('S')">
                             <option value="%" >-All States-</option>
                              <%
                              arrlistStatelist=_dbq.fetchData(strQuery);
                             for(int ii=0;ii<arrlistStatelist.size();ii=ii+2)
                              { 
                              if(arrlistStatelist.get(ii).equals(strState)) 
                              {
                              %>
                              <option selected="selected" value="<%=arrlistStatelist.get(ii)%>" ><%=arrlistStatelist.get(ii+1)%> </option>
                               <%
                               }
                                 else
                               { %>
                              <option value="<%=arrlistStatelist.get(ii)%>" ><%=arrlistStatelist.get(ii+1)%> </option> 
                               <% }
                               }
                           %>
                 </select>
                 </td>
      </tr>
      <tr>
            <td width="120"><font size="3" face="Verdana" > City:</font></td>
            <td width="300">
                    <select id="strCity" name="cityId" >
                    <option value="%" >-All Cities-</option>
                    </select>
                  </td>
      </tr>
      
      
      <tr id="row2">
                  <td width="200">
                      <font size="3" face="Verdana">Institution Type</font>
                      
                  </td>                  
                  <td width="400">
                        <select class="chzn-select" name="strInstType" multiple="multiple"  id="strInstType" style="width: 70%">
                        <%
                            arrlistInstTypelist=_dbq.fetchData(strInstTypeQuery);
                            for(int j=0;j<arrlistInstTypelist.size();j=j+2) { 
                        %>
                                  <option value="<%=arrlistInstTypelist.get(j)%>" ><%=arrlistInstTypelist.get(j+1)%> </option> 
                        <% }%>
                        </select>
                       <input type="hidden" name="strInstCategory" id="strInstCategory"></input>  
                  </td>
                </tr>
      
<tr>
    <td width="120">
    <font size="3" face="Verdana" >Decision  Between :</font></td>
    <td width="300"><input type="text"  id="deciFromDate"  name="deciFromDate" value="" onblur="days_between_future(this);isDate(this);" />
    <font size="3" face="Verdana" > To </font><input type="text" id="deciToDate" name="deciToDate"    value="" onblur="days_between_future(this);isDate(this);" /></td>
</tr>
</table>
<table id="table3" width="90%" class="innerdata" align="center">
        <tr>
        <td width="120"><font size="3" face="Verdana">Report Type </font></td>
        <td width="300">
            <select id="reportType" name="reportType" >
                <option value="C">Concept </option>
                <option value="D">Detailed</option>
            </select>
        </td> 
        </tr>

      <tr>
        <td width="120"><font size="3" face="Verdana">Report Format </font></td>
            <td width="300">
                <input type="radio" id="strFromat" name="strFormat" value="E" checked="checked">Excel</input>
                <input type="radio" id="strFromat" name="strFormat" value="P">Pdf</input>
         </td> 
      </tr>
      <tr>
        <td align="center" colspan="6"><font size="3" face="Verdana" ><input type="BUTTON" name="B1" value="Generate Report"  onclick="getReport();"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="Bl" value="Reset" onclick="ResetValues()"></font></td></tr>
    </table>
    </fieldset>
 </div> 

     <script>
        Calendar.setup({
           inputField     :    "subFromDate",	// id of the input field
            ifFormat       :    "%d-%m-%Y",     	// format of the input field data
           // button         :    "img_btn_PreparedDate",// trigger for the `lendar (button ID)
            align          :    "Bl",            	// alignment (defaults to "Bl")
            singleClick    :    true
        });
        Calendar.setup({
           inputField     :    "subToDate",	// id of the input field
            ifFormat       :    "%d-%m-%Y",     	// format of the input field data
           // button         :    "img_btn_PreparedDate",// trigger for the calendar (button ID)
            align          :    "Bl",            	// alignment (defaults to "Bl")
            singleClick    :    true
        });
         Calendar.setup({
           inputField     :    "deciFromDate",	// id of the input field
            ifFormat       :    "%d-%m-%Y",     	// format of the input field data
           // button         :    "img_btn_PreparedDate",// trigger for the calendar (button ID)
            align          :    "Bl",            	// alignment (defaults to "Bl")
            singleClick    :    true
        });
         Calendar.setup({
           inputField     :    "deciToDate",	// id of the input field
            ifFormat       :    "%d-%m-%Y",     	// format of the input field data
           // button         :    "img_btn_PreparedDate",// trigger for the calendar (button ID)
            align          :    "Bl",            	// alignment (defaults to "Bl")
            singleClick    :    true
        });
    </script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/chosen.jquery.js"  type="text/javascript"></script>
 <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
    </form>
    </body>
</html>