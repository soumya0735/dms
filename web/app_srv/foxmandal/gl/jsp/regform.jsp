<!DOCTYPE html>
<!-- Generally required in project, No relation with responsives -->
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@ page import=" java.io.File" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="_dbq" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" scope="session"/>
<jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include> 
<%System.out.println("inside jsp");%>
    <head>
    <style type="text/css">
    .ui-datepicker{
        z-index:999999999999999999 !important;
    }
    
    .red-border{
    border:1px solid #FF0040;
        }
        .alerttext
        {
            font-size:15px;
            color:red;
        }
    </style>
    
    <style type="text/css"><!--
    #strInstType_chzn {
      width:100% !important;
    }
     #strCity_chzn {
      width:100% !important;
    }
    input.file {
      height:0%;
    }
     #tblremarks th.lesswidth,  #tblresearch th.lesswidth {
   width:10%;
  }
  #tblremarks  td.middle, #tblresearch td.middle {
    text-align:center;
  }
   #reg-form input#UserId {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/user-icon.gif') 5px 4px no-repeat;
}
   #reg-form input#password {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/password.gif') 5px 4px no-repeat;
}
   #reg-form input#FirstName {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/user.gif') 5px 4px no-repeat;
}
   #reg-form input#strDob {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/dob.gif') 5px 4px no-repeat;
}
   #reg-form input#Designation {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/desig.gif') 5px 4px no-repeat;
}
   #reg-form input#Department{
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/dept.gif') 5px 4px no-repeat;
}
 #reg-form input#MobileNumber{
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/mobile.gif') 5px 4px no-repeat;
}
 #reg-form input#FaxNumber{
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/fax.gif') 5px 4px no-repeat;
}
 #reg-form input#emailid{
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/email.gif') 5px 4px no-repeat;
}
#reg-form .txtinput { 
display: block;
font-family: "Helvetica Neue", Arial, sans-serif;
border-style: solid;
border-width: 1px;
border-color: #dedede;
/*margin-bottom: 20px;
font-size: 1.55em;
padding: 11px 25px;*/
padding-left: 30px;
color: #777;
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset; 
transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-webkit-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-moz-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-o-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
}

#reg-form .txtinput:focus { 
color: #333;
border-color: rgba(41, 92, 161, 0.4);
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(41, 92, 161, 0.6);
-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(41, 92, 161, 0.6);
-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(41, 92, 161, 0.6);
outline: 0 none; 
}
/*.wrapper {
    font-family:'arial', sans-serif;
}
input.icon {
    padding:5px;
}
input.icon::-webkit-input-placeholder {
    font-family:'FontAwesome';
}
input.icon::-moz-placeholder {
    font-family:'FontAwesome';
}
input.icon::-ms-input-placeholder {
    font-family:'FontAwesome';
*/
#reg-form .txtinput.nopadding {
  padding-left:5px;
}
td.middle {
  vertical-align:middle;
}
#reg-form textarea {
background: #fff url('/ICMR/app_srv/icmr/gl/images/icons/notes.gif') 5px 4px no-repeat;
padding-left: 25px;
display: block;
font-family: "Helvetica Neue", Arial, sans-serif;
border-style: solid;
border-width: 1px;
border-color: #dedede;
height: 4em;
color: #777;
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset; 
transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-webkit-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-moz-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
-o-transition: border 0.15s linear 0s, box-shadow 0.15s linear 0s, color 0.15s linear 0s;
}
#reg-form textarea:focus {
color: #333;
border-color: rgba(41, 92, 161, 0.4);
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(40, 90, 160, 0.6);
-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(40, 90, 160, 0.6);
-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset, 0 0 8px rgba(40, 90, 160, 0.6);
outline: 0 none; 
}
    
    --><!----><!----><!----><!----><!----><!----><!----></style>
        <!-- including all required js and css files-->
        
        <!-- Other requied jss/css -->
          <script src="/ICMR/app_srv/icmr/gl/jssrc/validNumber.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/userReg.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/PDFPageCount.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/respond.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
        <link href="/ICMR/app_srv/icmr/gl/theme/chosen.css" rel="stylesheet" type="text/css"/>
  
        <!-- Other required contents -->
         <%  
    String strCombpQuery="select NUM_DEGREE_ID,STR_DEGREE_NAME from TDC_DEGREE_MASTER where STR_STATUS='1' and NUM_DEGREE_ID!=27 order by  STR_DEGREE_NAME";
    ArrayList list_data=_dbq.fetchData(strCombpQuery);
    String fSize="";

    String strNames="";
    String strValues="";
    for(int i=0;i<list_data.size();i++)
    {
    strNames=strNames+list_data.get(i).toString()+"#";
    strValues=strValues+list_data.get(++i).toString()+"#";
    }
    strNames=strNames+"27"+"#";
    strValues=strValues+"Others"+"#";
    
    System.out.println("strNames="+strNames+"strValues="+strValues);
    
      Calendar cal = Calendar.getInstance(); 
      int year = cal.get(Calendar.YEAR); 
       int iTabIndex=0;
       String resumepath="";
       
       String sessUserType="";
       String sessUserID="";
       
       String user_type="";
       String instName="";
       ArrayList list_values=new ArrayList(); 
                 if(request.getSession().getAttribute("listData")!=null)
                  {
                   list_values= (ArrayList)request.getSession().getAttribute("listData");
                   user_type=list_values.get(3).toString();
                   System.out.println("user_type is"+user_type);
                 }
      
     if(request.getAttribute("instName")!=null){
        instName=request.getAttribute("instName").toString();
        System.out.println("instName"+instName);
     }
     
    if(session.getAttribute("userInfo")!=null)
    {
     sessUserType="A";
     UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
     sessUserType=_userinfo.getStrUserType();
     sessUserID=_userinfo.getStrUserID();
     }
    else
    {
     sessUserType="U";
    }
  
 System.out.println("user type...."+sessUserType);   
 System.out.println("user sessUserID...."+sessUserID);   
    %>
        <style type="text/css"> 
    /* popup_box DIV-Styles*/ #popup_box {      
    display:none; /* Hide the DIV */     
    position:fixed;       
    position:absolute; /* hack for internet explorer 6 */      
    height:250px;       
    width:450px;       
    background:#FFFFFF;       
    left: 400px;     
    top: 250px;     
    z-index:100; /* Layering ( on-top of others), if you have lots of layers: I just maximized, you can change it yourself */     
    margin-left: 15px;            /* additional features, can be omitted */     
    border:2px solid #E1FFFF;           
    padding:15px;       
    font-size:15px;       
    -moz-box-shadow: 0 0 5px #E1FFFF;     
    -webkit-box-shadow: 0 0 5px #E1FFFF;     
    box-shadow: 0 0 5px #0000ff;      }  
    #container {     background: #d2d2d2; /*Sample*/     
    width:100%;     height:100%; } 
    a{   cursor: pointer;   text-decoration:none;   }   /* This is for the positioning of the Close Link */ 
    #popupBoxClose {     font-size:20px;       
    line-height:15px;       right:5px;       
    top:5px;       position:absolute;       
    color:#6fa5e2;       
    font-weight:500;       } 
    </style>  
    
    <script type="text/javascript">
  
    $(document).ready( function() {
   
        // When site loaded, load the Popupbox First
        loadPopupBox();
   
        $('#popupBoxClose').click( function() {           
            unloadPopupBox();
        });
       
        $('#container').click( function() {
            unloadPopupBox();
        });

        function unloadPopupBox() {    // TO Unload the Popupbox
            $('#popup_box').fadeOut("slow");
            $("#container").css({ // this is just for style       
                "opacity": "1" 
            });
        }   
       
        function loadPopupBox() {    // To Load the Popupbox
            $('#popup_box').fadeIn("slow");
            $("#container").css({ // this is just for style
                "opacity": "0.3" 
            });        
        }       
    });
