<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,java.util.*,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*;"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
function loadStateUserLocal(strEvent)
{
        var selected=document.forms[0].stateId.value;
        var url="";
        var url1="";
        //alert(document.forms[0].state.value);
        //alert(document.forms[0].user_id.value);
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
						partOption1.innerText="-Select City-";
						partOption1.text="-Select City-";
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
 */
 function loadMajDis()
{
    var selected=document.forms[0].thematicAreaId.value;
    var url="";
      if(selected!= null)
        url="abstractsubmission.do?hmode=getDecipline&matType="+selected;   
    else
       return false;	
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
                http_request4.open("GET", url, true);
                http_request4.onreadystatechange = loadUomData1;
                http_request4.send(null);
    }
/**
 * 
 */
function loadUomData1()
{

var frm=document.forms[0];
	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
			 var o=document.getElementById("maj_area");
			len=o.childNodes.length;

			for(var rem=len;rem>1;rem--){
                            //alert("more");
                            o.removeChild(o.childNodes[rem-1]);
                            //alert("mor43434e");
			}	
                        partOption1=document.createElement("option");
						partOption1.value="%";
						partOption1.innerText="- All Major Area -";
						partOption1.text="- All Major Area -";
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
				if(document.forms[0].multiDis.value!="a")
                                 document.forms[0].maj_area.value=document.forms[0].multiDis.value;
                               
                                 
				}
		}
}

   
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
   
function getReport()
{
var subFromDate=document.forms[0].subFromDate.value;
var subToDate=document.forms[0].subToDate.value;

        if(compareDate(subFromDate,subToDate)){
            document.forms[0].method="post";
          document.forms[0].action="/ICMR/generatejasper.do?hmode=getExpertReport";
     
          document.forms[0].submit();        
        }else{
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
      document.forms[0].action="/ICMR/expertReport.do";
      document.forms[0].submit();
   }
    </script>
    </head>
    <body>
     <%    String strQuery = ""; 
    String strState="";
    String strThemAreaQuery="";
   DBQueryManager  _dbq= new DBQueryManager();
    List arrlistStatelist = new ArrayList();
    strQuery="Select NUM_STATE_ID,STR_STATE_NAME from TDC_STATES order by STR_STATE_NAME";
    strThemAreaQuery="select num_thematic_area_id,str_thematic_area_name from tdc_thematic_area_master";
    %>
    <form name="frm" method="POST" action="" >
    <input type="hidden" name="user_id" value="" />
    
     <div align="center">
    <fieldset style="width:95%;">
    
    <table width="90%" class="innerdata" align="center">
      <tr><td colspan="2" align="center"><font size="4" face="Verdana" ><strong>Experts/PO Monitoring Report</strong></font></td></tr>  
   
      <tr>
        <td colspan="2" align="center">
            <input type="radio" id="strExpert" name="strExpert" value="E" checked="checked"><b>Expert</b></input>
            <input type="radio" id="strExpert" name="strExpert" value="P"><b>Program Officer</b></input>
         </td> 
      </tr>

 <tr>
     <td width="200"><font size="3" face="Verdana" > Proposal Assigned Between :</font></td>
     <td width="250"><input type="text"  id="subFromDate"  name="subFromDate" value="" onblur="days_between_future(this);isDate(this);" /><font size="3" face="Verdana" > To </font>
     <input type="text" id="subToDate" name="subToDate"    value="" onblur="days_between_future(this);isDate(this);" /></td>
 </tr>
 
 <tr>
      <td width="200"><font size="3" face="Verdana">Proposal Submitted In</font></td>
      <td width="250">
      <select id="thematicAreaId" name="thematicAreaId" onchange="loadMajDis()">
      <option value="%">All Broad Areas</option>
      <% arrlistStatelist=_dbq.fetchData(strThemAreaQuery);
      for(int ii=0;ii<arrlistStatelist.size();ii=ii+2)
                  { 
                  %>
                  <option value="<%=arrlistStatelist.get(ii)%>" ><%=arrlistStatelist.get(ii+1)%> </option> 
                  <% }
                  %>
      </select>
      </td>
      </tr>
      
      <tr>
      <td width="200"></td>
      <td width="250">
      <select id="maj_area" name="maj_area" >
      <option value="%">All Major Discipline</option>
      </select>
      </td>
      </tr>
      <tr>
        <td width="200"><font size="3" face="Verdana">Report Format </font></td>
              <td width="250">
          <input type="radio" id="strFromat" name="strFormat" value="E" checked="checked">Excel</input>
      <input type="radio" id="strFromat" name="strFormat" value="P">Pdf</input>
      <input type="radio" id="strFromat" name="strFormat" value="H">HTML</input>
         </td> 
      </tr>
  <tr><td align="center" colspan="2">
  <input type="BUTTON" name="B1" value="Generate Report"  onclick="getReport();"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    
    </script>
    </form>
    </body>
</html>