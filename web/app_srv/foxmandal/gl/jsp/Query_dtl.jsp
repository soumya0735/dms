<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.lang.*,java.util.*,in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.Date,java.text.SimpleDateFormat" %>
<script src="/ICMR/app_srv/icmr/gl/jssrc/jquery-1.9.1.min.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
<script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>     
<link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home_2.css"></link>

<%
 
/* Start :retrieve user type */
UserInformation _userInfo=(UserInformation)session.getAttribute("userInfo");
String strUserType="";
strUserType=_userInfo.getStrUserType();
String userID=_userInfo.getStrUserID();
/* End: retrieve user type */

String strQueryId="";
String pid = "";
String vid= "";



if(request.getParameter("strQueryId")!=null)

  strQueryId=request.getParameter("strQueryId").toString();
//  strQueryId="1";
//String versionID="A1";
 String abstractID=request.getParameter("abstractID");
 String versionID=request.getParameter("versionID");

    DBQueryManager _dbqJsp=new DBQueryManager();
    String strQueryDtl="SELECT to_char(qr.query_dt,'dd-mm-yyyy'),get_user_name(qr.query_by),get_user_name(qr.query_to), qr.query_subject,qr.application_id ,qr.str_version , "+
    " msg.msg_dtl,query_flag from tdc_query_master qr,tdc_query_message_dtl msg where qr.query_id='"+strQueryId+"' and qr.query_id=msg.query_id and msg.parent_msg_id is null";
                   
             System.out.println("strQueryDtl"+strQueryDtl);             
             
             ArrayList list_quryDtl=new ArrayList();
             if(request.getParameter("strQueryId")!=null) 
             {
             try{list_quryDtl=_dbqJsp.fetchData(strQueryDtl);}
             catch(Exception e){
             }
            }
            
            
String strQuery="";
ArrayList dataList=new ArrayList();
            if(request.getParameter("strQueryId")!=null && list_quryDtl.size()>0) 
             {
 strQuery="select pm.num_proposal_id,fp.str_version_id, pm.str_proposal_title from tdc_proposal_master pm,tdc_full_proposal_version_dtl fp where "+
" pm.num_proposal_id=fp.num_proposal_id and"+
" pm.num_proposal_id='"+abstractID+"' and fp.str_version_id='"+versionID+"'";
             System.out.println("strQuery for Application details "+strQuery);                              
              try{    dataList=_dbqJsp.fetchData(strQuery); }
                  catch(Exception e){
             }
              } 
                 
                 
/*             String strModelTestingDtlQuery="";    
            if(request.getParameter("strQueryId")!=null && list_quryDtl.size()>0) 
             {                 
             strModelTestingDtlQuery="select product_model ,decode(model_tested,'Y','Tested','Not Tested'),get_lab_name(test_lab_id),"+
                                    " nvl(test_report_no,'NA'),nvl(to_char(test_dt,'dd-Mon-yyyy'),'NA'), "+
                                    " decode(test_compliance,'Y','Yes','N','No','NA') from creit_application_model_test_dtl "+
                                    " where Application_id='"+list_quryDtl.get(5).toString()+"' and str_version='"+list_quryDtl.get(6).toString()+"'";
                                    
                                    
                                    
                                    ArrayList list_modelTested=new ArrayList();
                                  
             
              try{  list_modelTested=_dbqJsp.fetchData(strModelTestingDtlQuery); }
                catch(Exception e){
             }
             
     
     }
  */               
                          