</script>

    <script type="text/javascript">
    function validate()
   {
     var tbl = document.getElementById('tblremarks');
     var lastRow = tbl.rows.length;
  
      if (lastRow==1)
      {
        return true;
      }        
       else if(lastRow==2)
      {
            if (document.forms[0].edu_deg.value==""||document.forms[0].edu_inst.value==""||document.forms[0].edu_field.value==""||document.forms[0].edu_year.value=="")
            {
              alert("First enter educational qualification for previous row,then add a new row.");
              return false;
            }else{
                return true;
            }
      }
      else if (lastRow>2)
      {
        if (document.forms[0].edu_deg[lastRow-2].value==""||document.forms[0].edu_inst[lastRow-2].value==""||document.forms[0].edu_field[lastRow-2].value==""||document.forms[0].edu_year[lastRow-2].value=="")
        {
          alert("First enter educational qualification for previous row,then add a new row.");
          return false;
        }
        else
        {
           return true;
        }
      }
     return true;
}

    
  function validateResearch()
   {
     var tbl = document.getElementById('tblresearch');
     var lastRow = tbl.rows.length;
  
      if (lastRow==1)
      {
        return true;
      }      
      else if(lastRow==2)
     {
          if (document.forms[0].work_dur.value==""||document.forms[0].work_inst.value==""||document.forms[0].work_done.value=="")
          {
            alert("First enter research training experience for previous row,then add a new row.");
            return false;
          }else{
            return true;
          }
     }
     else if (lastRow>2)
      {
            if (document.forms[0].work_dur[lastRow-2].value==""||document.forms[0].work_inst[lastRow-2].value==""||document.forms[0].work_done[lastRow-2].value=="")
            {
              alert("First enter research training experience for previous row,then add a new row.");
              return false;
            }
            else
            {
               return true;
            }
      }
    return true;
  }   
    
    
    function addRowToTable() 
     {
          
          var stat=validate();
          if(stat)
          {
                
                  var table = document.getElementById("tblremarks");
                  var lastRow = table.rows.length;
                  var row=table.insertRow(lastRow);
                
                  var cell0 = row.insertCell(0);
                  cell0.setAttribute('class', 'middle align-center');
                  var strNames=document.forms[0].strNames.value;
                  var combonames=strNames.split("#");
                  var strValues=document.forms[0].strValues.value;
                  var comboValues=strValues.split("#");
                  var degreeYear="<select name='edu_deg' id='edu_deg' class='chzn-select edu_deg tooltip' role='tooltip' data-title='Select Your Degree'>";
                  degreeYear=degreeYear+"<option value=''>Select Degree</option>";
                  for(i = 0; i<combonames.length-1; i++) 
                  { 
                       degreeYear=degreeYear+"<option value='"+combonames[i]+"'>"+comboValues[i]+"</option>";
                  }
                  degreeYear=degreeYear+"</select";
                  cell0.innerHTML=degreeYear;
 
                 var cell1 = row.insertCell(1);
                 var degInstitute="<textarea name='edu_inst' id='edu_inst' ncols='15' rows='1'  class='mandatoryTArea edu-institute tooltip' role='tooltip' data-title='Name of Institution (Max 500 Characters)' value=''></textarea>"; 
                 cell1.innerHTML=degInstitute;
                
                 var cell2 = row.insertCell(2);
                 var degField="<textarea name='edu_field' id='edu_field' ncols='15' rows='1'  class='mandatoryTArea edu-field' role='tooltip' data-title='Name of Field (Max 500 Characters)' value=''></textarea>"; 
                 cell2.innerHTML=degField;
                
                
                 var cell3 = row.insertCell(3);
                 cell3.setAttribute('class', 'middle align-center');
                 var degYear="<input type='text' name='edu_year' size='10' id='edu_year' class='smallmandatoryTbox txtinput nopadding edu-year tooltip' role='tooltip' data-title='Degree Completion Year' onblur='chkYear(this)'/>";
                 cell3.innerHTML=degYear;
                
                 var cell4 = row.insertCell(4);
                 cell4.setAttribute('class', 'middle align-center');
                 var degDelete="<a href='#' class='middle deleteRemarksRow black'><i class='icon-trash icon-2x tooltip' title='Delete'></i></a>";
                 cell4.innerHTML=degDelete;
                  
                   //This is to add event on newly added row for deletion of the row
                           $(".deleteRemarksRow").click(function(event) {
                                var table = document.getElementById("tblremarks");
                                var lastRow = table.rows.length;
                                if(lastRow>2){
                                var href = $(this).attr('href');
                                $(this).closest("tr").remove(); // remove row
                                }
                                return false; // prevents default behavior
                           });
                        //This is to add placeholders on newly added row  
                          var width=$(window).width();
                          if(width<=480)
                          {
                             $(".edu-institute").attr("placeholder", "Enter your institution");
                             $(".edu-field").attr("placeholder", "Enter Field(s)");
                              $(".edu-year").attr("placeholder", "Enter Year");
                          }
                     //This is to add validation on the row while submit the form
                            $('.edu-institute').validatebox({
                                    required: true,
                                  validType: ["alphaspecial","maxLength[500]"]
                            });
                            $('.edu-field').validatebox({
                                 required: true,
                                  validType: ["alphaspecial","maxLength[500]"]
                            });             
                            $('.edu-year').validatebox({
                                  required: true,
                                  validType: ["Numeric","maxLength[4]",'minLength[4]']
                            });
                           $('.edu_deg').validatebox({
                                 required: true
                            });
             }  
    }
    
    
   /**
     * This function is being used to delete row from education details table
     */
    function removeRowFromTable() {
          var tbl = document.getElementById('tblremarks');
          var lastRow = tbl.rows.length;
          if (lastRow > 2)
              tbl.deleteRow(lastRow - 1);
      }
    
    function addRowToTableResearch() 
     {
         var stat=validateResearch();
          if(stat)
          {
       
             var table = document.getElementById("tblresearch");
                  var lastRow = table.rows.length;
                  var row=table.insertRow(lastRow);
                 
                 var cell0 = row.insertCell(0);
                 cell0.setAttribute('class', 'middle align-center');
                 var duration="<input type='text' name='work_dur' maxlength='3'  size='10' id='work_dur' class='res-duration tooltip' role='tooltip' data-title='Duration in Month(s)'/>";
                 cell0.innerHTML=duration;
                
                var cell1 = row.insertCell(1);
                 var inst="<textarea name='work_inst' id='work_inst' ncols='15' rows='1'  class='res-institution tooltip' role='tooltip' data-title='Research Institution' value=''></textarea>"; 
                 cell1.innerHTML=inst;
                
                 var cell2 = row.insertCell(2);
                 cell2.setAttribute('class', 'middle align-center');
                 var wdone="<textarea name='work_done' id='work_done' ncols='15' rows='1'  class='res-work tooltip' role='tooltip' data-title='Work Done' value=''></textarea>"; 
                 cell2.innerHTML=wdone;
                
                 var cell3 = row.insertCell(3);
                 cell3.setAttribute('class', 'middle align-center');
                 var degDelete="<a href='#' class='middle deleteResearchRow black'><i class='icon-trash icon-2x tooltip' role='tooltip' data-title='Delete'></i></a>";
                 cell3.innerHTML=degDelete;
                  
           $(".deleteResearchRow").click(function(event) {
                        var table = document.getElementById("tblresearch");
                        var lastRow = table.rows.length;
                        if(lastRow>2){
                            var href = $(this).attr('href');
                            $(this).closest("tr").remove(); // remove row
                        }
                        return false; // prevents default behavior
                   }); 
                  //Research Duration
                  $('.res-duration').validatebox({
                        validType: ["Numeric","maxLength[2]",'minLength[1]']
                 });
                  $('.res-institution').validatebox({
                        validType: ["alphaspecial","maxLength[500]"]
                 });
                 $('.res-work').validatebox({
                        validType: ["alphaspecial","maxLength[800]"]
                 }); 
                   var width=$(window).width();
                  if(width<=480)
                  {
                          $(".res-institution").attr("placeholder", "Enter Research Institution");
                            $(".res-duration").attr("placeholder", "Enter Duration");
                            $(".res-work").attr("placeholder", "Enter Work Detail");
                  }

          } 
          
          
          
    }
  
    function removeRowFromTableResearch() {
          var tbl = document.getElementById('tblresearch');
          var lastRow = tbl.rows.length;
          if (lastRow > 2)
              tbl.deleteRow(lastRow - 1);
      }
    
     function callfile(thefield) 
     {
      document.forms[0].method = "post";
      document.forms[0].action = "/ICMR/registrationAction.do?hmode=getFile&strFileType=UR&strFileId=" + thefield.id;
      document.forms[0].submit();
     }
     function Test()
     {
     confirmation = confirm("Do you want to proceed with the registration?");
                      if(confirmation == true)
                        {
                          document.forms[0].hmode.value="Save";
                          document.getElementById('login').style.display='inline';
                          document.getElementById('loginpopupObject').style.display='inline';
                          document.forms[0].submit();
                        }
                
                else
                {
                  return false;
                }
     }
     function setDefault(){
         var instName="<%=instName%>";
         if(instName!=""){
           var objSelect = document.getElementById("institute");
                for (var i = 0; i < objSelect.options.length; i++) {
                    if (objSelect.options[i].value==instName ) {
                    objSelect.options[i].selected = true;
                    }
                }
         }else if(instName=="0"){
         
           document.forms[0].org.value="";
            document.getElementById("div_insName").style.display="block";
            document.getElementById("div_insNameText").style.display="block";
            document.getElementById("div_insAdd").style.display="block";
            document.getElementById("div_insAddText").style.display="block";
            document.getElementById("div_insType").style.display="block";
            document.getElementById("div_insTypeText").style.display="block";
            document.getElementById("div_insCityLabel").style.display="block";
            document.getElementById("div_insCityCombo").style.display="block";
           
            
                  }
       
         
       return true;
     }
     /**
      * Whether want sms or not
      */

     function setSMS(thisVal) {
            if (thisVal.checked==true) {
                document.getElementById("_sms").value="Y";
            } else {
                document.getElementById("_sms").value="N";
            }
     }
    </script>
    <script>
    </script>
       <% 
       String event="";
     String msg1 = (String)request.getSession().getAttribute("msgUploadRes");
    if("resumeerror".equals(msg1)){
    event="Y";
    System.out.println("msgUploadRes= "+msg1);
    %>
		<script>
        alert("Resume File size cannot be greater than 1 MB.");        
      window.location.href="/ICMR/registrationAction.do?hmode=viewList";
  </script>
    <%}%>
    <%
     String msg2 = (String)request.getSession().getAttribute("msgUploadResUpdate");
    if("resumeerrorUpdate".equals(msg2)){
    event="Y";
    System.out.println("msgUploadResUpdate= "+msg2);
    %>
		<script>
        alert("Resume File size cannot be greater than 1 MB.");
        window.location.href="/ICMR/registrationAction.do?hmode=viewListUpdate";
  </script>
    <%}%>
     
     <% 
     String msg = (String)request.getSession().getAttribute("msg");
    if("error".equals(msg)){
    event="Y";
    System.out.println("msg= "+msg);
    %>
		<script>
        alert("Upload Resume Of One Page Only.");
        window.location.href = "/ICMR/registrationAction.do?hmode=viewList";
  </script>
    <%}
    String msgUpdtate = (String)request.getSession().getAttribute("msgUpdate");
   if("error".equals(msgUpdtate)){
    event="Y";
    System.out.println("msgUpdate= "+msgUpdtate);
    %>
		<script>
        alert("Upload Resume Of One Page Only.");
        window.location.href = "/ICMR/registrationAction.do?hmode=viewListUpdate";
  </script>
		 	<%}%>
     
     <% 
    String msgUpdateEn = (String)request.getSession().getAttribute("msgUpdateEn");
    if("error".equals(msgUpdateEn)){
    event="Y";
    System.out.println("msgUpdateEn="+msgUpdateEn);
    %>
		<script>
        alert("Please Check File is not Encrypted Or Password Protected.");
        window.location.href = "/ICMR/registrationAction.do?hmode=viewListUpdate";
  </script>
		 	<%}%>
      
 <% 
    String msgEn = (String)request.getSession().getAttribute("msgEn");
    System.out.println("value of msg is"+msgEn);

    if("error".equals(msgEn)){
    event="Y";%>
  <script>
        alert("Please Check File is not Encrypted Or Password Protected.");
        window.location.href = "/ICMR/registrationAction.do?hmode=viewList";
  </script>
		 	<%}%>
  
  <!-- For Placeholder -->
  <script>
  
     $(function() {
                  
                
                                    //F1or footable
                     //$('table').footable();     
                 //Date-picker  
                   //For diffrent options available with datepicker, 
                   //please check the URL: http://jqueryui.com/datepicker/#default
                  $( "#strDob" ).datepicker({
                        changeMonth: true,   //Show month
                        changeYear: true,     //Show year
                        altField: "#alternate",    //Show in alternate field
                        altFormat: "DD, d MM, yy",   //show alternate in following format
                        yearRange: "1930:2000",
                        //minDate: ('-45Y'),
                        maxDate: ('-25Y')
                  });
                 
                //Place Holders
                 $("#UserId").attr("placeholder", "Username");
                 $("#password").attr("placeholder", "Password");
                 $("#confirmpassword").attr("placeholder", "Re-enter Password");
                 $("#FirstName").attr("placeholder", "First Name");
                 $("#MiddleName").attr("placeholder", "Middle Name");
                 $("#lastName").attr("placeholder", "Last Name");
                 $("#Designation").attr("placeholder", "Designation");
                 $("#Department").attr("placeholder", "Department");
                 $("#strDob").attr("placeholder", "DD/MM/YYYY");
                 $("#Institute").attr("placeholder", "Institute name as mentioned in your resume");
                 $("#Address").attr("placeholder", "Address of Institute");
                 /*$("#ZipCode").attr("placeholder", "Zip Code");*/
                 $("#MobileNumber").attr("placeholder", "XXXXXXXXXX");
                 $("#FaxNumber").attr("placeholder", "Fax No.");
                 $("#emailid").attr("placeholder", "E-Mail ID");
                 $("#ResearchSpecialization").attr("placeholder", "Specialization");
                 $("#strDocpass").attr("placeholder", "Private Key Password");
                 $("#strDocConfirmPass").attr("placeholder", "Confirm Private Key Password");
                 //addded
                  var width=$(window).width();
                  if(width<=480)
                  {
                    //Place holder for educational details
                            $(".edu-institute").attr("placeholder", "Enter your institution");
                            $(".edu-field").attr("placeholder", "Enter Field(s)");
                            $(".edu-year").attr("placeholder", "Enter Year");
                     //Place holder for Research details
                            $(".res-institution").attr("placeholder", "Enter Research Institution");
                            $(".res-duration").attr("placeholder", "Enter Duration");
                            $(".res-work").attr("placeholder", "Enter Work Detail");
                  }
                  //ends here
                 //Delete table row
                 $(".deleteRemarksRow").click(function(event) {
                        var table = document.getElementById("tblremarks");
                        var lastRow = table.rows.length;
                        if(lastRow>2){
                            var href = $(this).attr('href');
                            $(this).closest("tr").remove(); // remove row
                        }
                        return false; // prevents default behavior
                   });
                   
             $(".deleteResearchRow").click(function(event) {
                        var table = document.getElementById("tblresearch");
                        var lastRow = table.rows.length;
                        if(lastRow>2){
                            var href = $(this).attr('href');
                            $(this).closest("tr").remove(); // remove row
                        }
                        return false; // prevents default behavior
                   });
         
         //For tooltip on choozen combo
         $("#state_chzn").addClass("tooltip");
         $("#state_chzn").attr("role","tooltip");
         $("#state_chzn").attr("data-title","Where Your Institute is Located");
         
         $("#institute_chzn").addClass("tooltip");
         $("#institute_chzn").attr("role","tooltip");
         $("#institute_chzn").attr("data-title","Your Institution Name");
         
         $("#strInstType_chzn").addClass("tooltip");
         $("#strInstType_chzn").attr("role","tooltip");
         $("#strInstType_chzn").attr("data-title","Type of Institute");
         
         $("#strCity_chzn").addClass("tooltip");
         $("#strCity_chzn").attr("role","tooltip");
         $("#strCity_chzn").attr("data-title","Where Your Institute is Located");
         
         
     });
  <!-- For Ends here -->
  
  
 
