<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.*,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*"%>
<%@ page import="in.cdacnoida.icmr.gl.model.glModel" %>
<%@ page import=" java.io.File" %>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.js" language="JavaScript" type="text/javascript"></script>    
    <link href="/ICMR/app_srv/icmr/gl/theme/calendar-win2k-cold-1.css" rel="stylesheet" type="text/css">
    <script src="/ICMR/app_srv/icmr/gl/jssrc/datepickupNew.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar.js"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-setup.js"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-en.js"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/userReg.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script> 
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/html5shiv.min.js"></script> 
    <link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/theme/font-awesome.css"/>
    <link href="/ICMR/app_srv/icmr/gl/jscss/footable/bootstrap/bootstrap.css" rel="stylesheet"/>
  <%
    /*Start:Retreiving docid and version id*/
     String encodedDocID="";
   String encodedDocVerID="";
     String decodedDocID="";
   String decodedDocVerID="";
   String strProposalId="";
   String strVersionId="";
   String check="";
   String date="";
   String fdate="";
   String tdate="";
   String ldate="";
   String whichdate="";
   String status="";
   String stageID="";
   String strDecisionMailText="";   
   if(request.getParameter("check")!=null)   
   check=request.getParameter("check").toString();
   
   if(request.getParameter("status")!=null)   
   status=request.getParameter("status").toString();

    if(request.getParameter("date")!=null)   
    date=request.getParameter("date").toString();
    
    if(request.getParameter("stageID")!=null)   //proposal id {
    stageID=request.getParameter("stageID").toString();                    
    
    if(request.getParameter("whichdate")!=null) 
    whichdate=request.getParameter("whichdate").toString();
    
   if(request.getParameter("strProposalId")!=null)  //Proposal id 
   strProposalId=request.getParameter("strProposalId").toString();
            
   if(request.getParameter("strVersionId")!=null)   //Version id 
   strVersionId=request.getParameter("strVersionId").toString();  
            
   if(request.getParameter("doc_id")!=null)   //doc id 
   encodedDocID=request.getParameter("doc_id").toString();
   decodedDocID= DataEncoder.decode(encodedDocID);
   System.out.println("encoded docID is"+encodedDocID+"decoded is:"+decodedDocID);
                    
   if(request.getParameter("doc_ver_id")!=null)   //doc version id
   encodedDocVerID=request.getParameter("doc_ver_id").toString();
   decodedDocVerID = DataEncoder.decode(encodedDocVerID);
    System.out.println("encoded docID version is"+encodedDocVerID +"decoded is:"+decodedDocVerID);
    
    DBQueryManager  _dbq= new DBQueryManager();
    ArrayList listDetailsOfDocument=new ArrayList();
    String qryForDetailsOfDocument="";
   qryForDetailsOfDocument="SELECT nvl(tpm.str_proposal_title,'Not Available'),nvl(tpm.num_proposal_id,'Not Available'),to_char(nvl(cprd.upload_last_date,sysdate),'dd-mm-yyyy'),nvl(doc_name,'Not Available'),to_char(nvl(cprd.duration_from,sysdate),'dd-mm-yyyy'),to_char(nvl(cprd.duration_to,sysdate),'dd-mm-yyyy'),to_char(nvl(tpm.decision_date,sysdate),'dd-Month-yyyy'),'F1',decode(csdm.period,'O','One Time','P','Periodically','Not Available'),nvl(csdm.duration,'0'), nvl(cpud.status,'R'),(case when cpud.upload_date is null then 'NA' else to_char(cpud.upload_date,'dd-mm-yyyy') end)  "+
   "FROM proposal_doc_required_document cprd , tdc_proposal_master tpm, scheme_documents_master csdm,document_type_master cdtm, proposer_doc_uploads_details cpud "+
   "where cprd.num_proposal_id=tpm.num_proposal_id "+
   "and cprd.doc_type_id=csdm.doc_type_id "+
   "and cprd.doc_id=cpud.doc_id "+
   "and csdm.doc_type_id =cdtm.doc_type_id and tpm.scheme_id=csdm.scheme_id "+
   "and  cprd.doc_id="+decodedDocID;
   
   System.out.println("\n qryForDetailsOfDocument \n"+qryForDetailsOfDocument+"\n");
   listDetailsOfDocument =_dbq.fetchData(qryForDetailsOfDocument);
   System.out.println("Size :"+listDetailsOfDocument.size());
    
    /*Mail Text  */
  
    %>

    <script language="JavaScript" type="text/javascript">