String strMessageDtl=" Select msgdtl.msg_id ,to_char(msgdtl.msg_dt, 'dd-mm-yyyy' ),msgdtl.msg_subject ,msgdtl.msg_dtl , "+ //3
 " get_user_name(msgdtl.msg_sender),msgdtl.attachment ,nvl(msgdtl.parent_msg_id,0), "+ //6
 " nvl(attchDtl.file_id,0),nvl(attchDtl.file_name,'NA')  from tdc_query_message_dtl msgdtl,  "+ //8
 " tdc_query_message_attach attchDtl  where  msgdtl.msg_id=attchDtl.msg_id(+)  "+
 " and  msgdtl.query_id='"+strQueryId+"' and msgdtl.query_id=attchDtl.query_id(+)  order by msgdtl.msg_id desc ";

                 ArrayList msgDtl_list=new ArrayList();
                    if(request.getParameter("strQueryId")!=null) 
             {
             try{msgDtl_list=_dbqJsp.fetchData(strMessageDtl);}
             catch(Exception e){
             }
                 
              }   
                 
                 /*Setting subject in query details form*/
                 String replySubject="RE:";
                 if (list_quryDtl.size()>0)
                 {
                 replySubject=replySubject+list_quryDtl.get(3).toString();}
                 
String user="";
if(request.getParameter("user")!=null)

  user=request.getParameter("user").toString();

if(user.equals("admin") && list_quryDtl.get(7).toString().equals("R")){
String qry="update tdc_query_master set query_flag='S' where query_id="+strQueryId;
_dbqJsp.insert(qry);
}


%>

<script type="text/javascript" language="javascript">

<!--

function downloadAttachment(thefield,strFileType)
{
 
 var _values=thefield.id.split("#");
 //alert("_values[0]"+_values[0]+" "+"_values[1]"+_values[1]+" "+"_values[2]"+_values[2]+" _values[3]"+_values[3]);
document.forms[0].method="post";
  document.forms[0].action="/ICMR/registrationAction.do?hmode=getFile&strProposalId="+_values[0]+"&strVersionId="+_values[1]+"&strFileType="+strFileType+"&strQueryId="+document.getElementsByName("strQueryId")[0].value +"&messageId="+_values[2]+"&fileId=1&fileName="+_values[3];
    document.forms[0].submit();
 
}

function callALLfile(thefield,strFileType)
  {
 var _values=thefield.id.split("#");
  document.forms[0].method="post";
  document.forms[0].action="/ICMR/registrationAction.do?hmode=getFile&strProposalId="+_values[0]+"&strVersionId="+_values[1]+"&strFileType="+strFileType+"&strUserId="+_values[2];
  document.forms[0].submit();
  }
  
 function formSubmit()
{
if (validate())
{
   conf=confirm("Are you sure to record your response?");
            if(conf) 
            {
document.forms[0].method = "post";
document.forms[0].action = "/ICMR/allocatorAbstract.do?hmode=replyToQuery";
document.forms[0].submit();
            return true;	
           }
           else 
           {
           return false;
           }

}
else 
{
return false;
}
}

function validate()
{
if (document.forms[0].querySubject.value=="")
{
alert ("Kindly fill the subject");
return false;
}
else if (document.forms[0].queryBody.value=="")
{
alert ("Kindly fill the details");
return false;
}
else 
return true;
}


function selfClose()
{
window.close();
}


function showQueryForm()
    {
            if(document.getElementById("divQueryForm").style.display=="none") //change the condition
      {
      document.getElementById("divQueryForm").style.display="block";
      }
      else 
    {
    document.getElementById("divQueryForm").style.display="none";
    }

    } 
  
  
  function funcGotData() {
  
      var status = "<%=request.getAttribute("status")%>";
        if (status == "ok") {   //reply sent successfully
        alert("Your reply has been sent successfully");
          window.close();
      }
    
  }
  
  function closeWindow(){
  window.close();
  }
  
  function goBack(){
       var abstractID="<%=abstractID%>";
     var versionID="<%=versionID%>";
     var userID="<%=userID%>";
     var strUserType="<%=strUserType%>";
     
     if(strUserType=="P" || strUserType=="PE"){
  location.href="/ICMR/allQueryForManu.do?strAbstractID="+abstractID+"&strVersionID="+versionID+"&strUserId="+userID;
     }
  else if(strUserType=="A" || strUserType=="O"){
  location.href="/ICMR/QueryList.do?strAbstractID="+abstractID+"&strVersionID="+versionID+"&strUserId="+userID;
  }
  }
  
   function check_file_Resume()
{
var resumeFile = "";
resumeFile = document.forms[0].queryDocs.value;
if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload the documents with .pdf extension only ");
                 document.forms[0].queryDocs.value="";
                document.forms[0].queryDocs.focus();
                 return false;
          }
    }
}
 