</script>  
 
 <%if(sessUserType=="U")
{%>  
<script type="text/javascript">
$(window).load(function(){
$.magnificPopup.open({
   items: {
        src: '<div id="test-modal" class="white-popup padded double"><h2 style="font-weight:bold;text-align:center">Are you a first timer?</h2>'+
            ' <p style="color:red">Please go through the guidelines before using this portal.</p>'+
           ' <ul style="padding-left:20px;text-align:justify;"> '+
            '<li><a style="font-size:13px" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/Registration_guidelines.pdf" >Registration Guidelines</a></li>' +
            '<li><a style="font-size:13px" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/revised_procedure_EMR.pdf">Extramural Programme of ICMR</a></li>'+
            '<li><a style="font-size:13px" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/preProposal.pdf">Pre-Proposal Submission format</a></li>'+
            '<li><a style="font-size:13px" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/detailedProposal.pdf">Detailed Proposal Submission format</a></li>'+
            '</ul> '+  
            '</div/>',
       // src: '<div id="test-modal" class="white-popup padded double"><h1>Modal Test</h1><p>Test Some text.</p><p><a class="popup-modal-dismiss">Dismiss</a></p></div>',

        type:'inline'
    },
    modal: true
});
});

</script>
 <%}%>

  <style type="text/css">

  .white-popup {

  position: relative;

  background: #FFF;

  padding: 20px;

  width: auto;

  max-width: 500px;

  margin: 20px auto;

}

  </style>

    </head>
   
    
    <body onload="loadStateUser('<%=event%>');setDefault()">
      <html:form enctype="multipart/form-data" action="/registrationAction.do" styleId="reg-form" >
        <input type="hidden" name="strNames" value="<%=strNames%>" />
        <input type="hidden" name="strValues" value="<%=strValues%>" />
    
    <!-- Always keep container class after body tag-->
            <div class="container container2">

        <!-- Including header of the project-->
        <logic:notPresent name="updatedButtonName"> 
        <div class="row">
             <jsp:include page="/app_srv/icmr/gl/globals/responsive-header.jsp"></jsp:include> 
        </div>
        </logic:notPresent>
        <!-- Including content of the registration form which will come inside article-->
        
           
            <div class="align-center whole">
               <%if(sessUserType.equals("U")||sessUserType.equals("A"))
                 {%>
                <h4 class="asphalt pad-top">Principal Investigator Registration</h4>
                <%}else{%>
                <h4 class="asphalt pad-top">Update Profile</h4>
                <%}%>
            </div>
          
      <div class="grey_border rounded padded four fifth centered gap-top gap-bottom">   
        <article class="row">
            
           
            
              <!-- Contents start from here --> 
           
       <!-- First -->
       <section class="whole">
       <fieldset>
     <!--  <p class="wrapper">
    <input class="icon" type="text" placeholder="&#61442;" />
