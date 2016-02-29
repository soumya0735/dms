<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.*,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*"%>
<%@ page import="in.cdacnoida.icmr.gl.model.glModel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/theme/home.css">
    <script type="text/javascript">
    function callFileFormat(theField) {
      var pid =theField.id;
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strFileType=doc&strProposalId=" + pid;
      document.forms[0].submit();
  }
    </script>
   <%
    DBQueryManager  _dbq= new DBQueryManager();
               ArrayList docDtlList=new ArrayList();

  String propDocDtlQry="select dtm.doc_type_id, nvl(dtm.doc_name,'-') "+ //1
" ,nvl(dtm.doc_short_name,'-') , "+  //2
" nvl(dtm.doc_description,'Not Available'), "+ //3
" get_stages_name(dtm.doc_type_id),get_stage_id(dtm.doc_type_id),dtm.format_allowed "+ //6
" FROM document_type_master dtm, scheme_documents_master sdm where "+
" dtm.doc_type_id=sdm.doc_type_id and sdm.is_valid=1  order by ( select a from  ( select num_seq_no a from tdc_stage_master where num_stage_id in ( get_stage_id(dtm.doc_type_id)) order by num_seq_no) where rownum=1 ), dtm.doc_name ";
                 System.out.println("propDocDtlQry  "+propDocDtlQry);
                               docDtlList=_dbq.fetchData(propDocDtlQry);       
%>        
    </head>
    <body>
        <html:form  method="post" action="/decisionOnUploaded.do">
                    <table class="data" > 
                        <thead >
                        <tr>
                        <th align="center" colspan="10" style="font-size:large;" >Documents For Codal Formalities</th>
                        </tr>
                             <tr>
                             <th>S.No.</th>   <!-- to show serial number -->
                             <th>Doc Name</th>   <!-- Name of required document -->
                             <th>Doc Description</th>   <!-- starting date to upload document -->
                             <th>Required at</th> <!-- end date till the document can be uploaded -->
                             <th width="10%">Format</th> <!-- last date to upload document if document is not uploaded till last date -->
                            </tr>
                        </thead>   
                        <tbody>
                             <%
                                int row_num=0;
                                String from_date="";   //to store from_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String to_date="";//to store to_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String last_date="";//to store last_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String isDocRequired="";
                                for(int noOfDocs=0;noOfDocs<docDtlList.size();noOfDocs=noOfDocs+7){ //iterate doc details%>
    <tr>
    <td><label>&nbsp;<%=++row_num%></label></td>
    
    <td align="left"> <label><%=docDtlList.get(noOfDocs+1).toString()%> ( <%=docDtlList.get(noOfDocs+2).toString()%> )</label><!--doc_name --></td>
    <td align="left"> <label><%=docDtlList.get(noOfDocs+3).toString()%></label><!--doc_description --></td>
    <td align="left"> <label><%=docDtlList.get(noOfDocs+4).toString()%></label><!--doc_required at --></td>
    <td align="left">
    <%
if(docDtlList.get(noOfDocs+6).toString().equals("Y"))
{
%>
    <a style="text-align:center;font-size:11;" id="<%=docDtlList.get(noOfDocs).toString()%>"  name='view_doc_format' class="hyplinks" onclick="callFileFormat(this)">Format</a> 
   <% }else{ %>
   &nbsp;
   <%}%>
   </td>
    </tr>
    <%}%>
    </tbody>
</table>   
</html:form>
    </body>
</html>