-->
</script>
 <script type="text/javascript">
            $(function() {
                $('.accordion_content').hide();

                $('.accordion_toggle a').click(function(e){
                    if($(this).parent().hasClass('current')) {
                        $(this).parent()
                            .removeClass('current')
                            .next('.accordion_content').slideUp();
                    } else {
                        $(document).find('.current')
                            .removeClass('current')
                            .next('.accordion_content').slideUp();
                        $(this).parent()
                            .addClass('current')
                            .next('.accordion_content').slideDown();
                    }
                    e.preventDefault();
                });
            });
            
            
        </script>
        </head>

<body onload="funcGotData();" >
  <div class="mainform">
 <div style="width:66%" class="table1">
 <span class="formheading">Query Details</span>
	<br/>
        <% if (list_quryDtl.size()>0) {%>
        <table class="data">      
        <tr><td width="30%" >Query Date:</td><td><%=list_quryDtl.get(0)%></td></tr>
        <tr><td >Query By:</td><td><%=list_quryDtl.get(1)%></td></tr>
        <tr><td >Query To:</td><td><%=list_quryDtl.get(2)%></td></tr>
        <tr><td width="30%" >Query Subject:</td><td><%=list_quryDtl.get(3)%></td></tr>
        <tr><td>Query Dtl:</td><td><%=list_quryDtl.get(6)%></td></tr>
        
       </table>
       <% }%>
 </div><!--end of table1 div-->
 
  <div class="table2">
  <span class="formheading">Proposal Details</span> 
  
  <%
  System.out.println("dataList.size()= "+dataList.size()+"list_quryDtl.size()= "+list_quryDtl.size());
  if (dataList.size()>0 && list_quryDtl.size()>0) {
  System.out.println("Inside if of Application Detail Section");
  %>
  	<table class="data">
         <tr><td>Proposal ID:</td><td><%=dataList.get(0)%></td></tr>
         <tr><td>Version ID:</td><td><%=dataList.get(1)%></td></tr>
         <tr><td>Proposal Title:</td><td><%=dataList.get(2)%></td></tr>
        </table>
        <%} %>
  </div> <!-- end of table2 div-->
 

</div><!--end of main form class-->



<!--
version 1: Individual  mail for  individual query s
Version 2: button removed :Single mail for entire application 
-->


<html:form action="/allocatorAbstract.do" enctype="multipart/form-data">

<br/><br/>
<div  id="divQueryForm" style="display:none;">
                <center><span class="formheading">Query Details</span></center> 
                
                <!--form starts-->
                <div class="mainbox">
            
                
               
               <div class="leftsubbox">

                         Subject<span class="alerttext">*</span>
              </div>
                    
                    <div class="rightsubbox">     
                    
                    <html:text readonly="true" property="querySubject" styleId="querySubject" size="30" onblur="isAlphaNumericWithApos(this);checkMaxlen(this,50);"
                    value='<%=replySubject%>'></html:text>

                    </div>
               
               <div class="leftsubbox">

                                 Details <span class="alerttext">*</span><br/>(Maximum characters:1000)
              </div>
               
               <div class="rightsubbox">

                         <html:textarea cols="35" rows="5" property="queryBody" styleId="queryBody" onblur="isAlphaNumericWithApos(this);checkMaxlen(this,1000);"/>
                      
              </div>
                    
               <div class="leftsubbox">

                         Upload Document(if any)
              </div>
               
                    <div class="rightsubbox">
                               <html:file property="queryDocs" styleId="Query_documents" onchange="check_file_Resume();"  />
                        
                            </div>
                                           
               <div class="leftsubbox"></div>
               <div class="rightsubbox">
                     <html:submit styleClass="generalButton" property="hmode" onclick="return formSubmit();">Save</html:submit></div>
               
                   <input type="hidden" name="strQueryId" value="<%=strQueryId%>" ></input> 
                   <%if (list_quryDtl.size()>0){%>
                   <input type="HIDDEN" name="pid" value="<%=list_quryDtl.get(4)%>" ></input>
                   <input type="HIDDEN" name="vid" value="<%=list_quryDtl.get(5)%>"   id="vid"></input>
                   <%}%>
                   
                
            </div>
            </div>
                <!--Query form closed -->
                                