function setMailContent(){
    var emailText=document.forms[0].strDecisionMailText.value;
    //To set content in mail text box
    $('#editor').html(emailText);
     
}

function MyCalander() 
    {
    
    Calendar.setup( {
                        inputField :"newDate", // id of the input field
                        ifFormat : "%d-%m-%Y", // format of the input field data
                        align : "Bl", // alignment (defaults to "Bl")
                        onfocus : true
                        
                    });    
    }

    function attachDocs(){    
    if(document.getElementById('attachDocument').checked==true)
  {
  document.getElementById('emailDiv').style.display='block';
  }
  else
  {
    document.getElementById('emailDiv').style.display='none';
 }
}
        function close_window()
        {
        var proposal_id=document.forms[0].strProposalId.value;
            var version_id=document.forms[0].strVersionId.value;
            var stageID="<%=stageID%>";
            document.forms[0].hmode.value="unspecified";
            document.forms[0].method="post"; 
            document.forms[0].action="/ICMR/decisionOnUploaded.do?strAbstractID="+proposal_id+"&strVersionID="+version_id+"&stageID="+stageID;
            document.forms[0].submit();
        
        }
        
        function submit_form()
        {
        var check="<%=check%>"; 
        //Setting value of mail text in hidden field available in editor.jsp.This field will be used in java file as a request
         if(document.getElementById('attachDocument').checked==true)
        {        
        var mailText=$('#editor').html();
        $('#mailText').val(mailText);
        }
        //Ends
        if(check=="date")
        {
        if(document.forms[0].newDate.value=="")
        {
        alert("Please enter new date to update");
        document.forms[0].newDate.focus();
        return false;
        }
        else if(document.forms[0].remarks.value==""){
       alert("Please Enter Remarks for this document");
       document.forms[0].remarks.focus();
       return false;
       }
         else{
        document.forms[0].hmode.value="saveDecision";
        document.forms[0].method="post";
        document.forms[0].action="/ICMR/decisionOnUploaded.do";
        confirmation = confirm("Do you want to proceed with this decision?");
            if(confirmation == true)
            {
                document.forms[0].submit();  
            }
            else
            {
                return false;
            }       
          }
        }
        else{
        if(document.forms[0].decision.value=="-1")
        {
        alert("Please select Decision to be taken on this document");
        document.forms[0].documentToBeUploaded.focus();
        return false;
        }
       else if(document.forms[0].remarks.value==""){
       alert("Please Enter Remarks for this document");
       document.forms[0].remarks.focus();
       return false;
       }
        else{
        document.forms[0].hmode.value="saveDecision";
        document.forms[0].method="post";
        document.forms[0].action="/ICMR/decisionOnUploaded.do";
        confirmation = confirm("Do you want to proceed with this decision?");
             if(confirmation == true)
            {
                document.forms[0].submit();  
            }
            else
            {
                return false;
            }       
            }
          }
        }
        
