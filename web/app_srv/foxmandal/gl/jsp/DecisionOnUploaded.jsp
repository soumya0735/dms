<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %> 
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.*,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*"%>
 
<%@page import="org.apache.struts.Globals"%>
<%@ page import="org.apache.struts.taglib.html.Constants"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
 
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder" %>

<%@ page import=" java.io.File" %>
<%@ page import="java.util.*" %>


 <link href="/ICMR/app_srv/icmr/gl/jscss/footable/bootstrap/bootstrap.css" rel="stylesheet"/>  <!--added for  mail editor-->
 

<script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
 
<script src="/ICMR/app_srv/icmr/gl/jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>    
 

<jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include>


<script>
   $(document).ready( function() {
//$('table').footable();  

$( ".datePickerClass" ).datepicker({
                        changeMonth: true,   //Show month
                        changeYear: true,     //Show year
                        altField: "#alternate",    //Show in alternate field
                        altFormat: "DD, d MM, yy",   //show alternate in following format
                        yearRange: "1930:2030",
                        //minDate: ('-45Y'),
                        maxDate: ('-25Y')
                  });
   });
   
   
</script>


<style type="text/css">


table.removePadding tbody tr td,table.abc thead tr th  {padding:0px;}

.hideElement{
 display:none;   
}
</style>
<%
               UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
 
               String strUserId=_userinfo.getStrUserID();
               String strUsertype=_userinfo.getStrUserType();
               DBQueryManager  _dbq= new DBQueryManager();
               String strProposalId="";   
               String strVersionId="F1"; // Hard coding for No version of Prposal 
               String docValid="1";
                 String firstTime="";
                String selectedDocId="";
                String enCodedDocId="";
                String enCodedDocIdVersion=""; 
                String strStageId="%";
                String strQuery="";
                String lastDateToUpload="";
                boolean delStatus = false;
                String strDecisionMailText="";   
                String strPageAcess="N";         
                if(strUsertype.equals("A")||strUsertype.equals("O"))
                strPageAcess="Y";
                
                
               if(request.getAttribute("firstTime")!=null){
 
                firstTime=request.getAttribute("firstTime").toString();
                 if(firstTime.equals("Y")){
                        docValid="0";
                    }
               }
                              
               int projectDuration=0;
               
               ArrayList docDtlList=new ArrayList();
               ArrayList reqDocDtlList=new ArrayList();
               ArrayList AlreadydocDtlList =new ArrayList();
               ArrayList stageList=new ArrayList();
               String strNewDocList="";
               String NewDocList="";
               
               if(request.getParameter("stageID")!=null)
               {
                  strStageId=request.getParameter("stageID").toString();               
                  System.out.println("strStageId  "+strStageId);
 
               }
               if(request.getParameter("lastDateToUpload")!=null)
               {
                  lastDateToUpload=request.getParameter("lastDateToUpload").toString();               
 
               }         
               if(request.getParameter("strAbstractID")!=null)   //proposal id
               {
                    strProposalId=request.getParameter("strAbstractID").toString();
 
                }else if(request.getAttribute("strProposalId")!=null)   //proposal id {
                {
                    strProposalId=request.getAttribute("strProposalId").toString();                    
 
                }
               if(request.getAttribute("strNewDocList")!=null)   //proposal id {
                {
                   strNewDocList=request.getAttribute("strNewDocList").toString();                    
 
                }
                System.out.println("strNewDocList in JSP"+strNewDocList);
               
              String stagesss="";
              String Query="Select nvl(num_stage_id,1) stageId from tdc_doc_stage_master"; 
              stageList=_dbq.fetchData(Query);  
 
              
           System.out.println("Size of stageList=  "+stageList.size());
           
           if(strPageAcess.equals("Y"))
           {
           if(firstTime.equals("Y"))
           {
                String propDocDtlQry="select distinct cprd.doc_id,nvl(cdtm.doc_name,'N/A'), "+ //1
                " to_char(nvl(cprd.duration_from,sysdate),'dd-mm-yyyy'),"+ //2
                " to_char(nvl(cprd.duration_to,sysdate),'dd-mm-yyyy'),to_char(nvl(cprd.upload_last_date,sysdate),'dd-mm-yyyy'),"+ //4
                " nvl(cpud.status,'R'),sts.str_status_name,nvl(cpud.remarks_by_administrator,''),cpud.doc_version_id,"+ //8
                " decode(cpud.doc_version_id,'V1','N','Y'),nvl(cpud.remarks_by_pi,''),nvl(sdm.period,'O'), cprd.doc_type_id, cdtm.format_allowed,(case when cpud.upload_date is null then 'NA' else to_char(cpud.upload_date,'dd-mm-yyyy') end) from proposal_doc_required_document cprd, "+ //14
                " document_type_master cdtm, proposer_doc_uploads_details cpud,tdc_status_master sts, tdc_doc_stage_master dsm, scheme_documents_master sdm "+  
                " where cdtm.doc_type_id=cprd.doc_type_id and cdtm.doc_type_id=sdm.doc_type_id and cpud.doc_id=cprd.doc_id and cdtm.doc_type_id=dsm.num_doc_id and dsm.num_stage_id in ( select num_stage_id  from tdc_stage_master where num_seq_no <= (select max(num_seq_no) from tdc_stage_master where num_stage_id  like '"+strStageId+"' ))  "+
                " and cprd.is_valid='"+docValid+"' and cdtm.doc_is_valid=1 and sdm.is_valid=1 "+
                " and cprd.num_proposal_id='"+strProposalId+"'  "+
                " and sts.str_status=cpud.status   and doc_version_id=(select max(doc_version_id) "+
                " from proposer_doc_uploads_details x where x.doc_id=cprd.doc_id ) order by cdtm.doc_name,cprd.duration_from,cprd.duration_to  ";
                 System.out.println("propDocDtlQry  "+propDocDtlQry);
                docDtlList=_dbq.fetchData(propDocDtlQry);       
                
                
                if(docDtlList.size()>0){
                for(int noOfDocs=0;noOfDocs<(docDtlList.size());noOfDocs=noOfDocs+15){ //iterate doc details
                NewDocList=NewDocList+docDtlList.get(noOfDocs+12).toString()+","+docDtlList.get(noOfDocs+11).toString()+","+docDtlList.get(noOfDocs+2).toString()+","+docDtlList.get(noOfDocs+3).toString()+",";                        
                }
                }
                System.out.println("NewDocList    "+NewDocList);
         }
        }
        
                String AlredaySavedDoc="select distinct cprd.doc_id,nvl(cdtm.doc_name,'N/A'), "+ //1
                " to_char(nvl(cprd.duration_from,sysdate),'dd-mm-yyyy'), "+ //2
                " to_char(nvl(cprd.duration_to,sysdate),'dd-mm-yyyy'),to_char(nvl(cprd.upload_last_date,sysdate),'dd-mm-yyyy'),"+ //4
                " nvl(cpud.status,'R'), get_status(cpud.status),nvl(cpud.remarks_by_administrator,''),cpud.doc_version_id,"+ //8
                " decode(cpud.doc_version_id,'V1','N','Y'),nvl(cpud.remarks_by_pi,''),nvl(sdm.period,'O'), cprd.doc_type_id, cdtm.format_allowed,(case when cpud.upload_date is null then 'NA' else to_char(cpud.upload_date,'dd-mm-yyyy') end) "+
                " from proposal_doc_required_document cprd, "+ //13
                " document_type_master cdtm, proposer_doc_uploads_details cpud,tdc_status_master sts, tdc_doc_stage_master dsm, scheme_documents_master sdm "+  
                " where cdtm.doc_type_id=cprd.doc_type_id and cdtm.doc_type_id=sdm.doc_type_id and cpud.doc_id=cprd.doc_id and cdtm.doc_type_id=dsm.num_doc_id and "+
                " cprd.is_valid='1' and cprd.num_proposal_id='"+strProposalId+"'    "+
                " and sts.str_status=cpud.status   and doc_version_id=(select max(doc_version_id) "+
                " from proposer_doc_uploads_details x where x.doc_id=cprd.doc_id ) order by cprd.doc_id,cdtm.doc_name,cprd.duration_from,cprd.duration_to  ";
 
                 System.out.println("AlredaySavedDoc"+AlredaySavedDoc);
                               AlreadydocDtlList=_dbq.fetchData(AlredaySavedDoc);       
                               
                               //For getting doc id and period
                               String strDocList="";
                               if(AlreadydocDtlList.size()>0){
                                    for(int noOfDocs=0;noOfDocs<(AlreadydocDtlList.size());noOfDocs=noOfDocs+15){ //iterate doc details
                                      strDocList=strDocList+AlreadydocDtlList.get(noOfDocs+12).toString()+","+AlreadydocDtlList.get(noOfDocs+11).toString()+","+AlreadydocDtlList.get(noOfDocs+2).toString()+","+AlreadydocDtlList.get(noOfDocs+3).toString()+",";                        
                                    }
                               }
                               System.out.println("strDocList    "+strDocList);
                               //
                               
                                
                                  String docDtlqry="select distinct dtype.doc_type_id, sdm.period  from document_type_master dtype, scheme_documents_master sdm  "+
                                   "where sdm.doc_type_id=dtype.doc_type_id and dtype.doc_is_valid=1";
                                System.out.println("docDtlQry  "+docDtlqry);
                                               reqDocDtlList=_dbq.fetchData(docDtlqry);        
 
                                               int size=reqDocDtlList.size();
                                System.out.println("size of this New Array is: "+size);               
                                               String reqDocId="";
                                
                                for(int i=0;i<size;i++)
                                {
                                reqDocId=reqDocId+reqDocDtlList.get(i).toString()+",";
 
                                }
                                System.out.println("Content of this New Array is: "+reqDocId);               
                                
           
            strDecisionMailText=strDecisionMailText+"Dear Sir,<br> This is the mail content to be sent to PI"+
    "<br>Regards ICMR.";
          
               %>
    <script language="javascript" type="text/javascript">
