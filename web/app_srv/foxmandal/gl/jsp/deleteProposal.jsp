<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder" %>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" %>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.GenerateCertificate" %>
        <%@page import="java.util.ArrayList" %>
        <%@page import="in.cdacnoida.icmr.gl.model.glModel,in.cdacnoida.icmr.gl.adaptor.resourceBundle" %>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.EncryptPDF" %>
        <%@page import="java.io.File" %>
  <script>
  function submitfunction(){
    
      if(document.forms[0].proposal_id.value=='' || document.forms[0].duplicate_proposal_id.value=='' || document.forms[0].remarks.value=='')
     { 
     alert('All fields in the form are mandatory');
     return false;
     }else{
      document.forms[0].method="post";
      document.forms[0].action="/ICMR/app_srv/icmr/gl/jsp/deleteProposal.jsp";
      document.forms[0].submit();
     }
  }
  
  </script>
    <%
   String status="";
    if(request.getParameter("proposal_id")!=null){
        System.out.println("I have come inside java code");
        String proposal_id=request.getParameter("proposal_id").toString().trim();
        String duplicateOf=request.getParameter("duplicate_proposal_id").toString().trim();
        UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
        String deletedBy=_userinfo.getStrUserID();
        String remarks=request.getParameter("remarks").toString();
        String duplicate_query="";
        DBQueryManager dbq=new DBQueryManager();
        String check_query="select count(*) from tdc_po_proposal_tracker where num_proposal_id='"+proposal_id+"' and str_version_id='A1'";
        String counter=dbq.fetchSingleData(check_query);
        String check_status_query="select count(*) from tdc_abstract_version_dtl where num_proposal_id='"+proposal_id+"' and str_version_id='A1' and str_status not in ('N','IE')";
       String counter2=dbq.fetchSingleData(check_status_query);
       System.out.println("outside if block");
       //check if the proposal to be deleted is not assigned to any PO and it exists only in the N-'new', IE-'in review with allocator' stage
        if(counter.equals("0") && counter2.equals("0")){   
        System.out.println("inside if block");
            duplicate_query="insert into tdc_abstract_version_dtl_duplicate (num_proposal_id,dt_version_date,num_manpower_req ,str_status, str_remarks, str_tr_user_id, dt_tr_date, str_version_id,num_duration_of_project,num_total_cost,str_major_discipline,str_objective,str_expected_outcome,num_duration_collect_data,num_duration_analyze_data,dt_decision_date,last_date_fullprop) "+
            "(select num_proposal_id,dt_version_date,num_manpower_req ,str_status, str_remarks, str_tr_user_id, dt_tr_date, str_version_id,num_duration_of_project,num_total_cost,str_major_discipline,str_objective,str_expected_outcome,num_duration_collect_data,num_duration_analyze_data,dt_decision_date,last_date_fullprop from tdc_abstract_version_dtl where num_proposal_id='"+proposal_id+"' and str_version_id='A1')#@#"+
           
            "insert into tdc_prop_publishing_duplicate (prop_id,ver_id,author,title,journal_details,year,serial_num) "+
            "(select prop_id,ver_id,author,title,journal_details,year,serial_num from tdc_prop_publishing where prop_id='"+proposal_id+"' and ver_id='A1')#@#"+
            
            "insert into tdc_proposal_master_duplicate (num_proposal_id,str_proposal_title,dt_proposal_submit_date,str_status,num_trematic_area_id,dt_tr_date,str_proposer_id,str_tr_user_id,str_tr_flag,num_wrk_grp_id,str_other_thematic_area,str_key_person,proposal_type,adv_id,duplicate_of,date_of_delete,remarks,deleted_by) "+
            "(select num_proposal_id,str_proposal_title,dt_proposal_submit_date,str_status,num_trematic_area_id,dt_tr_date,str_proposer_id,str_tr_user_id,str_tr_flag,num_wrk_grp_id,str_other_thematic_area,str_key_person,proposal_type,adv_id,'"+duplicateOf+"',SYSDATE,'"+remarks+"','"+deletedBy+"' from tdc_proposal_master where num_proposal_id='"+proposal_id+"')#@#"+
           
            "insert into tdc_abstract_discipline_dtl_duplicate (num_proposal_id,str_version_id,num_discipline_id,tr_date) "+
            "(select num_proposal_id,str_version_id,num_discipline_id,tr_date from tdc_abstract_discipline_dtl where num_proposal_id='"+proposal_id+"' and str_version_id='A1')#@#"+
            
            "insert into tdc_doc_dtl_duplicate (num_propsal_id,num_doc_id,dt_date_of_upload,num_doc_type_id,str_doc_name,str_version_id) "+
            "(select num_propsal_id,num_doc_id,dt_date_of_upload,num_doc_type_id,str_doc_name,str_version_id from tdc_doc_dtl where num_propsal_id='"+proposal_id+"' and str_version_id='A1')#@#"+
            
                
            "delete from tdc_abstract_version_dtl where num_proposal_id='"+proposal_id+"' and str_version_id='A1'#@#"+
            "delete from tdc_prop_publishing where prop_id='"+proposal_id+"' and ver_id='A1'#@#"+
            "delete from tdc_proposal_master where num_proposal_id='"+proposal_id+"'#@#"+
            "delete from tdc_abstract_discipline_dtl where num_proposal_id='"+proposal_id+"' and str_version_id='A1'#@#"+
            "delete from tdc_doc_dtl where num_propsal_id='"+proposal_id+"' and str_version_id='A1'#@#";
                System.out.println("duplicate_query= "+duplicate_query);
                int [] result =dbq.batchInsert(duplicate_query.split("#@#"));
        
            if(result.length>0)
              {
               String strFilePath=resourceBundle.getValueFromKey("FILEPATH");
              GenerateCertificate gencert=new GenerateCertificate("","","","","","");
              String theyear[]=proposal_id.split("-");
              String theFromPath=strFilePath+"abstract"+File.separator+theyear[0]+File.separator+proposal_id+"_A1";
              String theToPath=strFilePath+"abstract"+File.separator+"Duplicate"+File.separator+proposal_id+"_A1";
               File srcFolder = new File(theFromPath);
                File destFolder = new File(theToPath);
                gencert.copyfromSrcTodestAndDeleteSrc(srcFolder,destFolder); 
              }
              status="File deleted successfully.";
         }
         else{
         %>
             <script>
             alert("This proposal has been assigned to PO or has been processed by the Allocator");
             </script>
         <%
         }
            

}
        %>
        
    </head>
    <body style="background-color:#a3d1ff">
    <div align="center">
    <% if(!status.equals("")){%>
    <p style="color:green; font-weight:bold; font-size:14px"><%=status%></p>
    <%}%>
    <h2>Fill the form below to delete a duplicate proposal</h2>
    <p style="color:red">* Note: All Fields are mandatory</p>
    <fieldset>
    <form method="post" >
    <table width="500px" >
    <tr>
    <td>Proposal ID to be deleted: </td>
    <td><input type="text" name="proposal_id" value=""/></td>
    </tr>
    <tr>
    <td>Duplicate Proposal ID: </td>
    <td><input type="text" name="duplicate_proposal_id" value=""/></td>
    </tr>
     <tr>
    <td>Remarks: </td>
    <td><textarea name="remarks" rows="2" cols="23"></textarea></td>
    </tr>
     <tr>
    <td colspan="2"><input type="button" name="submitbtn" value="Submit" onclick="submitfunction()"/></td>
    </tr>
    </table>
    </form>
    </fieldset>
    </div>
    </body>
</html>