function callfile() 
  {
    var strProposalId="<%=strProposalId%>";
    var strVersionId="<%=strVersionId%>";
    var docID = "<%=decodedDocID%>";
    var docVerID = "<%=decodedDocVerID%>";
    var fileType="uploadedDoc";
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strDocId="+docID+"&strDocVersionId="+docVerID+"&strProposalId="+strProposalId+"&strFileId="+strVersionId+"&strFileType="+fileType;
      document.forms[0].submit();
  }  
  
  function callFileFormat(theField) {
      var pid = document.forms[0].docIdToUpload.value;
      alert(pid);
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strFileType=doc&strProposalId=" + pid;
      document.forms[0].submit();
  }
  
  function checkDate()
  {
        var date1;
        var date2;
        var date3;
        var date4;
        var fdate="";
        var tdate="";
        var ldate="";
        var newDate="";
        var from_date="";
        var to_date="";
        var last_date="";
        var new_date="";
        var whichdate="";

        fdate=document.forms[0].fDate.value;
        tdate=document.forms[0].tDate.value;
        ldate=document.forms[0].lDate.value;
        newDate=document.forms[0].newDate.value;
        whichdate=document.forms[0].whichdate.value;
        
        from_date=fdate.split("-");
        to_date=tdate.split("-");
        last_date=ldate.split("-");
        new_date=newDate.split("-");
        
        
        date1=new Date((from_date[2]),(from_date[1]-1),(from_date[0]));
        date2=new Date((to_date[2]),(to_date[1]-1),(to_date[0]));
        date3=new Date((last_date[2]),(last_date[1]-1),(last_date[0]));
        date4=new Date((new_date[2]),(new_date[1]-1),(new_date[0]));

        if((whichdate=="From") && (date4 > date2 || date4 > date3))
        {
        alert("From date should not be greater than To Date or Last date to upload");
        document.forms[0].newDate.value="";
        document.forms[0].newDate.focus();
        return false;
        }
        else if((whichdate=="To") && (date4 < date1 || date4 > date3))
        {
        alert("To date should neither be greater than Last Date to upload nor be less than From Date");
        document.forms[0].newDate.value="";
        document.forms[0].newDate.focus();
        return false;
        }
        else if((whichdate=="Last") && (date1 > date4 || date2 > date4))
        {
        alert("Last Date to upload should not be Less than From and To Date");
        document.forms[0].newDate.value="";
        document.forms[0].newDate.focus();
        return false;
        }
        else
        {
        return true;
        }
  }
    </script>
    </head>
    
    <% if (request.getAttribute("decisionStatus")!=null )
          { %>
        <script  type="text/javascript" language="javscript">
        alert ("Decision on the document has been successfully saved");
                window.close();
        </script>
           <%}
        %>
    
    <body onload="setMailContent();document.form.reset();" style="background:none">
    
    <html:form  method="post" action="/decisionOnUploaded.do">
      
    <input type="hidden" name="hmode" />
    <html:hidden property="strProposalId"  styleId="strProposalId" value="<%=listDetailsOfDocument.get(1).toString()%>"></html:hidden>
    <html:hidden property="strVersionId"  styleId="strVersionId" value="<%=listDetailsOfDocument.get(7).toString()%>"></html:hidden>
     <html:hidden property="docIdToUpload"  styleId="docIdToUpload" value="<%=decodedDocID%>"></html:hidden>
    <html:hidden property="doc_version_id"  styleId="doc_version_id" value="<%=decodedDocVerID%>"></html:hidden>
    <html:hidden property="encodedDocID"  styleId="encodedDocID" value="<%=encodedDocID%>"></html:hidden>
    <html:hidden property="encodedDocVerID"  styleId="encodedDocVerID" value="<%=encodedDocVerID%>"></html:hidden>
    <html:hidden property="stageID" styleId="stageID" value="<%=stageID%>"></html:hidden><!-- stageID-->
    <html:hidden property="check"  styleId="date" value="<%=check%>"></html:hidden>
    <html:hidden property="whichdate"  styleId="whichdate" value="<%=whichdate%>"></html:hidden>
    <div align="center">