function isDate(theField)
{
        
        var theInput = theField.value;
        var theLength = theInput.length;
     var okDate =  "ALLOK";
     var charSpe = false;

        if(theLength == 0)
      {
        return false;
   }
   if ((theLength <= 8 ||theLength > 10) && theLength !=0)
       {
        
     alert("Invalid Date : " + theInput + ", Please insert in (DD-MM-YYYY) Format.");
                      theField.value="";
        theField.focus();
        return false;
       }
        var pos1 = spePosition(0);
        var pos2 = spePosition(pos1+1);
     var pos3 = spePosition(pos2+1);
     if (pos3 == -1)
        {
        for(var i = 0; i<theLength; i++)
   {
        if (isNaN(theInput.substring(i, i+1)))
        {
        if (!(theInput.substring(i, i+1)== "/") && !(theInput.substring(i, i+1)=="-") && !(theInput.substring(i, i+1)=="."))
        {
        alert("Please Enter DD-MM-YYYY Format, Character Not Allowed in Date");
                                        theField.value="";
        theField.focus();
        return false;
       }
        }
        }
        var okDate = checkYearMonthDate(theInput, pos1, pos2, okDate);
        if (okDate == "Year")
     {
        alert("Invalid Year, Character value found or year is not in YYYY  : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
                        theField.value="";
    theField.focus();
        return false;
       }
        if (okDate == "Month")
     {
        alert("Invalid Month, Character value found : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
                        theField.value="";
    theField.focus();
        return false;
       }
        if (okDate == "Date")
     {
        alert("Invalid Date, Character value found : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
        theField.focus();
        return false;
       }
        if (okDate == "31")
        {
        alert("Date value can not be less than 1 greater than 31  : " + theInput +"");
                         theField.value="";
    theField.focus();
        return false;
       }
        if (okDate == "30")
     {
        alert("Date value can not be less than 1 greater than 30 : " + theInput +"");
                        theField.value="";
    theField.focus();
        return false;
       }
        if (okDate == "Leap")
     {        
        alert("Date value for Leap Year can not be less than 1 greater than 29 : " + theInput +""); 
        theField.focus();
        return false;
       }
        if (okDate == "Nonleap")
        {
        alert("Date value can not be less than 1 greater than 28 : " + theInput +""); 
                         theField.value="";
    theField.focus();
        return false;
       }
        if (okDate == "invYearRange")
     {
        alert("Year is not in Prescribed Range : " + theInput +""); 
        theField.focus();
        return false;
       }
        if (okDate == "invMonRange")
        {
        alert("Not a Valid Month (Valid value is 1 to 12) : " + theInput +""); 
                        theField.value="";
        theField.focus();
        return false;
       }        
    if (okDate == "invDateRange")
   {
        alert("Date is not in Prescribed Range : " + theInput +""); 
                        theField.value="";
    theField.focus();
        return false;
       }
    if (okDate == "invSeperator")
   {
        alert("More than One Seperator is not allowed in Date : " + theInput +", Please insert in (DD-MM-YYYY) Format.");
                        theField.value="";
    theField.focus();
        return false;
       }
        }
        else
        {
         //alert("Invalid Date Seperators(.-/) found, Seperator can not be less or greater than Two : " + theInput + ", Please insert in (DD-MM-YYYY) Format.");
      alert("Invalid Date Seperators found, Please insert in (DD-MM-YYYY) Format.");
      theField.value="";
  theField.focus();
        return false;
       }
        return true;
}

 
function date_val(these)
{
    if(these.value!="")
    {
       if (isDate(these.value)) 
       {         
            
       
        var date = new Date();
        var d  = date.getDate();
        var day = (d < 10) ? '0' + d : d;
        var m = date.getMonth() + 1;
        var month = (m < 10) ? '0' + m : m;
        var yy = date.getYear();
        var year = (yy < 1000) ? yy + 1900 : yy;
        var t2=day + "-" + month + "-" + year;
        var t1= these.value;
        var one_day=1000*60*60*24; 


        var x=t1.split("-");     
        var y=t2.split("-");
  

        var date1=new Date(x[2],(x[1]-1),x[0]);
  
        var date2=new Date(y[2],(y[1]-1),y[0])
        var month1=x[1]-1;
        var month2=y[1]-1;
        
        
               
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day)); 
 
        
        if(_Diff>=0)
        {
            alert("Please select date greater than current date "); 
            these.value="";
            these.focus();
            return false;
        }
        else
        {
          return true;
        }
        
             
     }     
       else 
      {         
        alert('Invalid date format!'); 
        these.value="";
        these.focus();
        return false;
      }  
  }
 
}

      function  appendValues(idAndStatus) 
     {
        var allUsers=document.forms[0].hiddenListOfDocId.value;
         var arrIdAndStatus=idAndStatus.value;
 
                if(idAndStatus.checked==true)
                {
                    allUsers=allUsers+arrIdAndStatus+"##";
                }else {
                    var str=arrIdAndStatus+"##";
                    allUsers=allUsers.replace(str,"");
                }
            document.forms[0].hiddenListOfDocId.value=allUsers;
     }

function getUpdatedDate(thefield) 
     {
                var check="date";
                var strProposalId="<%=strProposalId%>";
                var strVersionId="F1"; 
                var stageID="<%=strStageId%>";
                var id=thefield.id;
                var value=thefield.value;
                var list_value = id.split("##");
                var docID = list_value[0];
                var docVerID = list_value[1]; 
                var date = list_value[2]; 
                var whichdate = list_value[3]; 
                document.forms[0].docID.value=docID;
                document.forms[0].docVerID.value=docVerID;
        var strWindow="/ICMR/app_srv/icmr/gl/jsp/DocumentDecisionPopUp.jsp?doc_id="+docID+"&doc_ver_id="+docVerID+"&strProposalId="+strProposalId+"&strVersionId="+strVersionId+"&check="+check+"&date="+date+"&whichdate="+whichdate+"&stageID="+stageID;
        window.open(strWindow,'Child','dependent=yes,scrollbars=no,height=950,width=950,top=500,left=275');
            return false;
    }

     function getUploadedDoc(thefield) 
     {
                var check="doc";
                var strProposalId="<%=strProposalId%>";
                var strVersionId="<%=strVersionId%>";    
                var stageID="<%=strStageId%>";
                var id=thefield.id;
                var list_value = id.split("##");
                var docID = list_value[0];
                var docVerID = list_value[1]; 
                var status = list_value[2]; 
                document.forms[0].docID.value=docID;
                document.forms[0].docVerID.value=docVerID;
        var strWindow="/ICMR/app_srv/icmr/gl/jsp/DocumentDecisionPopUp.jsp?doc_id="+docID+"&doc_ver_id="+docVerID+"&strProposalId="+strProposalId+"&strVersionId="+strVersionId+"&check="+check+"&status="+status+"&stageID="+stageID;
 
        window.open(strWindow,'Child','dependent=yes,scrollbars=no,height=950,width=950,top=500,left=275');
            return false;
    }
    
 
 function uploadDoc(thefield) 
 {
                var strProposalId="<%=strProposalId%>";
                var strVersionId="<%=strVersionId%>";
                var stageID="<%=strStageId%>";
                var id=thefield.id;
                var list_value = id.split("##");
                var docID = list_value[0];
                var docVerID = list_value[1]; 
                document.forms[0].docID.value=docID;
                document.forms[0].docVerID.value=docVerID;
        var strWindow="/ICMR/app_srv/icmr/gl/jsp/DocumentUploadPopUp.jsp?doc_id="+docID+"&doc_ver_id="+docVerID+"&strProposalId="+strProposalId+"&strVersionId="+strVersionId+"&stageID="+stageID;
 
        window.open(strWindow,'Child','dependent=yes,scrollbars=no,height=950,width=950,top=500,left=275');
            return false;
 }
 /**
  * This function is being used to add more details of document in table.
  */
  function rowCount()
  {
   var table = document.getElementById("docTable");
   var lastRow = table.rows.length;
   if(lastRow>3){
   return false;
   }
   else{
   addMoreDocument();
   }

  }
function addMoreDocument(){

   var table = document.getElementById("docTable");
   var lastRow = table.rows.length;
    var strProposalId="<%=strProposalId%>";
    var strVersionId="<%=strVersionId%>";
 
    url="/ICMR/decisionOnUploaded.do?hmode=getMoreDocument&strProposalId="+strProposalId+"&strVersionId="+strVersionId;
    if (window.XMLHttpRequest){ 
                http_request4 = new XMLHttpRequest();
    } 
    else if (window.ActiveXObject){
            try {
                http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                            try {
                                    http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            catch (e) {}
                        }
            }
            if (!http_request4) {
                    alert(reg.xmlinstance.alert);
                    return false;
            } 
        http_request4.open("GET", url, true);
        http_request4.onreadystatechange = addDocDtlToTable;
        http_request4.send(null);
}
function getCurrentDate()
{
    var data = new Date();
    var d = data.getDate();
    var m = data.getMonth() + 1; //Months are zero based
    var y = data.getFullYear();
    //return curr_date + "-" + curr_month + "-" + curr_year;
    return '' +(d <= 9 ? '0' + d : d)+'-'+(m<=9 ? '0' + m : m) + '-' +y;
}
function toggel(thefield)
{
var e=document.getElementById(thefield.id).value;
var counts=thefield.id.substring(11);
var i=0;
var size="<%=size%>";
var reqDocId="<%=reqDocId%>";
var docList=reqDocId.split(",");
var last_date="last_date"+counts;

for(i=0;i<size;i=i+2){
//alert("e== "+e+"docList[i] "+docList[i]+"docList[i+1]=="+docList[i+1]);
 if((e==docList[i] && docList[i+1]=="O") || (e=='-1')){ 
    $(".toggel"+counts).each(function () {
              $(this).css("display","none");
     })
document.getElementById(last_date).style.display='block';
break;
}
else{
if(!(e=='-1')){
    $(".toggel"+counts).each(function () {
 
              $(this).css("display","block");
     })}
}
}
//alert("ok..");
}

/**
 * This function will render the document details on the table
 */
 
function addDocDtlToTable(){
    if (http_request4.readyState == 4) {
        if (http_request4.status == 200) {
         str = http_request4.responseXML.documentElement;
 
                   var x= str.getElementsByTagName("UOM");
                   var dp=str.getElementsByTagName("docPeriod");
                   //getting doc period
                   var docPeriod="";
                   for(var k=0;k < dp[0].childNodes.length;k++)
                    {
                            docPeriod=docPeriod+dp[0].childNodes[k].attributes[0].nodeValue+","+dp[0].childNodes[k].attributes[1].nodeValue+",";
                    }
//                   alert("docPeriod  "+docPeriod);
                   document.forms[0].docID_Period.value=docPeriod;

                    var firstTime="<%=firstTime%>";
                    var userType="<%=strUsertype%>";
                    var sysdate=getCurrentDate();

              //Adding to table
                   var table = document.getElementById("docTable");
                   var lastRow = table.rows.length;
                   var row = table.insertRow(lastRow);
                   var count=lastRow-2;                
                   
                   var from_date = "from_date" + count;
                   var to_date = "to_date" + count;
                   var last_date = "last_date" + count;
                   var doc_type_id="doc_type_id"+count;
                   var toggleClass='toggel'+count;
                   var num=count+1;
                   var isDocRequired="isDocRequired"+num;
                    //First Row for seq_no
                        var cell0 = row.insertCell(0);
                        //alert(count);
                  cell0.innerHTML = "<label>"+count + "</label>";
                   //Second row 
                        var cell1 = row.insertCell(1);
                        var str="<input type='hidden' name='doc_id' id='doc_id'/>";
                        var str=str+"<input type='hidden' name='doc_period'/>";
                        var str=str+"<input type='hidden' name='doc_type'/>";
                        var str=str+"<input type='hidden' name='isAdded' id='isAdded' value='Y'/>";
                        var str=str+"<input type='hidden' name='isDocRequired' id='"+isDocRequired+"' value='Y'/>";
                        //Adding combo of doc name    
                        str=str+"<select name='doc_type_id' id='"+doc_type_id+"' class='docCombo' onchange='toggel(this);checkDuplicateDocs(this);'>";
                        str=str+"<option value='-1' selected='selected'> Select Document </option> " ;
                            for(var y=0;y < x[0].childNodes.length;y++)
                            {
                                //alert(x[0].childNodes[y].attributes[0].nodeValue+" "+x[0].childNodes[y].attributes[1].nodeValue);
                                str=str+"<option value='"+x[0].childNodes[y].attributes[0].nodeValue+"'>"+x[0].childNodes[y].attributes[1].nodeValue+"</option>";                        
                            }
                        str=str+"</select>";
                        cell1.innerHTML = str;
                        cell1.className = 'middle';
                  //Third row
                    var cell2 = row.insertCell(2);
                    cell2.innerHTML ="<input class='"+toggleClass+" hideElement datePickerClass' style='height:25px' type='text' size='10' maxlength='10' name='fromDate' id='"+from_date+"'  onblur='date_val(this);checkLen(this,10);' />";
 

                  //Fourth Row
                    var cell3 = row.insertCell(3); 
                    cell3.innerHTML ="<input class='"+toggleClass+" hideElement datePickerClass' style='height:25px' type='text' size='10' maxlength='10' class='"+toggleClass+"'  name='toDate' id='"+to_date+"'  onblur='date_val(this);checkLen(this,10);' />";
 
                  //Fifth row
                    var cell4 = row.insertCell(4);
                    cell4.innerHTML ="<input type='text' class='"+toggleClass+" hideElement datePickerClass' style='height:25px' size='10' maxlength='10'  name='last_date' id='"+last_date+"'  onblur='date_val(this);checkLen(this,10);' />";
 
                    var cell5 = row.insertCell(5);
                    cell5.innerHTML ="<a style='display:block;' href='#' class='deleteRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>";

                    //This will delete the closest row where the event has been raised
    $(".deleteRow").click(function(event) {
        var href = $(this).attr('href');
        $(this).closest("tr").remove(); // remove row
        return false; // prevents default behavior
   });
      
      $( ".datePickerClass" ).datepicker({
                        changeMonth: true,   //Show month
                        changeYear: true,     //Show year
                        altField: "#alternate",    //Show in alternate field
                        altFormat: "DD, d MM, yy",   //show alternate in following format
                        yearRange: "1930:2030",
                        //minDate: ('-45Y'),
                        maxDate: ('-25Y')
                  });

      
      
            //Adding to table ends here
        }//http status=200 end if
      }// http ready state enf if
      return false;
}


function compareDocDate(){
var date1;
var date2;
var date3;
var table = document.getElementById("docTable");
var lastRow = table.rows.length;
var count=lastRow-2;
var from_date="";
var to_date="";
var last_date="";
var fdate="";
var tdate="";
var ldate="";
var i=0;
    for(i=0;i<count-1;i++)
    {
            if(document.forms[0].doc_period[i].value=="P")
            {    
                fdate=document.forms[0].fromDate[i].value;
                tdate=document.forms[0].toDate[i].value;
                ldate=document.forms[0].last_date[i].value;
            
                from_date=fdate.split("-");
                to_date=tdate.split("-");
                last_date=ldate.split("-");
                date1=new Date((from_date[2]),(from_date[1]-1),(from_date[0]));
                date2=new Date((to_date[2]),(to_date[1]-1),(to_date[0]));
                date3=new Date((last_date[2]),(last_date[1]-1),(last_date[0]));
         
                if(date1 > date2)
                {
                alert("From date should not be greater than To Date or Last Date");
                return false;
                }
                if(date2 > date3)
                {
                alert("Last Date to upload should not be Less than From Date or To Date");
                return false;
                }
           }  
        }
    return true;
}

function viewHideTable()
{
var firstTime="<%=firstTime%>";
if(firstTime=='Y'){ 
document.getElementById('addNewDoc').style.display='block';
document.getElementById('tabNew').style.display='none';
}
else{
document.getElementById('addNewDoc').style.display='none';
}
}

function checkDuplicateDate(){
var i=0,j=0;
var size="<%=size%>";
var reqDocId="<%=reqDocId%>";
var docList=reqDocId.split(",");
var table = document.getElementById("docTable");
var lastRow = table.rows.length;
var count=lastRow-2;
var docId="";
var from_date="";
var fdate="";
var to_date="";
var tdate="";

//        return isCheck;

    
    for(i=0;i < count;i++)
    {
            if(document.forms[0].doc_period[i].value=="P"){
                alert(document.forms[0].fromDate[i].value);
                alert(document.forms[0].toDate[i].value);
            }
    }

    /*for(i=0;i < count;i++)
    {
        //docId=document.forms[0].doc_type_id[i].value;
        from_date=document.forms[0].fromDate[i].value;
        to_date=document.forms[0].toDate[i].value;
        if(document.forms[0].isDocRequired[i].value=='Y')
        {
            for(k=0;k < count;k++)
            {
                if(k!=i)
                {
                    fdate=document.forms[0].fromDate[k].value;
                    tdate=document.forms[0].toDate[k].value;
                    for(j=0;j < size;j=j+2)
                    {
                       // alert(docId+"==="+docList[j]+"==="+fdate+"==="+from_date+"==="+tdate+"==="+to_date+"==="+docList[j+1]);                    

                        if( fdate==from_date && tdate==to_date && docList[j+1]=='P')
                        {
                            alert("The document with this FROM & TO DATE has already added");
                            return false;  
                        }
                    }
                    
                }
            }
        }
        //alert(i+"==="+count);
    }*/
}    

function checkOneTimeDocInAllRows(doc_type_id){
    var table = document.getElementById("docTable");
    var lastRow = table.rows.length;
    var count=lastRow-2;
    for(i=0;i < count;i++)
    {
        if(document.forms[0].doc_type[i].value==doc_type_id)
          return true;
    }
   return false;
}


/*Author:Mayank
 * Purpose: refresh parent window on opening document for the first time
 * */

function refreshParent(statusOfDoc)
{

    if (statusOfDoc=="U")    //Upload 
    {
      //location.reload(); //It prevents downloading of file. This is a bug
      //window.opener.location.reload(false);
 
    }

}

function checkInAlreadyAdded(thefield){
var counts=thefield.id.substring(11);
var docId=thefield.value;
var secDocID=thefield.id;
var from_date="";
var to_date="";
var last_date="";
var fdate="";
var tdate="";
var ldate="";
var j=0;

    var table = document.getElementById("AlreadydocTable");
    var lastRow = table.rows.length;
    var count=lastRow-2;
    var reqDocId="<%=strDocList%>";
    
    var isTrue=true;
    var docList=reqDocId.split(",");   //list of doc ids and period
    
       for(i=0;i < docList.length-1;i=i+4){   //iterating over table length
        
        
          if(docList[i+1]=="O" && docList[i]==docId){
          
            alert("Document Already added");
            document.getElementById(secDocID).selectedIndex='Select Document';
            document.getElementById(secDocID).value='-1';
            $(".toggel"+counts).each(function () {
            $(this).css("display","none");
             });
             isTrue=false;
            break;
          }  
          else if(docList[i+1]=="N" && docList[i]==docId){
          
          //No check is required in case of non periodic documents
          }

          else if(docList[i+1]=="P" && docList[i]==docId){
          from_date="from_date"+counts;  
          to_date="to_date"+counts;  
          last_date="last_date"+counts;  
          fdate=document.getElementById(from_date).value;
          tdate=document.getElementById(to_date).value;
          ldate=document.getElementById(last_date).value;
//            alert("docList[i+2] "+docList[i+2]+" docList[i+3] "+docList[i+3]);
          if(docList[i+2]==fdate && docList[i+3]==tdate ){
          alert("Document with this from and to date has already added.");
          document.getElementById(from_date).value="";
          document.getElementById(to_date).value="";
          document.getElementById(last_date).value="";
          isTrue=false;
          }
          }
      }
    return isTrue;
}

function checkDuplicateDocs(thefield){
    var counts=thefield.id.substring(11);
    var docId=thefield.value;
    var secDocID=thefield.id;
    var otherDoc="";
    var table = document.getElementById("docTable");
    var lastRow = table.rows.length;
    var count=lastRow-3;
    var reqDocId="<%=NewDocList%>";
    var isTrue=true;
    var docList=reqDocId.split(",");   //list of doc ids and period
    if(docList.length>1){
       for(i=0;i < docList.length-1;i=i+4){   //iterating over table length
          
          if(docList[i+1]=="O" && docList[i]==docId){
            alert("Document Already added");
            document.getElementById(secDocID).selectedIndex='Select Document';
            document.getElementById(secDocID).value='-1';
            $(".toggel"+counts).each(function () {
            $(this).css("display","none");
             });
             isTrue=false;
            break;
          }   //closing if of 
          else if(docList[i+1]=="N" && docList[i]==docId){
          
          //No check is required in case of non periodic documents
          }
       }
    }
    else{
    if(count==1){
        checkInAlreadyAdded(thefield);
    }else{

    var j=1;
//    alert("count="+count);
       for(ii=0;ii < count;ii++)
       {
//    alert("ii="+ii+" j="+j); 
       doc_type_id="doc_type_id"+j;
 //       alert(doc_type_id);
        otherDoc=document.getElementById(doc_type_id).value;
//        alert(otherDoc);
//        alert("docList.Length"+docList.length);
        for(i=0;i < docList.length-1;i=i+4)
        {   //iterating over table length
   //         alert("docList[i+1]=="+docList[i+1]);
            if((otherDoc==docId) && (otherDoc!='-1') && (secDocID!=doc_type_id))
            {
            alert("You have already selected this document");
            document.getElementById(secDocID).selectedIndex='Select Document';
            document.getElementById(secDocID).value='-1';
            $(".toggel"+counts).each(function () {
            $(this).css("display","none");
            });
            break;
            }
       }
        j++;
        
       }   
       checkInAlreadyAdded(thefield);
    }   
    }
}

function AlreadyAddedPeriodic(count){
var from_date="";
var to_date="";
var last_date="";
var fdate="";
var tdate="";
var ldate="";
var otherDoc="";
//var table = document.getElementById("AlreadydocTable");
//var lastRow = table.rows.length;
var reqDocId="<%=strDocList%>";
var isTrue=true;
var docList=reqDocId.split(",");   //list of doc ids and period
var j=1;
 
    if(docList.length>1){
       outer:   
       for(ii=0;ii < count;ii++){
       doc_type_id="doc_type_id"+j;
    //   alert(doc_type_id);
       otherDoc=document.getElementById(doc_type_id).value;
       for(i=0;i < docList.length-1;i=i+4){   //iterating over table length
        //  alert("docID "+docList[i]+"docType "+docList[i+1]);   
               
          if(docList[i+1]=="P" && docList[i]==otherDoc)
          {
          from_date="from_date"+j;  
          to_date="to_date"+j;  
          last_date="last_date"+j;  
          fdate=document.getElementById(from_date).value;
          tdate=document.getElementById(to_date).value;
          ldate=document.getElementById(last_date).value;
//            alert("docList[i+2] "+docList[i+2]+" docList[i+3] "+docList[i+3]);
          if(docList[i+2]==fdate && docList[i+3]==tdate )
            {
              alert("Document with this from and to date has already added.");
              document.getElementById(from_date).value="";
              document.getElementById(to_date).value="";
              document.getElementById(last_date).value="";
              isTrue=false;
              break;
            }
          else if(fdate=="" || tdate=="" ||ldate=="")
            {
            alert("Date field should not be left blank");
            isTrue=false;
            break;
            }
          }  
       }
       
    j++;
    }
  }
    return isTrue;
}

function checkPeriodicDocs(){

    var from_date="";
    var to_date="";
    var last_date="";
    var fdate="";
    var tdate="";
    var ldate="";
    var otherDoc="";
    var table = document.getElementById("docTable");
    var lastRow = table.rows.length;
    var count=lastRow-3;
    var reqDocId="<%=NewDocList%>";
    var isTrue=true;
    var docList=reqDocId.split(",");   //list of doc ids and period
    var j=((docList.length-1)/4)+1;

    if(docList.length>1){
        count=count-j+1;
        outer:  
       for(ii=0;ii < count;ii++){
       doc_type_id="doc_type_id"+j;
       
         
       if (document.getElementById(doc_type_id)!=null)  //Bug:save was not working in chrome: Vijay Kumar Chauhan
       {
       otherDoc=document.getElementById(doc_type_id).value;
       }

       for(i=0;i < docList.length-1;i=i+4){   //iterating over table length
        //  alert("docID "+docList[i]+"docType "+docList[i+1]);  

          if(docList[i+1]=="P" && docList[i]==otherDoc)
          {
          from_date="from_date"+j;  
          to_date="to_date"+j;  
          last_date="last_date"+j;  
          fdate=document.getElementById(from_date).value;
          tdate=document.getElementById(to_date).value;
          ldate=document.getElementById(last_date).value;
//            alert("docList[i+2] "+docList[i+2]+" docList[i+3] "+docList[i+3]);
          if(docList[i+2]==fdate && docList[i+3]==tdate )
            {
              alert("Document with this from and to date has already added.");
              document.getElementById(from_date).value="";
              document.getElementById(to_date).value="";
              document.getElementById(last_date).value="";
              isTrue=false;
              break;
            }
          else if(fdate=="" || tdate=="" ||ldate=="")
            {
            alert("Date field can not be left blank");
            isTrue=false;
            break;
            }
          }  
       }
    j++;
    }
  }
    else{
    var reqDocIdPeriod=document.forms[0].docID_Period.value;
    var docPeriodList=reqDocIdPeriod.split(","); 
    var k=1;//list of doc ids and period
               for(ii=0;ii < count;ii++){
       doc_type_id="doc_type_id"+k;
//       alert(doc_type_id);
       otherDoc=document.getElementById(doc_type_id).value;
//      alert(otherDoc);
//       alert("docPeriodList.length="+docPeriodList.length);
       for(i=0;i < docPeriodList.length-1;i=i+2)
       {   //iterating over table length
        //  alert("docID "+docList[i]+"docType "+docList[i+1]);   
          if(docPeriodList[i+1]=="O" && docPeriodList[i]==otherDoc)
          {
          isTrue=true;
          }
          else if(docPeriodList[i+1]=="P" && docPeriodList[i]==otherDoc)
          {
          isTrue=AlreadyAddedPeriodic(count);
          if(isTrue==false)
          break;
          }
       }
    }
  }
  return isTrue;
}

function isAllDocSelected(){
    var isCheck=true;
    $(".docCombo").each(function () {
              if($(this).val()=="-1") 
              {
                 alert("Please select the documents.");
                 isCheck=false;
              }
          });
          return isCheck;
}

/**
 * This function will save the document details
 */
function saveDocumentDetails(){

         if(document.getElementById('mailCheckBox').checked==true)
        {     
        var mailTexts=$("#editor").html();
        $("#mailText").val(mailTexts);
        }

if(!isAllDocSelected())
  return false;
  
/*  if(checkDuplicateDate()==false){
    return false;
}*/
/*if(compareDocDate()==false){
return false;
}*/
if(checkPeriodicDocs()==false){
return false;
}


        document.forms[0].hmode.value="saveDocumentDetails";
        document.forms[0].action="/ICMR/decisionOnUploaded.do";
        document.forms[0].method="post";
 
        confirmation = confirm("Save document details?");
        if(confirmation == true)
        {
               document.forms[0].submit();
        }
        else
        {
                return false;
        }       
}

/*
function MyCalander(thefield) 
    {
    var id=thefield.id;
    Calendar.setup( {
                        inputField : id, // id of the input field
                        ifFormat : "%d-%m-%Y", // format of the input field data
                        align : "Bl", // alignment (defaults to "Bl")
                        onfocus : true
                    });    
    }
 */
 //vijay
   
 function callfile(thefield) 
  {
    var strProposalId="<%=strProposalId%>";
 
    var strVersionId="<%=strVersionId%>";
    var id=thefield.id;
    var list_value = id.split("##");
    var docID = list_value[0];
    var docVerID = list_value[1];  
    var fileType="uploadedDoc";
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strDocId="+docID+"&strDocVersionId="+docVerID+"&strProposalId="+strProposalId+"&strFileId="+strVersionId+"&strFileType="+fileType;
 
      document.forms[0].submit();
  } 
  
    
  function callFileFormat(theField) {
      var pid =theField.id;
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strFileType=doc&strProposalId=" + pid;
      document.forms[0].submit();
  }
  
  function setMailContent(){
    var emailText=document.forms[0].strDecisionMailText.value;
    //alert(emailText);
    //To set content in mail text box
    $('#editor').html(emailText);
     
}
function attachDocs(){  
    
    if(document.getElementById('attachDocument').checked==true)
    {
        document.getElementById('addNewDoc').style.display='block';
        document.getElementById('saveAndClose').style.display='block';
        document.getElementById('onlyClose').style.display='none';
    }
    else
    {
        document.getElementById('addNewDoc').style.display='none';
        document.getElementById('saveAndClose').style.display='none';
        document.getElementById('onlyClose').style.display='block';
    }
}
function sendMailToPI(){  
    
    if(document.getElementById('mailCheckBox').checked==true)
    {
        document.getElementById('mailEditor').style.display='block';
    }
    else
    {
        document.getElementById('mailEditor').style.display='none';
    }
}
//TO COMPARE FROM, TO AND lAST DATE
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

        fdate=document.forms[0].fromDate.value;
        tdate=document.forms[0].toDate.value;
         ldate=document.forms[0].last_date.value;
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


  function close_window()
        {
         window.close();
        }

    </script>
    
    
        
    </head>
    <body onload="setMailContent();viewHideTable();"  style="background:none">
        <html:form  styleId="form1" action="/decisionOnUploaded.do"  method="post">
        <input type="hidden"  name="strDecisionMailText" value="<%=strDecisionMailText%>" />
 
        <div align="center">
        <%if( ((strStageId.equals("%") || AlreadydocDtlList.size()>0) && (strPageAcess.equals("Y")))  || (!strPageAcess.equals("Y"))  )  
        { //If the document details list have values%>
                    <table class="theme_foot blue removePadding" id="AlreadydocTable"> <!-- inside footable.paginatte.css -->
                        <thead >
                        <tr>
                        <th align="center" colspan="10" style="font-size:16;" >Documents Required For Codal Formalities </th>
                        </tr>
                             <tr>
                             <th width="3%" style="padding:0px !important">S.No.</th>   <!-- to show serial number -->
                             <th width="24%" style="padding:0px !important ">Doc Name</th>   <!-- Name of required document -->
                             <th width="6%" style="padding:0px !important ">From Date</th>   <!-- starting date to upload document -->
                             <th width="6%" style="padding:0px !important ">To Date</th> <!-- end date till the document can be uploaded -->
                             <th width="8%" style="padding:0px !important">Last Date to Upload</th> <!-- last date to upload document if document is not uploaded till last date -->
                                    <th width="8%" style="padding:0px !important">Upload date</th>
                                    <th width="8%" style="padding:0px !important">Status</th>  <!-- status of document, either uploaded, pending or re-submit -->
                                    <th width="10%" style="padding:0px !important">Remarks by ICMR</th> <!-- Remarks by admin -->
                                    <th width="10%" style="padding:0px !important">Remarks by PI</th> <!-- Remarks by admin -->
                                     <%if(strPageAcess.equals("Y")){%>
                                     <th width="8%" style="padding:0px ">Decision</th>    <!-- link to open decision child window -->
                                     <%}
                                     else if(strUsertype.indexOf("P")!=-1)
                                     {%>
                                      <th width="8%" style="padding:0px !important">Upload</th>  <!-- upload link  -->
                                     <%}%>
                            </tr>
                        </thead>   
                        <tbody>
                             <%
                                int row_num=0;
                                for(int noOfDocs=0;noOfDocs<AlreadydocDtlList.size();noOfDocs=noOfDocs+15){ //iterate doc details
                                enCodedDocId=DataEncoder.encode(AlreadydocDtlList.get(noOfDocs).toString());
                                enCodedDocIdVersion= DataEncoder.encode(AlreadydocDtlList.get(noOfDocs+8).toString());
                                
                            %>
<tr>
<!-- fields : doc_id,isAdded,doc_type_id,fromDate,toDate,last_date,strStatus,strRemarks -->
<!-- Sequence Number -->
<td><label>&nbsp;<%=++row_num%></label></td>

<!--  -->
<td>
<%
if(!((AlreadydocDtlList.get(noOfDocs+5).toString().equals("R"))||(AlreadydocDtlList.get(noOfDocs+5).toString().equals("NR")))) 
{%>
    <a style="text-align:center;font-size:11;" id='<%=AlreadydocDtlList.get(noOfDocs).toString()+"##"+AlreadydocDtlList.get(noOfDocs+8).toString()%>' class="docNameCSS hyplinks" onclick="callfile(this);refreshParent('<%=AlreadydocDtlList.get(noOfDocs+5)%>');"><%=AlreadydocDtlList.get(noOfDocs+1).toString()%></a>
<% } else { %>
<label class="docNameCSS">
 <%=AlreadydocDtlList.get(noOfDocs+1).toString()%></label><!--doc_name -->
<%  }
  if(AlreadydocDtlList.get(noOfDocs+13).toString().equals("Y"))
    {
     %>
  <div align="right" class="border-top">[<a style="text-align:center;font-size:11;" id="<%=AlreadydocDtlList.get(noOfDocs+12).toString()%>" name='view_doc_format' class="hyplinks" onclick="callFileFormat(this)">Format</a>]</div>
  <%}%>

</td>
                     
<!-- from date-->
<td width="10%"> 
<%if(!AlreadydocDtlList.get(noOfDocs+11).toString().equals("O"))
  {
  if(strPageAcess.equals("Y")) {%>
         <label style="font-size:11;" id="<%=enCodedDocId+"##"+enCodedDocIdVersion+"##"+AlreadydocDtlList.get(noOfDocs+2).toString()+"##"+"From" %>" class="hyplinks" onclick="javscript:getUpdatedDate(this);" ><%=AlreadydocDtlList.get(noOfDocs+2).toString()%></label>
       <% } else  {%>
           <label><%=AlreadydocDtlList.get(noOfDocs+2).toString()%></label>
       <%}
  }
%>
</td>

<!-- To date -->
<td width="10%"> 
<%if(!AlreadydocDtlList.get(noOfDocs+11).toString().equals("O")) 
   { 
   if(strPageAcess.equals("Y")) {%> 
        <label style="font-size:11;" id="<%=enCodedDocId+"##"+enCodedDocIdVersion+"##"+AlreadydocDtlList.get(noOfDocs+3).toString()+"##"+"To" %>" class="hyplinks" onclick="javscript:getUpdatedDate(this);" ><%=AlreadydocDtlList.get(noOfDocs+3).toString()%></label>
       <% } else  {%>
           <label><%=AlreadydocDtlList.get(noOfDocs+2).toString()%></label>
       <%}%>
   <%}%>
</td>

<!-- last date-->
<td width="10%">
<%
if(strPageAcess.equals("Y")){
%>
<label style="font-size:11;" id="<%=enCodedDocId+"##"+enCodedDocIdVersion+"##"+AlreadydocDtlList.get(noOfDocs+4).toString()+"##"+"Last" %>" class="hyplinks" onclick="javscript:getUpdatedDate(this);"><%=AlreadydocDtlList.get(noOfDocs+4).toString()%></label>
<%} 
else {%>
<label><%=AlreadydocDtlList.get(noOfDocs+4).toString()%></label>
<%}%>
</td><!-- upload_last_date-->



<td>
<label><%=AlreadydocDtlList.get(noOfDocs+14).toString()%></label>
</td>


<!--Start:vijay:change color-->

<%if(strPageAcess.equals("Y") && (AlreadydocDtlList.get(noOfDocs+5).toString().equals("U"))){   //(admin or PO) and Uploaded%>   

<td bgcolor="Silver">
<label id="<%=AlreadydocDtlList.get(noOfDocs).toString()%>"><%=AlreadydocDtlList.get(noOfDocs+6).toString()%></label>
</td><!-- status Pending/uploaded/re-submit-->
<%}
else {%>
<td>
<label id="<%=AlreadydocDtlList.get(noOfDocs).toString()%>"><%=AlreadydocDtlList.get(noOfDocs+6).toString()%></label>
</td><!-- status Pending/uploaded/re-submit-->

<%}%>

<!--End:vijay:change color-->

<td>
<label><%=AlreadydocDtlList.get(noOfDocs+7).toString()%></label>
</td><!-- remarks -->

<td>
<label><%=AlreadydocDtlList.get(noOfDocs+10).toString()%></label>
</td><!-- remarks -->

<!--  -->
<td align="center">
 <%if(strPageAcess.equals("Y")){   //if logged in user is administrator%>
   <a style="font-size:11;" id='<%=enCodedDocId+"##"+enCodedDocIdVersion+"##"+AlreadydocDtlList.get(noOfDocs+5).toString() %>' class="hyplinks" onclick="javscript:getUploadedDoc(this);">Decision</a>
<%} 
else if(strUsertype.indexOf("P")!=-1){//If logged in person is PI
  if((AlreadydocDtlList.get(noOfDocs+5).toString().equals("R"))||(AlreadydocDtlList.get(noOfDocs+5).toString().equals("U"))||(AlreadydocDtlList.get(noOfDocs+5).toString().equals("RE"))){
%>
  <a style="font-size:11;" id='<%=enCodedDocId+"##"+enCodedDocIdVersion%>' class="hyplinks" onclick="javscript:uploadDoc(this);">Upload</a><!--  upload status-->
   <%}
   else{%>
   <label></label>
   <%}%>
        <%if(AlreadydocDtlList.get(noOfDocs+9).toString().equals("Y")){%>
            <label id="<%=AlreadydocDtlList.get(noOfDocs+8).toString()+"#"+AlreadydocDtlList.get(noOfDocs).toString()%>">Previous version of this Document</label>    
        <%}%>
<%} //If logged in person is scientist%>
</td>

<!--  -->
</tr>
  <%}//iterate doc details ends here %>
                        </tbody>
                      <%  if((strStageId.equals("%")) && (AlreadydocDtlList.size()<=0))
                      {%>
                      <tbody>
                      <tr>
                      <td colspan="10" align="center">No Record Found</td>
                      </tr>
                      </tbody>
                      <%}%>
                    </table>
<% if(!strPageAcess.equals("Y")){
%>                    
                    <br>
 <div align="center">
 <input type="button" value="Close" onclick="close_window()" />
 </div>
<%}} %>


<%if(strPageAcess.equals("Y")){%>
<%if(!firstTime.equals("Y")){%>
<%if(!strStageId.equals("%")){%>

                <div class="pad-top" align="left" style="padding:0px 0px 0px 10px;">
                <input type="checkbox" name="attachDocument" id="attachDocument" value="1" onclick="attachDocs();rowCount();" />
                <span class="formlabels" ><strong>
                   Any more documents to be demanded from PI
                  </strong>
                 </span>
                </div>
                <%}}%>
                <br>
                
                <div align="left" id="addNewDoc" style="padding:2px 10px 2px 10px;display:block;" >


 <table class="theme_foot blue removePadding" id="docTable"> <!-- inside footable.paginatte.css -->
                        <thead >
                        <tr>
                        <th align="center" colspan="6" style="font-size:16;" >Documents Required For Codal Formalities </th>
                        </tr>
                             <tr>
                             <th width="3%" style="padding:0px !important">S.No.</th>   <!-- to show serial number -->
                             <th width="25%" style="padding:0px !important">Doc Name</th>   <!-- Name of required document -->
                             <th width="5%" style="padding:0px !important">From Date</th>   <!-- starting date to upload document -->
                             <th width="5%" style="padding:0px !important">To Date</th> <!-- end date till the document can be uploaded -->
                             <th width="5%" style="padding:0px !important">Last Date to Upload</th> <!-- last date to upload document if document is not uploaded till last date -->
                             <th width="1%" style="padding:0px !important"></th> <!-- Check mark to select the documents -->
                             
<html:hidden property="strProposalId" styleId="strProposalId" value="<%=strProposalId%>"></html:hidden><!-- strProposalId -->
<html:hidden property="strVersionId" styleId="strVersionId" value="<%=strVersionId%>"></html:hidden><!-- strVersionId -->
<html:hidden property="stageID" styleId="stageID" value="<%=strStageId%>"></html:hidden>


                             
                             </tr>
                        </thead>   
                        <tbody>
                             <%
                             
                             if(docDtlList.size()>0){ //If the document details list have values
                                int row_num=0;
                                String from_date="";   //to store from_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String to_date="";//to store to_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String last_date="";//to store last_date id concatenated with rownum, it is required because datepicker requires diffrent ids
                                String isDocRequired="";
                                for(int noOfDocs=0;noOfDocs<docDtlList.size();noOfDocs=noOfDocs+15){ //iterate doc details
                                enCodedDocId=DataEncoder.encode(docDtlList.get(noOfDocs).toString());
 
                                enCodedDocIdVersion= DataEncoder.encode(docDtlList.get(noOfDocs+8).toString());
                                if(firstTime.equals("Y")){
                                    selectedDocId=selectedDocId+docDtlList.get(noOfDocs).toString()+"##";
                                }
                                
                                from_date="from_date"+row_num;  //concatenation with row number
                                to_date="to_date"+row_num;  //concatenation with row number
                                last_date="last_date"+row_num;  //concatenation with row number
                                isDocRequired="isDocRequired"+row_num;
                            %>
                            <tr>
                                <!-- fields : doc_id,isAdded,doc_type_id,fromDate,toDate,last_date,strStatus,strRemarks -->
                                <!-- Sequence Number -->
                                <td><label>&nbsp;<%=++row_num%></label></td>
                                
                                <!--  -->
<td >
<html:hidden property="doc_id" styleId="doc_id" value="<%=docDtlList.get(noOfDocs).toString()%>"></html:hidden><!-- doc_id -->
<html:hidden property="doc_period" value="<%=docDtlList.get(noOfDocs+11).toString()%>"/><!-- doc_period<P,O> -->
<html:hidden property="doc_type" value="<%=docDtlList.get(noOfDocs+12).toString()%>"/><!-- doc_type<1,2,3,4......> -->
<html:hidden property="isDocRequired" styleId="<%=isDocRequired%>" value="N"/>

<%=docDtlList.get(noOfDocs+1).toString()%><!--doc_name -->
<%  if(docDtlList.get(noOfDocs+13).toString().equals("Y"))
{ %>
    <span align="right">[<a style="text-align:center;font-size:11;" id="<%=docDtlList.get(noOfDocs+12).toString()%>" name='view_doc_format' class="hyplinks" onclick="callFileFormat(this)">Format</a>]</span>
<%}%>
</td>
                         
<!-- from date, if admin then text box else label -->

<td width="10%">
<%if(!docDtlList.get(noOfDocs+11).toString().equals("O")){%>
<html:text property="fromDate" styleClass="docFromDate datePickerClass" size="10" maxlength="10" styleId="<%=from_date%>"   value="<%=docDtlList.get(noOfDocs+2).toString()%>" onblur="isDate(this);date_val(this);checkLen(this,10);" style="height:25px;"></html:text>
<%} else {  %>
<html:hidden property="fromDate"  value="<%=docDtlList.get(noOfDocs+2).toString()%>"></html:hidden>
<%} %>
</td><!-- from_date -->

<!-- to date, if admin then text box else label -->
<td width="10%">
<%if(!docDtlList.get(noOfDocs+11).toString().equals("O"))
{ %>
<html:text  property="toDate" styleClass="docToDate datePickerClass" style="height:25px;" size="10" maxlength="10" styleId="<%=to_date%>"   value="<%=docDtlList.get(noOfDocs+3).toString()%>" onblur="isDate(this);date_val(this);checkLen(this,10);" ></html:text>
<%} else {%>
<html:hidden property="toDate"  value="<%=docDtlList.get(noOfDocs+3).toString()%>"></html:hidden>
<%}%>
</td><!-- to_date -->





<!-- last date, if admin then text box else label -->
<td width="10%">
<html:text property="last_date" styleClass="docLastDate datePickerClass" style="height:25px;" size="10" maxlength="10" styleId="<%=last_date%>"  value="<%=docDtlList.get(noOfDocs+4).toString()%>" onblur="isDate(this);date_val(this);checkLen(this,10);" ></html:text>
</td><!-- upload_last_date-->

<td>
<input type="checkbox" checked="true" class="hand-icon" title="Click if this document is not required" name="selectControl" value="<%=docDtlList.get(noOfDocs).toString()%>"  onclick="appendValues(this);"/>
</td>
<!--  -->
</tr>

<%}//iterate doc details ends here %>
<tr style="display:none">
<td colspan="6" align="center"></td>
</tr>

<%
}//If the document details list have values ends here
else{%>
<tr style="display:none">
<td colspan="6" align="center"></td>
</tr>
<%}%>
</tbody>
<%if(strPageAcess.equals("Y") ){%>

<tfoot>
<tr>
<td align="right" colspan="10">
<a onclick="javscript:addMoreDocument()" class="hyplinks" style="font-size:11;color:white;">Click here to add more documents </a>
</td>
</tr>
</tfoot>
<%}%>
</table> 
                </div>
            <%}%>


                    </div>
            <!-- Adding mail editor -->        
            <!-- Adding mail editor ends here -->  
 <%if(strPageAcess.equals("Y")){%>
 <%if(!firstTime.equals("Y")){%>
  <div align="center" id=saveAndClose style="display:none">
  <%}
  else{%>
  <div align="center" id=saveAndClose style="display:block">
  <%}%>
                <div class="pad-top" align="left" style="padding:0px 0px 0px 10px;">
                <span class="formlabels" ><strong>
                 <input type="checkbox" name="mailCheckBox" id="mailCheckBox" value="1" onclick="sendMailToPI()" />
                    Send mail to PI ?  
                  </strong>
                 </span>
                </div>
                <br>
                <div align="center" id="mailEditor" style="padding:2px 10px 2px 10px;display:none;">
                    <jsp:include page="/app_srv/icmr/gl/jsp/editor.jsp"></jsp:include>
                </div>
            
  <html:button property="save" styleId="save" onclick="saveDocumentDetails()"  value="Save"></html:button>
 
      &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;
      <input type="button" value="Close" onclick="close_window()" />
  </div>
  <%if(!firstTime.equals("Y")){%>
  <div align="center" id='onlyClose' style="display:block">
 <input type="button" value="Close" onclick="close_window()" />
 </div>
 <%}} %>
 
  <input type="hidden" name="hmode"/>
  <input type="hidden" name="hiddenListOfDocId" value="<%=selectedDocId%>"/>    <!--todo: make it hidden-->
  <input type="hidden" name="firstTime" value="<%=firstTime%>"/>
  <input type="hidden" name="docID" />
  <input type="hidden" name="docVerID" />
  <input type="hidden" name="l_Date" />
  <input type="hidden" name="docID_Period" />



<% if (!(strPageAcess.equals("Y"))){ //Y is check for allocator and PO %>  
<br/>
<p style="text-align:left"><strong>Note:In case of multi centric project, the documents have to be uploaded after merging them into a single file.</strong></p>
<%}%>
  
</html:form>
<!--<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/js/plugins/jquery.magnific-popup.js"></script>
 
<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/js/groundwork.all.js"></script>-->
    </body>
    
</html>
