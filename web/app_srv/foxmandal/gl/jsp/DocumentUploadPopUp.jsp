<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.*,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*"%>
<%@ page import="in.cdacnoida.icmr.gl.model.glModel" %>
<%@ page import=" java.io.File" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/theme/home.css">
        <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <link href="/ICMR/app_srv/icmr/gl/jscss/footable/bootstrap/bootstrap.css" rel="stylesheet"/>
   <%
    String countOfDocUploaded="";
   /*Start:Retreiving docid and version id*/
   String encodedDocID="";
   String encodedDocVerID="";
   String decodedDocID="";
   String decodedDocVerID="";
   String strProposalId="";
   String strVersionId="";
   String stageID="";
   
   if(request.getParameter("strProposalId")!=null)   //Proposal id 
            strProposalId=request.getParameter("strProposalId").toString();
   if(request.getParameter("strVersionId")!=null)   //Version id 
            strVersionId=request.getParameter("strVersionId").toString();  
   if(request.getParameter("stageID")!=null)   //proposal id {
            stageID=request.getParameter("stageID").toString();                    
                         
   System.out.println("Proposal ID is "+strProposalId);         
   System.out.println("Version ID is "+strVersionId);         
   System.out.println("stageID "+stageID);         
   //Getting encoded docId
   if(request.getParameter("doc_id")!=null)   //doc id 
            encodedDocID=request.getParameter("doc_id").toString();
   else if(request.getParameter("encodedDocID")!=null)
        encodedDocID=request.getParameter("encodedDocID").toString();
        
   //Getting encoded doc version id     
          if(request.getParameter("doc_ver_id")!=null)   //doc version id
                    encodedDocVerID=request.getParameter("doc_ver_id").toString();
        else if(request.getParameter("encodedDocVerID")!=null)
                encodedDocVerID=request.getParameter("encodedDocVerID").toString();
   
                    decodedDocID= DataEncoder.decode(encodedDocID);
                    System.out.println("encoded docID is"+encodedDocID+"decoded is:"+decodedDocID);
                    
            decodedDocVerID = DataEncoder.decode(encodedDocVerID);
    System.out.println("encoded docID version is"+encodedDocVerID +"decoded is:"+decodedDocVerID);
    /*End:Retreiving docid and version id*/

    DBQueryManager  _dbq= new DBQueryManager();
    String qryForDetailsOfDocument="";
    ArrayList listDetailsOfDocument=new ArrayList();
    qryForDetailsOfDocument="SELECT tpm.str_proposal_title,tpm.num_proposal_id,decode(csdm.scheme_id,1,'EMR',2,'Seminar'), "+//2 "+//1
  " doc_name,to_char(nvl(cprd.duration_from,sysdate),'dd-Month-yyyy'),to_char(nvl(cprd.duration_to,sysdate),'dd-Month-yyyy'),"+  //5
 " to_char(nvl(cprd.upload_last_date,sysdate),'dd-Month-yyyy'),'F1',nvl(cdtm.size_allowed,0),nvl(cdtm.no_of_pages_allowed,0),   "+ //9
   "nvl(cpud.status,'R'), cprd.doc_type_id, cdtm.format_allowed "+ //12
   "FROM proposal_doc_required_document cprd, proposer_doc_uploads_details cpud, tdc_proposal_master tpm, scheme_documents_master csdm,document_type_master cdtm "+
   "where cprd.num_proposal_id=tpm.num_proposal_id "+
   "and cprd.doc_type_id=csdm.doc_type_id "+
   "and cprd.doc_id=cpud.doc_id "+
   "and csdm.doc_type_id =cdtm.doc_type_id and tpm.scheme_id=csdm.scheme_id "+
   "and  cprd.doc_id="+decodedDocID+" ";

   System.out.println("\n qryForDetailsOfDocument \n"+qryForDetailsOfDocument+"\n");
   listDetailsOfDocument =_dbq.fetchData(qryForDetailsOfDocument);
   System.out.println("Size :"+listDetailsOfDocument.size());
   System.out.println("Document Format ID is :"+listDetailsOfDocument.get(11).toString());
   
    %>
         
        
        <script language="JavaScript" type="text/javascript">