<%
System.out.println("listDetailsOfDocument.size() :"+listDetailsOfDocument.size());
if(listDetailsOfDocument.size()>0){
  strDecisionMailText=strDecisionMailText+"Dear Sir,"+
    "<br><b>Proposal ID :</b> "+strProposalId+
    "<br><b>Version  ID :</b> "+strVersionId+
    "<br><b>Proposal Title : </b>"+listDetailsOfDocument.get(0).toString()+
    "<br><b>Document Name : </b>"+listDetailsOfDocument.get(3).toString()+
    "("+listDetailsOfDocument.get(4).toString()+" to "+listDetailsOfDocument.get(5).toString()+")"+
    "<br>Regards ICMR.";
%>    
    <table align="center" class="data" width="100%">
    <thead>
    <tr>
    <th width="100%" colspan="2"><font size="4"><b>Decision </b></font></th>
    </tr>
    </thead>
    <tr>
    <td width="25%" align="left">
    <b>Proposal Title</b>
    </td>
    <td width="75%" align="left">
    <%=listDetailsOfDocument.get(0).toString()%>
    </td>
    </tr>
    <tr> 
    <td width="25%" align="left">
    <b>Proposal ID</b>
    </td>
    <td width="75%" align="left">
<%=listDetailsOfDocument.get(1).toString()%>
</td>
</tr>
<tr>
<td width="25%" align="left">
<b>Version ID</b>
</td>
<td width="75%" align="left"> 
<%=listDetailsOfDocument.get(7).toString()%> 

</td>
</tr>  
<tr>
<td width="25%" align="left">
<b>Document Name</b>
</td> 
<td width="75%" align="left">
<%=listDetailsOfDocument.get(3).toString()%> 
</td>
</tr>
<%if(listDetailsOfDocument.get(8).toString().equals("P")){ %>
<tr width="25%" align="left">
<td>
<b>Document Duration</b>    
</td> 
<td width="75%" align="left">
<%=listDetailsOfDocument.get(4).toString()%> to <%=listDetailsOfDocument.get(5).toString()%>
</td>
</tr>    
<% } %>
<%if(check.equals("date")){%>
<tr>
<td width="25%" align="left">
<% if(whichdate.equals("Last")){ %>
<b>Previous Last Date to Upload  </b> 
<%}else{%>
<b>Previous (<%=whichdate%>) Date </b> 
<%}%>
</td>
<td width="75%" align="left">
<%=date%>
</td>    
</tr>
<tr>
<td width="25%" align="left">
<% if(whichdate.equals("Last")){ %>
<b>Enter New Last Date to Upload </b> 
<%}else{%>
<b>Enter New (<%=whichdate%>) Date </b> 
<%}%>
</td>
<td width="75%" align="left">
<html:text styleId="newDate" property="newDate" value="<%=date%>" onfocus="MyCalander(this);" onblur="date_val(this);checkLen(this,10);checkDate();" ></html:text>
</td>    
</tr>
<%}else{%>
<% if (!(listDetailsOfDocument.get(10).toString().equals("R") || listDetailsOfDocument.get(10).toString().equals("NR"))) {%>      <!-- already uploaded doc is present-->
<tr>
<td width="25%" align="left">  
<b>View Uploaded Document</b>
</td>
<td width="25%" align="left">    
<a style="text-align:center;font-size:12px;" id='view_doc' class="hyplinks" onclick="callfile()">Uploaded Document</a>
<span style="font-size:12px;">uploaded on <%=listDetailsOfDocument.get(11).toString()%></span>
</td>
</tr>
<%}%>
<tr>
<td width="25%" align="left">    
<b>Decision</b>
</td>
<td width="75%" align="left">
<html:select property="decision">  <!-- check the values of the option -->
<% if(status.equals("NR")){ %>
<option value="-1" selected="selected">Select</option>
<html:option value="R">Required</html:option>
<%}else if(!status.equals("R")){ %>
                           <option value="-1" selected="selected">Select</option>
                            <html:option value="Y">Accept</html:option>
                            <html:option value="RE">Re-submit</html:option>
                             <html:option value="NR"> Not Required</html:option>
<%}else{%>
<option value="-1" selected="selected">Select</option>
<html:option value="NR"> Not Required</html:option>
<%}%>
                        </html:select>
</td>
</tr>
<%}%>
<tr>
<td width="25%" align="left">
<b>Remarks</b>  
</td>
<td width="75%" align="left">
<html:textarea rows="3" cols="50" property="remarks" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPAdd,300)"></html:textarea> 
</td>
</tr>
<!-- Mail Text STARTS HERE -->
<tr>
   <td align="left" colspan="2"><div id="chkbxonTechApprov">
   <span class="formlabels" style="color:red"><strong><input type="checkbox" name="attachDocument" id="attachDocument" value="1" onclick="attachDocs()" /> Send mail to PI ?  </strong></span> 
   </div>
   </td>
   </tr>
    <tr>
        <td colspan="2">
        <div id="emailDiv" style="display:none">
        Mail Text: 
        <%@include file="/app_srv/icmr/gl/jsp/editor.jsp"%>
        </div></td>
    </tr>

<tr>
<td colspan="2" align="center">
<input type="button" value="Submit"  onclick="submit_form()"></input>
&nbsp;&nbsp;&nbsp;

<input type="button" value="Go Back" onclick="close_window()"></input>
</td>
</tr>
</table>   
<%}else{%>
<p>No Data to view</p>
<%}%>
</div>
<input type="hidden" name="strDecisionMailText" value="<%=strDecisionMailText%>">
<input type="hidden" name="fDate" value="<%=listDetailsOfDocument.get(4).toString()%>">
<input type="hidden" name="tDate" value="<%=listDetailsOfDocument.get(5).toString()%>">
<input type="hidden" name="lDate" value="<%=listDetailsOfDocument.get(2).toString()%>">
   </html:form> 
    </body>
</html>