</p>-->
<div class="whole blue_back pad-left"><h5 class="zero white">1. Login Details</h5></div>
            <div class="whole">            
                    <div class="one third pad-right-desktop">
                            <label> Choose Your Username<span class="alerttext">*</span></label>
                              <html:hidden property="operation"/>
                                    <logic:present name="updatedButtonName">
                                         <html:text styleClass="generalTbox txtinput tooltip" title="Your unique login id"  property="user_id" maxlength="25" styleId="UserId"  disabled="true"/>
                                     </logic:present>
                                     <logic:notPresent  name="updatedButtonName">
                                       <html:text styleClass="generalTbox txtinput tooltip"   title="Your unique login id" property="user_id" maxlength="25" styleId="UserId" onblur="loadStateUser('U')" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                                     </logic:notPresent>
                    </div>
                    <div class="one third">                     
                             <label>Password<span class="alerttext">*</span></label>
                             <logic:present name="updatedButtonName">
                                <html:password styleClass="generalTbox txtinput tooltip" title="Create your login password" property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                                </logic:present>
                                <logic:notPresent  name="updatedButtonName">
                                <html:password styleClass="generalTbox txtinput tooltip" title="Create your login password"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="checkDuplicacy('P')"/>
                                </logic:notPresent>
                   </div>    
                          <div class="one third pad-left-desktop">                     
                             <label> Confirm Password<span class="alerttext">*</span></label>
                              <logic:present name="updatedButtonName">
                            <html:password styleClass="generalTbox helptext txtinput nopadding tooltip" title="Confirm your login password"  property="confirmpassword" maxlength="20" styleId="confirmpassword"  tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                            </logic:present>
                            <logic:notPresent  name="updatedButtonName">
                            <html:password styleClass="generalTbox helptext txtinput nopadding tooltip" title="Confirm your login password" property="confirmpassword" maxlength="20" styleId="confirmpassword" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                            </logic:notPresent>
                   </div>       
            </div>
            <div class="whole blue_back pad-left gap-top"><h5 class="zero white">2. Personal Details</h5></div>
            
        <!-- Second -->    
                     <div class="whole pad-top-half2">
                       <label> Name<span class="alerttext">*</span></label> 
                         <div class="one third pad-right-desktop">
                                 
                                   <div class="one fourth">
                                     <html:select style="width:95%;" styleClass="chzn-select tooltip" title="Select Your Salutation" styleId="Salutation" property="sal" tabindex="<%=Integer.toString(++iTabIndex)%>">
                                       <html:options property="salValue" labelProperty="salText"/>
                                    </html:select>
                                    </div>
                                    <div class="three fourth">
                                     <html:text styleClass="mandatoryTbox txtinput tooltip" title="Your First Name" property="fullname" maxlength="20" tabindex="<%=Integer.toString(++iTabIndex)%>" styleId="FirstName"/>
                                     </div>
                         </div>
                         <div class="one third">
                                   <html:text styleClass="generalTbox txtinput nopadding tooltip" title="Your Middle Name"  property="mname" maxlength="20" styleId="MiddleName" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                        </div>
                          <div class="one third pad-left-desktop">
                                <html:text styleClass="generalTbox txtinput nopadding tooltip" title="Your Last Name" property="lname" maxlength="20" styleId="lastName" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                        </div>
                     </div>
                     
                <!-- third -->    
                  <div class="whole pad-top-half2">
                   
                          <div class="one third  pad-right-desktop">
                                 <label>Date of Birth<span class="alerttext">*</span></label>
                                  <html:text styleClass="generalTbox txtinput tooltip" title="Your Date of Birth" property="strDob" styleId="strDob" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                        </div>
                         <div class="one third">
                            <label>Designation <span class="alerttext">*</span></label>
                                   <html:text styleClass="generalTbox txtinput tooltip" title="Your Designation" property="desig" maxlength="40" styleId="Designation" tabindex="<%=Integer.toString(++iTabIndex)%>"/>   
                          </div>
                         <div class="one third pad-left-desktop">
                                    <label>Department</label>
                                     <html:text styleClass="generalTbox txtinput tooltip" title="Your Department" property="department" maxlength="40"  styleId="Department" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                        </div>
                   
                     </div>
                     
                     
                  
                     
                    <!-- eight -->          
              
                     
                       <!-- Nine -->     
                         <logic:notPresent name="updatedButtonName"> 
                  <div class="whole pad-top-half2">
                         <div class="one third  pad-right-desktop" id="state-div-id">
                               <label>State<span class="alerttext">*</span></label>
                                   <html:select styleClass="tooltip generalCombo" title="Where Your Institution is Located"  style="width: 100%;" styleId="state" property="state"  onchange="loadStateUser('S')" tabindex="<%=Integer.toString(++iTabIndex)%>">
                        <html:option value="">---Select---</html:option>
                        <html:options property="stateValue" labelProperty="stateText"/>
                        </html:select>
                        </div>
                         <div class="two third" id="institute-div-id">
                             <label> Institution<span class="alerttext">*</span></label>
                               <html:select style="width: 100%;"  styleClass="generalCombo tootltip" title="Your Institution name" property="strinstitute"  styleId="institute" tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="onSelectInst(this)">
                         <html:option value="">---Select---</html:option>
                         <html:options property="instNameValue" labelProperty="instNameText"/>
                         <html:option value="0">Other Institute</html:option>
                    </html:select>
                          </div>
                        
                     </div>
                     <fieldset style="display:none" id="otherinst">
                     <legend>Other Institute Details</legend>
                          <div class="whole" id="div_insName" style="display:none;">
                         <div class="one third">
                    <div>
                        <label>Institution<span class="alerttext">*</span></br></label>
                     </div>
                </div>
                    <div class="two third">
                  <div id="div_insNameText" style="display:none;">
                    <html:text styleClass="generalTbox tooltip" title="Name of your Institution" property="org"  maxlength="90" styleId="Institute" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="removeRedBorder()"/>
                   </div> 
                 </div>
            </div>
                 <!-- Institute type -->
                 <div class="whole pad-top" id="div_insType" style="display:none;">
                     <div class="one third">
                      <label>Institute Type<span class="alerttext">*</span></label>
                    </div>
                  <div class="two third" id="div_insTypeText">
                        <html:select styleClass="generalCombo tooltip" title="Type of your Institute" style="width:100%;"   property="strInstType"  styleId="strInstType" tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="instTypeSelected()">
                        <html:option value="">---Select---</html:option>
                         <html:options property="instTypeValue" labelProperty="instTypeText"/>
                        </html:select>
                   </div>
                    </div>
                  
                   <div class="whole pad-top" id="div_insCityLabel" style="display:none;">
                    <div class="one third">
                        <div>
                        <label>City/District<span class="alerttext">*</span></label>
                         </div>
                    </div>
                        <div class="two third">
                      <div id="div_insCityCombo">
                        <html:select styleClass="generalCombo tooltip" title="Where Your Institute is Located" style="width:100%;"  property="city"  styleId="strCity" tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="instCitySelected()">
                        <html:option value="">---Select---</html:option>
                         <html:options property="cityValue" labelProperty="cityText"/>
                        </html:select>
                        </div>
                      </div>
                 </div>
            
                 <div id="div_insAdd" class="whole pad-top" style="display:none;">
                         <div class="one third">
                  <div>
                    <label>Institute &nbsp;&nbsp;Address<span class="alerttext">*</span></label>
                    </div>
                 </div>
                    <div class="two third">
                    <div id="div_insAddText" style="display:none;">
                    <html:textarea styleClass="generalTbox tooltip" title="Address of Your Institute" cols="25" rows="2" property="temp_add" styleId="Address" onblur="instAddressEntered()" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPAdd" size="4"  value="800" />Max Length(800 Characters)
                    </div>
                   </div>
                    <div class="one third pad-top" style="display:none;">
                     <label>Zip Code<span class="alerttext">*</span></label>
                     </div>
                      <div class="two third pad-top" id="ZipCodeDiv" style="display:none;">
                                        <html:hidden property="zcode" styleId="ZipCode" value="111111"/>
                   </div>
                   
                 </div> 
                 
                 
                 </fieldset>
          </logic:notPresent>
                     
                   <!-- Ten -->           
                         
              <!-- Eleventh -->      
                    
           <!-- Twelve -->      
           
    
            
            
           
                
                 <!-- Institute Name-->
              <div class="whole pad-top-half2">
                <div class="one third pad-right-desktop">
                  
                       <label>Mobile No<span class="alerttext">*</span></label>
                       <html:text styleClass="generalTbox txtinput tooltip" title="Your 10 digit Mobile Number" property="mob_no" maxlength="10" styleId="MobileNumber" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="checkZero(this)"/>
                </div>
                      <div class="one third">
                           <label>Fax No.</label>
                        <html:text styleClass="generalTbox txtinput tooltip" title="Your Fax Number(if any)" property="fax_no" maxlength="20" styleId="FaxNumber" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                </div>
                <div class="one third pad-left-desktop">
                  <label>Email Id<span class="alerttext">*</span></label>
                    <logic:present name="updatedButtonName">
                                
                                <html:text styleClass="generalTbox txtinput tooltip" title="Your Email id" property="emailid" styleId="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isEmail(this);checkMailmodify()"/>
                                <html:hidden property="emailidold"/>
                                </logic:present>
                                
                                <logic:notPresent name="updatedButtonName">
                                <html:text styleClass="generalTbox txtinput tooltip" title="Your Email id"  property="emailid" styleId="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isEmail(this);checkMail()"/>
                                </logic:notPresent>  
                </div>
            </div>
               <div class="whole pad-top-half2 pad-bottom">
                         <div class="one half">
                                <label><i class="icon-camera icon-1.5x tooltip" title="Resume"></i> Upload Your Photo (Jpg)</label>
                                <html:file  property="imageFile" styleClass="tooltip" title="Only JPG"    size="30" onchange="check_file_Image()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file>
                         </div>
                         
                        <logic:notPresent  name="updatedButtonName">
                        <div class="one half pad-left-desktop">
                                    <label><i class="icon-file icon-1.5x tooltip" title="Resume"></i> Upload 1 page Resume (pdf)<span class="alerttext">*</span></label>
                                    <html:file  property="resumeFile" styleClass="tooltip" title="Only 1 Page PDF and Max Size 1MB" size="30"  styleId="resumeFile" onchange="check_file_Resume()" tabindex="<%=Integer.toString(++iTabIndex)%>" ></html:file> 
                        </div>
                         </logic:notPresent> 
                                    
                        <logic:present name="updatedButtonName">
                                  <div class="one half pad-left-desktop">
                                   <label><i class="icon-file icon-1.5x tooltip" title="Resume"></i>Upload 1 page Resume (pdf)
                                    <a href="#" class="filelinks tooltip" title="Download Resume" id="<%=sessUserID%>" onclick="callfile(this);" >(View Uploaded Resume)</a></label>
                                  
                                    
                                    <html:file property="resumeFile" styleClass="tooltip" title="Only 1 Page PDF and Max Size 1MB" styleId="resumeFile" size="30"  onchange="check_file_Resume()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file> 
                                    <input type="hidden" value="yes" id='res'/>
                                     </div>
                     </logic:present>
                        
                         
                     </div>
            
         
        <div class="whole blue_back pad-left"><h5 class="zero white">3. Educational Details</h5></div>
                 
              <section class="whole">
                <fieldset>
                    <legend>Degree Obtained(Begin with Bachelor's Degree)</legend>
                         <table  id="tblremarks" class="footable blue inputtable">
                          <thead>
                                    <tr>
                                        <th class="lesswidth">Degree <span class="alerttext">*</span></th>
                                        <th>Institution<span class="alerttext">*</span></th>
                                        <th>Field(s) <span class="alerttext">*</span></th>
                                        <th class="lesswidth">Year<span class="alerttext">*</span></th>
                                        <th> &nbsp;</th>
                                        </tr>                
                          </thead>
                    <logic:notPresent name="updatedButtonName">
                     <logic:notPresent  name="degree">
                            <tr>
                                <td class="middle align-center">
                                    <html:select styleClass="generalCombo tooltip edu_deg" title="Select Your Degree" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                                    <html:option value="">Degree</html:option>
                                    <html:options property="degreeValue" labelProperty="degreeText"/>
                                    <html:option value="27">Others</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:textarea styleClass="edu-institute tooltip" title="Name of Institution (Max 500 Characters)" cols="15" property="edu_inst" styleId="Institution"  tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                                </td>
                                <td>
                                    <html:textarea  styleClass="edu-field tooltip" title="Name of Field (Max 500 Characters)" cols="15" property="edu_field" styleId="Field" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                                </td>
                                <td class="middle">
                                     <html:text styleClass="txtinput nopadding edu-year tooltip" title="Degree Completion Year" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="chkYear(this);" />
                                </td>   
                                <td class="middle">
                                   <a style='display:block;' href='#' class='deleteRemarksRow black'><i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                            </tr>
                  </logic:notPresent>
                  </logic:notPresent>
                
                <logic:present name="degree">
                <logic:iterate id="degreeList" name="degree">
                     <tr>
                            <td class="middle align-center">
                                <html:select  name="degreeList" styleClass="generalCombo tooltip edu_deg" title="Select Your Degree" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                                <html:option value="">Degree</html:option>
                                <html:options property="degreeValue" labelProperty="degreeText"/>
                                <html:option value="27">Others</html:option>
                                </html:select>
                            </td>
                            <td><html:textarea styleClass="mandatoryTArea edu-institute tooltip" title="Name of Institution (Max 500 Characters)" name="degreeList" cols="15" rows="1" property="edu_inst" styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                            <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                            </td>
                            <td><html:textarea styleClass="mandatoryTArea edu-field tooltip" title="Name of Field (Max 500 Characters)"  name="degreeList" cols="15" rows="1" property="edu_field" styleId="Field" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                            <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                            </td>
                            <td class="middle">
                            <html:text name="degreeList" styleClass="smallmandatoryTbox txtinput nopadding edu-year tooltip" title="Degree Completion Year" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="chkYear(this);" />
                            </td>
                             <td class="middle">
                                 <a style='display:block;' href='#' class='deleteRemarksRow black'><i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                     </tr>
                </logic:iterate>
                </logic:present>
                
                <logic:present name="degreeUpdate">
                <logic:iterate id="degreeListUpdate" name="degreeUpdate">
                
                 <tr>
                <td class="middle align-center">
                    <html:select  name="degreeListUpdate" styleClass="generalCombo tooltip edu_deg" title="Select Your Degree" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      <html:option value="">Degree</html:option>
                     <html:options property="degreeValue" labelProperty="degreeText"/>
                     <html:option value="27">Others</html:option>
                    </html:select>
                  </td>
                
                    <td><html:textarea styleClass="mandatoryTArea edu-institute tooltip" title="Name of Institution (Max 500 Characters)" name="degreeListUpdate" cols="15" rows="1" property="edu_inst" styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                    </td>
                    <td><html:textarea styleClass="mandatoryTArea edu-field tooltip" title="Name of Field (Max 500 Characters)"  name="degreeListUpdate" cols="15" rows="1" property="edu_field" styleId="Field" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                    </td>
                  <td class="middle">
                   <html:text name="degreeListUpdate" styleClass="smallmandatoryTbox nopadding edu-year tooltip" title="Degree Completion Year" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="chkYear(this);" />
                   </td>
                    <td class="middle">
                                  <a style='display:block;' href='#' class='deleteRemarksRow black'><i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
              </tr>
                
                </logic:iterate>
                </logic:present>
                
                <logic:present name="degreeUpdateView">
                <logic:iterate id="degreeListUpdateView" name="degreeUpdateView">
                
                 <tr>
                <td class="middle align-center">
                    <html:select  name="degreeListUpdateView" styleClass="generalCombo tooltip edu_deg" title="Select Your Degree" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      <html:option value="">Degree</html:option>
                     <html:options property="degreeValue" labelProperty="degreeText"/>
                     <html:option value="27">Others</html:option>
                    </html:select>
                  </td>
                   <td><html:textarea styleClass="mandatoryTArea edu-institute tooltip" title="Name of Institution (Max 500 Characters)" name="degreeListUpdateView" cols="15" rows="1" property="edu_inst" styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                    </td>
                    <td><html:textarea styleClass="mandatoryTArea edu-field tooltip" title="Name of Field (Max 500 Characters)"  name="degreeListUpdateView" cols="15" rows="1" property="edu_field" styleId="Field" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                    </td>
                   <td class="middle">
                   <html:text name="degreeListUpdateView" styleClass="smallmandatoryTbox txtinput edu-year tooltip" title="Degree Completion Year" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="chkYear(this);" />
                   </td>
                    <td class="middle">
                                <a style='display:block;' href='#' class='deleteRemarksRow black'><i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
              </tr>
                </logic:iterate>
                </logic:present>
                </table>
                <div class="whole pad-top" align="right">
                    <input type="button" onclick="addRowToTable()" value="Add More" class="blue" title="More Degrees">
                </div>
                
                </fieldset>
                </section>
                <!--end fo educational details-->
              
                  <section class="whole">
                     <div class="whole blue_back pad-left gap-top"><h5 class="zero white">4. Research Details</h5></div>
                <fieldset>
                 <table  id="tblresearch" class="footable blue inputtable">
                   <thead>
                <tr>
                  <th class="lesswidth">Duration</th>
                  <th>Institution </th>
                  <th>Particulars of Work Done </th>
                  <th>&nbsp;</th>
                </tr>
                
                </thead>
                <logic:notPresent name="updatedButtonName">
                <logic:notPresent  name="research">
                 <tr>
                  <td class="middle">
                   <html:text  size="10" property="work_dur" maxlength="2" styleClass="txtinput nopadding res-duration tooltip" title="Duration in Month(s)" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>"/> 
                  </td>
                 <td><html:textarea  cols="15" rows="1" property="work_inst" styleId="Institution" styleClass="res-institution tooltip" title="Research Institution"  tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   <td><html:textarea  cols="15" rows="1" property="work_done" styleId="Work Detail" styleClass="res-work tooltip" title="Work Done" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                     <td class="middle">
                                <a style='display:block;' href='#' class='deleteResearchRow black'>    <i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                  </tr>
                </logic:notPresent>
                </logic:notPresent>
                <logic:present name="research">
                <logic:iterate id="reserchList" name="research">
                <tr>
                  <td class="middle">
                   <html:text  name="reserchList" styleClass="res-duration tooltip" title="Duration in Month(s)" size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>"/> 
                  </td>
                    <td><html:textarea  name="reserchList" styleClass="res-institution tooltip" title="Research Institution" cols="15" rows="1" property="work_inst" styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   <td><html:textarea  name="reserchList" cols="15" styleClass="res-work tooltip" title="Work Done"  rows="1" property="work_done" styleId="Work Detail" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                   <td class="middle">
                                  <a style='display:block;' href='#' class='deleteResearchRow black'>    <i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                  <logic:present name="researchUpdate">
                <logic:iterate id="reserchListUpdate" name="researchUpdate">
                <tr>
                  <td class="middle">
                   <html:text  name="reserchListUpdate" size="10" styleClass="res-duration tooltip" title="Duration in Month(s)" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>"/> 
                  </td>
                   <td><html:textarea  name="reserchListUpdate" cols="15" rows="1" property="work_inst" styleClass="res-institution tooltip" title="Research Institution"  styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   <td><html:textarea  name="reserchListUpdate" cols="15" styleClass="res-work tooltip" title="Work Done"  rows="1" property="work_done" styleId="Work Detail" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type=hidden name="remLenDone" size="4"  value="800">
                    </td>
                   <td class="middle">
                                    <a style='display:block;' href='#' class='deleteResearchRow black'>  <i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                   <logic:present name="researchUpdateView">
                <logic:iterate id="reserchListUpdateView" name="researchUpdateView">
                <tr>
                  <td class="middle">
                   <html:text  name="reserchListUpdateView" styleClass="res-duration tooltip" title="Duration in Month(s)" size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>"/> 
                  </td>
                   <td><html:textarea  name="reserchListUpdateView" styleClass="res-institution tooltip" title="Research Institution"  cols="15" rows="1" property="work_inst" styleId="Institution" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   <td><html:textarea  name="reserchListUpdateView" styleClass="res-work tooltip" title="Work Done"  cols="15" rows="1" property="work_done" styleId="Work Detail" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                   <td class="middle">
                                      <a style='display:block;' href='#' class='deleteResearchRow black'>    <i class="icon-trash icon-2x tooltip" title="Delete"></i></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  </table>
                  <div class="whole pad-top" align="right">
                        <input type="button" onclick="addRowToTableResearch()" value="Add More" class="blue" title="More Research">
                  </div>
                </fieldset>
             </section>
                 <div class="whole pad-top">
                         <div class="one fourth">
                         <label>Research Specialization<span class="alerttext">*</span></label>
                         </div>
                          <div class="three fourth">
                                <html:textarea  cols="15" rows="1" styleClass="mandatoryTArea tooltip" title="Major Scientific fields of interest" property="strResearch" styleId="ResearchSpecialization" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                <input readonly="readonly" type="hidden" name="remLenResearch" size="4"  value="500"> Max Length(500 Characters)
                          </div>
                    </div>
                    
                     
                     
               <logic:notPresent  name="updatedButtonName">
                     <div class="whole blue_back pad-left gap-top"><h5 class="zero white">5. Other Details</h5></div>
                       <div class="whole pad-top-half2 pad-bottom">
                            <div class="one half">
                                <label>Private Key Password <span class="alerttext">*</span></label>
                                 <html:password styleClass="generalTbox txtinput nopadding tooltip" title="To Protect Your Proposals From Un-authorized Access" property="strDocpass" styleId="strDocpass" maxlength="50" onblur="checkDuplicacy('D');"  size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>" />  
                            </div>
                            <div class="one half pad-left-desktop">
                                <label>Confirm  Private Key Password <span class="alerttext">*</span></label>
                                <html:password styleClass="generalTbox txtinput nopadding tooltip" title="Confirm Your Password" styleId="strDocConfirmPass" property="strDocConPass"  maxlength="50" size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                            </div>
                       </div>
                </logic:notPresent>
                
              <logic:notPresent name="updatedButtonName">
              <div class="whole pad-top">
                    <input id="sms" name="sms" type="checkbox" value="Y" onclick="setSMS(this)"/>
                    <input type="hidden" name="_sms" id="_sms" value="on"/>
                    <label for="sms" class="inline">Do you want to recieve SMS alerts?</label>
              </div>
            </logic:notPresent>
                        
         <div class="whole pad-top align-center">
                       
              
                  <logic:present name="updatedButtonName">
                  <input class="generalButton blue" type="BUTTON" name="mod" id="mod" tabindex="<%=Integer.toString(++iTabIndex)%>" value="Modify"></input>
                  </logic:present>
                  <logic:notPresent name="updatedButtonName">
                  
                    <input class="generalButton blue" type="BUTTON" name="sub" id="sub"  tabindex="<%=Integer.toString(++iTabIndex)%>" value="Submit"></input>
                    
                    </logic:notPresent>
                    
                    <logic:notPresent name="updatedButtonName">
                      <input class="generalButton blue" type="BUTTON" name="Reset" id="Reset" tabindex="<%=Integer.toString(++iTabIndex)%>" value="Reset"></input>
                     </logic:notPresent>
                    
                
                 
             </div>
             
              <div class="whole pad-top">
                         
                  <%if(session.getAttribute("userInfo")==null)
                 {%><div class="one fourth">
                    <p align="left">
                     <span class="alerttext">
                      <a href="/ICMR/index.do">Already Registered</a></span>
                    </p>
                  </div>
                  <%}%><input type="hidden"  name="hmode"/>
              </div>
                     
              </fieldset>   
              </section>
           
                 </article>    
          </div>     
        <!-- Including footer of the project-->
    <logic:notPresent name="updatedButtonName">
        <div class="pad-top double">
        <jsp:include page="/app_srv/icmr/gl/globals/responsive-footer.jsp"></jsp:include>   
        </div>
    </logic:notPresent>
    </div>
    
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
  
  <logic:notPresent name="updatedButtonName">
  <!-- Icmr jquery validation : jquery validation supportive css and js are included in responsive-js-css  -->
  <script type="text/javascript">
   $('#Address').validatebox({
                validType: ["alphaspecial","maxLength[800]",'minLength[1]']                
         });
          $('#FaxNumber').validatebox({
                validType: ["Numeric","maxLength[20]",'minLength[3]']                
         });
         $('#UserId').validatebox({
                required: true, 
                validType: ["AlphaNumericWithdot","maxLength[25]",'minLength[6]']                
         });
         $('#password').validatebox({
                required: true,
                validType: ["maxLength[20]",'minLength[6]']   
         });
          $('#confirmpassword').validatebox({
                required: true,
                validType: ['equals[\"#password\"]',"maxLength[20]",'minLength[6]']
         });
         $('#FirstName').validatebox({
                required: true,
                validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
         $('#MiddleName').validatebox({
               validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
           $('#lastName').validatebox({
                required: true,
                validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
           $('#Designation').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[40]",'minLength[2]']  
         });
           $('#Department').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[40]",'minLength[2]'] 
         });
           $('#strDob').validatebox({
                required: true,
                validType: ["dateType","maxLength[10]",'minLength[10]']
         });
           $('#MobileNumber').validatebox({
             
                validType: ["Mobile","maxLength[10]",'minLength[10]']
         });
         $('#sms').click(function(){ 
            if((this).checked==true){
                    $('#MobileNumber').validatebox({   
                        required:true, validType: ["Mobile","maxLength[10]",'minLength[10]']
                   })
            }else{
                $('#MobileNumber').validatebox({   
                        required:false,validType: ["Mobile","maxLength[10]",'minLength[10]']
                   })
            }
        });
         
           $('#emailid').validatebox({
                required: true,
                validType: ["maxLength[50]",'minLength[6]']
         });
           $('#ResearchSpecialization').validatebox({
                required: true,
                 validType: ["alphaspecial","maxLength[500]"]
         });
           $('#strDocpass').validatebox({
                required: true,
                validType: ["maxLength[50]",'minLength[6]']
         });
        $('#strDocConfirmPass').validatebox({
                required: true,
                validType: ['equals[\"#strDocpass\"]',"maxLength[50]",'minLength[6]']
         });
         $('#resumeFile').validatebox({
                required: true
         });
         $('.edu_deg').validatebox({
                required: true
         });
         $('.edu-institute').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[500]"]
         });
            $('.edu-field').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[500]"]
         });             
           $('.edu-year').validatebox({
                required: true,
                validType: ["Numeric","maxLength[4]",'minLength[4]']
         });
          $('.edu_deg').validatebox({
                required: true
         });
        //Research Duration
              $('.res-duration').validatebox({
                    validType: ["Numeric","maxLength[2]",'minLength[1]']
             });
              $('.res-institution').validatebox({
                    validType: ["alphaspecial","maxLength[500]"]
             });
             $('.res-work').validatebox({
                    validType: ["alphaspecial","maxLength[800]"]
             });
        //For submission
         $('#sub').click(function(){
                               //For State Chozen combo validation" 
                                if($('#state').val() == null || $('#state').val() == ""){
                                        $('#state-div-id').addClass("red-border");
                                   }                              
                               //For Institution Chozen combo validation" 
                               
                                if($('#institute').val() == null || $('#institute').val() == ""){
                                        $('#institute-div-id').addClass("red-border");
                                   }  
                             
                               //Check for : Institute is others
                               if($('#institute').val()=="0"){
                                       //If institute address is blank
                                        if($('#Institute').val()==""){
                                            $('#div_insNameText').addClass("red-border");
                                        }
                                        //If Institute type has been selected
                                        if($('#strInstType').val()==""){
                                            $('#div_insTypeText').addClass("red-border");
                                        }
                                        //Institute Address has been entered or not
                                         if($('#Address').val()==""){
                                            $('#div_insAddText').addClass("red-border");
                                        }
                                        //If zip code has been entered
                                        /*if($('#ZipCode').val()==""){
                                            $('#ZipCodeDiv').addClass("red-border");
                                        }*/
                                        //If city has been selected
                                         if($('#strCity').val()==""){
                                            $('#div_insCityCombo').addClass("red-border");
                                        }
                               }
                     
                            if($('#reg-form').form('validate')){
                                check_mandatory('Submit');
                            }  
                      });
     </script>
   </logic:notPresent>
   <logic:present name="updatedButtonName">
            <!-- Icmr jquery validation : jquery validation supportive css and js are included in responsive-js-css  -->
        <script type="text/javascript">	
        $('#Address').validatebox({
                validType: ["alphaspecial","maxLength[800]",'minLength[1]']                
         });
        $('#FaxNumber').validatebox({
                validType: ["Numeric","maxLength[20]",'minLength[3]']                
         });
         $('#UserId').validatebox({
                required: true, 
                validType: ["AlphaNumericWithdot","maxLength[25]",'minLength[6]']                
         });
         $('#password').validatebox({
                required: true,
                validType: ["maxLength[20]",'minLength[6]']   
         });
          $('#confirmpassword').validatebox({
                required: true,
                validType: ['equals[\"#password\"]',"maxLength[20]",'minLength[6]']
         });
         $('#FirstName').validatebox({
                required: true,
                validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
         $('#MiddleName').validatebox({
               validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
           $('#lastName').validatebox({
                required: true,
                validType: ["AlphaNumericWithApos","maxLength[20]",'minLength[1]']                
         });
           $('#Designation').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[40]",'minLength[2]']  
         });
           $('#Department').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[40]",'minLength[2]'] 
         });
           $('#strDob').validatebox({
                required: true,
                validType: ["dateType","maxLength[10]",'minLength[10]']
         });
           $('#MobileNumber').validatebox({
               
                validType: ["Mobile","maxLength[10]",'minLength[10]']
         });
           
           $('#emailid').validatebox({
                required: true,
                validType: ["maxLength[50]",'minLength[6]']
         });
           $('#ResearchSpecialization').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[500]"]
         });
         $('.edu_deg').validatebox({
                required: true
         });
         $('.edu-institute').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[500]"]
         });
            $('.edu-field').validatebox({
                required: true,
                validType: ["alphaspecial","maxLength[500]"]
         });             
           $('.edu-year').validatebox({
                required: true,
                validType: ["Numeric","maxLength[4]",'minLength[4]']
         });
         $('.edu_deg').validatebox({
                required: true
         });
         //Research Duration
              $('.res-duration').validatebox({
                    validType: ["Numeric","maxLength[2]",'minLength[1]']
             });
              $('.res-institution').validatebox({
                    validType: ["alphaspecial","maxLength[500]"]
             });
             $('.res-work').validatebox({
                    validType: ["alphaspecial","maxLength[800]"]
             });
          //For Modification
            //For submission
         $('#mod').click(function(){
                            if($('#reg-form').form('validate')){
                                check_mandatory('Modify');
                            }  
                      });   
                      
                      
                   
     </script>
   </logic:present>
   
    
        <script type="text/javascript">
        $('#Reset').click(function(){
                          Cancel('Reset');
                      });   
        function removeRedBorder(){
             if($('#Institute').val()!=""){
                     $('#div_insNameText').removeClass("red-border");
             }
        }
        function instTypeSelected(){
            if($('#strInstType').val()!=""){
                     $('#div_insTypeText').removeClass("red-border");
             }else{
                  $('#div_insTypeText').addClass("red-border");
             }
        }
        function instAddressEntered(){
            if($('#Address').val()!=""){
                     $('#div_insAddText').removeClass("red-border");
             }
        }
        function instCitySelected(){
            if($('#strCity').val()!=""){
                     $('#div_insCityCombo').removeClass("red-border");
             }else{
                  $('#div_insCityCombo').addClass("red-border");
             }
        }
        </script>
     </html:form>
     
     <div id="login" style="display:none ; border-style: none; border-color: inherit; border-width: medium; position: absolute; z-index:0 ; left: 0px; top: 0px; width: 100%; height: 250%; filter:alpha(opacity:60); opacity:.60; -moz-opacity:.60;
       background-color: #000000;"></div>
  
  <div id="loginpopupObject" style="border-width: medium;  border-color: inherit; display:none;top:90%;left:22%;position:absolute;width:55%; z-index:1; background-color: White;">
  <br><br>
  <DIV align="center" ><img align="middle"  src="/ICMR/app_srv/icmr/gl/images/loading123.gif" /></div>
  <br>
  <DIV align="center">
 <FONT color="Gray" size="3" >Please Wait,It may take few minutes to generate your Security certificates.<br>
  Do not Close or Refresh this Window.
  </font>
  </div>
  </div>
  

<script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/plugins/jquery.magnific-popup.js"></script> 
  <logic:notPresent name="updatedButtonName">
  <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
</logic:notPresent>
    </body>
    <label onclick="callTestLogin()">Test the Login</label>
    <script>
        function callTestLogin() 
        {
              var str="testLogin.do";
              window.open(str,'child','scrollbars,width=650,height=300');                 
        }
    </script>
</html>