</html:form>





<div style="float:left;width:99%;">
 <span class="formheading">Messages Details</span>
 <div style="width:100%;background-color:#e8e8e8;font-weight:bold;color:#0033CC;">
 <span style="float:left;">S.No.</span>
 <span>From</span>
  <span style="width:15%;float:right;text-align:left;">Date </span>
 </div>
 <div id="content">
		<div id="content-nav">
		<% 
                int counter=1;
                int iCount=2;
                if(msgDtl_list.size()>0)
                {
                for(int iModelCount=0;iModelCount<msgDtl_list.size();iModelCount=iModelCount+9){  %>
			<p class="accordion_toggle">
                        <span style="float:left;"><%=counter++%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <a href="#" >
                        <%=msgDtl_list.get(iModelCount+4)%> 
                        <% if(msgDtl_list.get(iModelCount+5).equals("Y")) {  %>
<img  width="20px" height="20px"  src="/ICMR/app_srv/icmr/gl/images/attachment.jpeg"></img>                        
                        <%}%></a>
                         <span style="float:right;width:15%;text-align:left;"> <%=msgDtl_list.get(iModelCount+1)%> </span>
                        </p>
			<div class="accordion_content">
				<div class="horizontal_container1">
                                <span class="togglehead">Message</span><br/>
			     <%=msgDtl_list.get(iModelCount+3)%>
                              
                              <% if(msgDtl_list.get(iModelCount+5).equals("Y")) {  %>
                              <div class="attachment">
                               <span class="togglehead">Attachment(s)</span><br/>
                               <label class="hyplinks" onclick="downloadAttachment(this,'messageAttachment')" id="<%=dataList.get(0)%>#<%=dataList.get(1)%>#<%=msgDtl_list.get(iModelCount+0)%>#<%=msgDtl_list.get(iModelCount+8)%>" ><%=msgDtl_list.get(iModelCount+8)%></label>
                                
                               <% 
                               String strMsgtoCompare="";
                               int x=1;
                               strMsgtoCompare=msgDtl_list.get(iModelCount).toString();
                               while(x==1)
                               {
                                 if(iModelCount+9 < msgDtl_list.size())
                                  {
                                    if(strMsgtoCompare.equals(msgDtl_list.get(iModelCount+9).toString()))
                                     {iModelCount=iModelCount+9;
                                     %>
                                     <div class="attach">
                                     <label class="hyplinks" ><%=msgDtl_list.get(iModelCount+8)%></label></div>
                                     <%  
                                      }
                                      else
                                      x=2;
                                 }
                                 else
                                   x=2;
                               } 
                               %>
                              </div>
                              
                              <%}%>
                                <br/><br/>
				</div>
                                  <br/><br/>
			</div>
			<%} } else { %>
                        No Message available
                        <%}%>
		</div>
	</div>
 </div>

                         
<div align="center"><br/>

<input type="button" value="Reply" onclick="showQueryForm()"/>
<input type="button" value="Close" onclick="closeWindow()"/>
<input type="button" value="Go Back" onclick="goBack()"/>
</div>
 </body>
 </html>