function check_file_Resume()
{
//alert("inside check file resume function");
var resumeFile = "";
resumeFile = document.forms[0].documentToBeUploaded.value;
if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload the documents with .pdf extension only ");
                 document.forms[0].documentToBeUploaded.value="";
                document.forms[0].documentToBeUploaded.focus();
                 return false;
          }
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
        if(document.forms[0].documentToBeUploaded.value=="" || document.forms[0].documentToBeUploaded.value==null )
        {
        alert("Please select document to be uploaded");
        document.forms[0].documentToBeUploaded.focus();
        return false;
        }
       else if(document.forms[0].remarks.value==""){   //remarks renamed to Document Summary
       alert("Please enter document summary for this document");
       document.forms[0].remarks.focus();
       return false;
       }
        else{
        document.forms[0].hmode.value="uploadDocument";
        document.forms[0].method="post";
        document.forms[0].action="/ICMR/decisionOnUploaded.do";
        document.forms[0].submit();  
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
      var pid = document.forms[0].docFormatId.value;
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strFileType=doc&strProposalId=" + pid;
      document.forms[0].submit();
  }
    </script>
    </head>
    <body style="background:none">
    <html:form  method="post" action="/decisionOnUploaded.do" enctype="multipart/form-data">
    
    <input type="hidden" name="hmode" />
    <input type="hidden" name="docFormatId" value="<%=listDetailsOfDocument.get(11).toString()%>" />
    <html:hidden property="strProposalId"  styleId="strProposalId" value="<%=listDetailsOfDocument.get(1).toString()%>"></html:hidden>
    <html:hidden property="documentName"  styleId="" value="<%=listDetailsOfDocument.get(3).toString()%>"></html:hidden>
    <html:hidden property="strVersionId"  styleId="strVersionId" value="<%=listDetailsOfDocument.get(7).toString()%>"></html:hidden>
    <html:hidden property="maxSize"  styleId="" value="<%=listDetailsOfDocument.get(8).toString()%>"></html:hidden>
    <html:hidden property="maxNoOfPages"  styleId="" value="<%=listDetailsOfDocument.get(9).toString()%>"></html:hidden>
    <html:hidden property="stageID" styleId="stageID" value="<%=stageID%>"></html:hidden><!-- stageID-->
    <html:hidden property="encodedDocID"  styleId="encodedDocID" value="<%=encodedDocID%>"></html:hidden>
    <html:hidden property="encodedDocVerID"  styleId="encodedDocVerID" value="<%=encodedDocVerID%>"></html:hidden>
    <html:hidden property="docIdToUpload"  styleId="docIdToUpload" value="<%=decodedDocID%>"></html:hidden>
    <html:hidden property="doc_version_id"  styleId="doc_version_id" value="<%=decodedDocVerID%>"></html:hidden>
    <div align="center">
    <%  System.out.println("listDetailsOfDocument.size() :"+listDetailsOfDocument.size());
    if(listDetailsOfDocument.size()>0){
    System.out.println("Inside if :");%>
    <table align="center" class="data" width="100%">
    <thead>
    <tr>
    <th width="100%" colspan="2"><font size="4"><b>Upload Documents</b></font></th>
    </tr>
    </thead>
    
    <tr>
    <td style="width:25%" align="left"><b>Proposal title:</b></td>
    <td style="width:75%" align="left"><%=listDetailsOfDocument.get(0).toString()%></td>
    </tr>
    <tr>
    <td  style="width:25%" align="left">
<b>Proposal ID</b>
</td>
    <td style="width:75%" align="left">
    <%=listDetailsOfDocument.get(1).toString()%>
    </td>
    </tr>
    <tr>
    <td style="width:25%" align="left">
<b>Version ID</b>
</td>
    <td style="width:75%" align="left">
    <%=listDetailsOfDocument.get(7).toString()%>
    </td>
    </tr>
    
    <tr>
    <td style="width:25%" align="left">
<b>Document Name</b>
</td>
<td style="width:75%" align="left">
<%=listDetailsOfDocument.get(3).toString()%>
</td>
</tr>
<tr>
<td style="width:25%" align="left">
<b>Last Date to Upload :</b>
   </td>
   <td style="width:75%" align="left">
   <%=listDetailsOfDocument.get(6).toString()%> 
   </td>
    </tr>
<% if (!listDetailsOfDocument.get(8).equals("0")) {%>   <!--Some limit is present,show the limit -->
<tr>    
    <td style="width:25%" align="left"><b>Maximum size allowed</b> </td>
    <td style="width:75%" align="left"><%=listDetailsOfDocument.get(8).toString()%> M.B.</td>
    </tr>
    <%}%>
    
    <% if (!listDetailsOfDocument.get(9).equals("0")) {%>    <!--Some limit is present,show the limit -->
    
    <tr>
    <td style="width:25%" align="left"><b>Maximum number of pages allowed</b> </td>
    <td style="width:75%" align="left"><%=listDetailsOfDocument.get(9).toString()%> pages</td>
    </tr>
    <%}%>
    
   <%
System.out.println("File Status is outside if:"+listDetailsOfDocument.get(12).toString());
if(listDetailsOfDocument.get(12).toString().equals("Y"))
{ 
%>
    <tr>
    <td style="width:25%" align="left">
<b>Download Format for this Document</b>
</td>
<td style="width:75%" align="left">
<a style="text-align:center;font-size:11;" id='view_doc_format' class="hyplinks" onclick="callFileFormat()">Document Format</a>
</td>
</tr>  
<%}%>
 <tr>
<td style="width:25%" align="left"><b>Upload Document:</b> <font color="Maroon">*</font>
</td>
<td style="width:75%" align="left">
<html:file property="documentToBeUploaded" onchange="check_file_Resume();"  styleId="documentToBeUploaded" title="Upload Document" ></html:file>                                
<span style="color:red">(pdf  only)</span><br/>

<% if (!(listDetailsOfDocument.get(10).toString().equals("R") || listDetailsOfDocument.get(10).toString().equals("NR"))) {%>      <!-- already uploaded doc is present-->
<a style="text-align:center;font-size:11;" id='view_doc' class="hyplinks" onclick="callfile()">View Previously Uploaded Document</a>
<%}%>
</td> 
</tr>
<tr style="width:25%" align="left">
<td style="width:25%" align="left">
<b>Document Summary<font color="Maroon">*</font></b>
</td>
<td style="width:75%" align="left">
 <html:textarea rows="5" cols="50" property="remarks" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPAdd,300)"></html:textarea> 
</td>
</tr>    
<tr>    
    <td align="center" width="100" colspan="2" > 
    <input type="button" value="Upload"  onclick="submit_form()" />
    &nbsp;&nbsp;&nbsp;
    <input type="button" value="Go Back" onclick="close_window()" />
    </td>
    </tr>
    </table>
    <%}else{%>
<p>No Data to view</p>
<%}%>
    </div>
    
    <br/>
<p style="text-align:left"><strong>Note:In case of multi centric project, the documents have to be uploaded after merging them into a single file.</strong></p>
     </html:form> 
    </body>
</html>
