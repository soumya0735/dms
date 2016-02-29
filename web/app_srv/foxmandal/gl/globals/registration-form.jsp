<!-- Generally required in project, No relation with responsives -->
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@ page import=" java.io.File" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="_dbq" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" scope="session"/>
<html>
    <head>
        <!-- including all required js and css files-->
        <jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css.jsp"></jsp:include> 
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
    width:400px;       
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
    
    
        if (document.forms[0].edu_deg.value==""||document.forms[0].edu_inst.value==""||document.forms[0].edu_field.value==""||document.forms[0].edu_year.value=="")
        {
          alert("First enter educational qualification for previous row,then add a new row.");
          return false;
        }
      if(lastRow==2)
     {
      
     
     
      var fields=new Array("edu_deg","edu_inst","edu_field","edu_year");
       
       
         for(i=0;i<fields.length;i++)
         {
                 var temp=fields[i];
                 
                  var stat= isAlphaNumericWithApos(eval("document.forms[0]."+temp+""));
                 if (stat==false)
                 return false;
                  
                 
                 
         }

       return true;
       
 }
  
    
  
  if (lastRow>2)
  {
    
    if (document.forms[0].edu_deg[lastRow-2].value==""||document.forms[0].edu_inst[lastRow-2].value==""||document.forms[0].edu_field[lastRow-2].value==""||document.forms[0].edu_year[lastRow-2].value=="")
    {
      alert("First enter educational qualification for previous row,then add a new row.");
      return false;
    }
    else
    {
    
         var fields=new Array("edu_deg","edu_inst","edu_field","edu_year");
       
       
         for(i=0;i<fields.length;i++)
         {
                 var temp=fields[i];
               
                  var stat= isAlphaNumericWithApos(eval("document.forms[0]."+temp+"[lastRow-2]"));
                 if (stat==false)
                 return false;
                  
                 
                 
         }

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
    
    
        if (document.forms[0].work_dur.value==""||document.forms[0].work_inst.value==""||document.forms[0].work_done.value=="")
        {
          alert("First enter research training experience for previous row,then add a new row.");
          return false;
        }
      if(lastRow==2)
     {
      
     
     
      var fields=new Array("work_inst","work_done");
       
       
         for(i=0;i<fields.length;i++)
         {
                 var temp=fields[i];
                  var stat= isAlphaNumericWithApos(eval("document.forms[0]."+temp+""));
                 if (stat==false)
                 return false;
         }
       return true;
 }
  
    
  
  if (lastRow>2)
  {
    
    if (document.forms[0].work_dur[lastRow-2].value==""||document.forms[0].work_inst[lastRow-2].value==""||document.forms[0].work_done[lastRow-2].value=="")
    {
      alert("First enter research training experience for previous row,then add a new row.");
      return false;
    }
    else
    {
    
         var fields=new Array("work_inst","work_done");
       
       
         for(i=0;i<fields.length;i++)
         {
             var temp=fields[i];
             var stat= isAlphaNumericWithApos(eval("document.forms[0]."+temp+"[lastRow-2]"));
             if (stat==false)
             return false;
         }

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
       
          var tbl = document.getElementById('tblremarks');
          var lastRow = tbl.rows.length;
          var iteration = lastRow;
          
          var strNames=document.forms[0].strNames.value;
         
          var combonames=strNames.split("#");
          
          var strValues=document.forms[0].strValues.value;
          var comboValues=strValues.split("#");
          

          var row = tbl.insertRow(lastRow);
          
            
          var cellRight = row.insertCell(0);
          var el = document.createElement("select");
          el.name = 'edu_deg';
          el.id = 'edu_deg';
         
          iCount=1;
          el.options[0]=new Option("--Select--","");
          for(i = 0; i<combonames.length-1; i++) 
          { 
           el.options[iCount]=new Option(comboValues[i],combonames[i]);
           iCount++;
          }
            cellRight.appendChild(el);
            
          var cellRight = row.insertCell(1);
          
          var el = document.createElement("textarea");
          el.setAttribute("name", "edu_inst");
          el.setAttribute("cols", "15");
          el.setAttribute("rows", "1");
          el.setAttribute("id", "edu_inst");
          el.className="mandatoryTArea";
          el.onblur=function(){isAlphaNumericWithApos(this),checkLen(this,500)};  
          cellRight.appendChild(el);





          var cellRight = row.insertCell(2);
          var el = document.createElement("textarea");
          el.setAttribute("name", "edu_field");
          el.setAttribute("cols", "15");
          el.setAttribute("rows", "1");
          el.setAttribute("id", "edu_field");
          el.className="mandatoryTArea";
          el.onblur=function(){isAlphaNumericWithApos(this),checkLen(this,500)};  
          cellRight.appendChild(el);

          var cellRight = row.insertCell(3);
          var el = document.createElement('input');
          el.type = 'text';
          el.name = 'edu_year';
          el.id = 'edu_year';
          
          el.onblur=function(){chkYear(this),isNumber(this)};
          el.size = 10;
          el.setAttribute('maxlength','4');
            el.className="smallmandatoryTbox";
          
          cellRight.appendChild(el);
        }  
          
          
    }
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
       
          var tbl = document.getElementById('tblresearch');
          var lastRow = tbl.rows.length;
          var iteration = lastRow;
          
          
          

          var row = tbl.insertRow(lastRow);
          
            
          var cellRight = row.insertCell(0);
          var el = document.createElement('input');
          el.type = 'text';
          el.name = 'work_dur';
          el.id = 'work_dur'; 
          el.onblur=function(){isNumber(this)}; 
          el.size = 10;
          el.setAttribute('maxlength','3');
          cellRight.appendChild(el);

          var cellRight = row.insertCell(1);
          var el = document.createElement("textarea");
          el.setAttribute("name", "work_inst");
          el.setAttribute("cols", "15");
          el.setAttribute("rows", "1");
          el.setAttribute("id", "work_inst");
          el.onblur=function(){isAlphaNumericWithApos(this),checkLen(this,500)};  
          cellRight.appendChild(el);





          var cellRight = row.insertCell(2);
          var el = document.createElement("textarea");
          el.setAttribute("name", "work_done");
          el.setAttribute("cols", "15");
          el.setAttribute("rows", "1");
          el.setAttribute("id", "work_done");
          el.onblur=function(){isAlphaNumericWithApos(this),checkLen(this,800)};   
          cellRight.appendChild(el);
            

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
                    
                 
                    //For footable
                     $('table').footable();     
                 //Date-picker  
                   //For diffrent options available with datepicker, 
                   //please check the URL: http://jqueryui.com/datepicker/#default
                  $( "#strDob" ).datepicker({
                        changeMonth: true,   //Show month
                        changeYear: true,     //Show year
                        altField: "#alternate",    //Show in alternate field
                        altFormat: "DD, d MM, yy"   //show alternate in following format
                  });
                 
                //Place Holders
                 $("#UserId").attr("placeholder", "User Id");
                 $("#password").attr("placeholder", "Password");
                 $("#confirmpassword").attr("placeholder", "Confirm Password");
                 $("#FirstName").attr("placeholder", "First Name");
                 $("#MiddleName").attr("placeholder", "Middle Name");
                 $("#lastName").attr("placeholder", "Last Name");
                 $("#Designation").attr("placeholder", "Designation");
                 $("#Department").attr("placeholder", "Department");
                 $("#strDob").attr("placeholder", "DD-MM-YYYY");
                 $("#Institute").attr("placeholder", "Institute name as mentioned in your resume");
                 $("#Address").attr("placeholder", "Address of Institute");
                 $("#ZipCode").attr("placeholder", "Zip Code");
                 $("#MobileNumber").attr("placeholder", "XXXXXXXXXX");
                 $("#FaxNumber").attr("placeholder", "Fax No.");
                 $("#emailid").attr("placeholder", "E-mail ID");
                 $("#ResearchSpecialization").attr("placeholder", "Specialization");
                 $("#strDocpass").attr("placeholder", "Private Key Password");
                 $("#strDocConfirmPass").attr("placeholder", "Confirm Private Key Password");
                 
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
                        var table = document.getElementById("tblremarks");
                        var lastRow = table.rows.length;
                        if(lastRow>2){
                            var href = $(this).attr('href');
                            $(this).closest("tr").remove(); // remove row
                        }
                        return false; // prevents default behavior
                   });
         
     });
  </script>  
  <!-- For Placeholder Ends here -->
  
    </head>
   
    
    <body onload="loadStateUser('<%=event%>');setDefault()">
      <html:form enctype="multipart/form-data" action="/registrationAction.do"  >
      <input type="hidden" name="strNames" value="<%=strNames%>" />
<input type="hidden" name="strValues" value="<%=strValues%>" />
    <!--div id="popup_box">   
           <h2 style="font-weight:bold;text-align:center">Are you a first timer?</h2>
            <p style="color:red">Please go through the guidelines before using this portal.</p>
            <ul style="padding-left:100px;text-align:justify" >
            <li><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/Registration_guidelines.pdf" >Registration Guidelines</a></li>
            <li><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/revised_procedure_EMR.pdf">Extramural Programme of ICMR</a></li>
            <li><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/preProposal.pdf">Pre-Proposal Submission format</a></li>
            <li><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/detailedProposal.pdf">Detailed Proposal Submission format</a></li>
            </ul>
            <a id="popupBoxClose">X</a>   
   </div--/>
   
    <!-- Always keep container class after body tag-->
    <div class="container">
        <!-- Including header of the project-->
        <div class="row">
        <jsp:include page="/app_srv/icmr/gl/globals/responsive-header.jsp"></jsp:include> 
        </div>
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
            <div class="whole">            
                    <div class="one fourth">
                            <label>User Id<span class="alerttext">*</span></label>
                    </div>
                    <div class="three fourth">                     
                              <html:hidden property="operation"/>
                                    <logic:present name="updatedButtonName">
                                         <html:text styleClass="generalTbox"  property="user_id" maxlength="25" styleId="UserId"  disabled="true" />
                                     </logic:present>
                                     <logic:notPresent  name="updatedButtonName">
                                            <html:text styleClass="generalTbox"   property="user_id" maxlength="25" styleId="UserId" onblur="checkMaxlenReg(this,25,6);userId(this);loadStateUser('U')" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                                     </logic:notPresent>
                   </div>                   
            </div>
            
        <!-- Second -->    
                     <div class="whole pad-top">
                         <div class="one fourth">
                                <label>Password<span class="alerttext">*</span></label>
                         </div>
                         <div class="three fourth">
                                <logic:present name="updatedButtonName">
                                <html:password styleClass="generalTbox"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                                </logic:present>
                                <logic:notPresent  name="updatedButtonName">
                                <html:password styleClass="generalTbox"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(this,confirmpassword,'P');checkDuplicacy('P');checkMaxlenReg(this,20,6)"/>
                                </logic:notPresent>
                        </div>
                     </div>
                     
                <!-- third -->    
                     <div class="whole pad-top">
                         <div class="one fourth">
                                <label> Confirm Password<span class="alerttext">*</span></label>
                         </div>
                         <div class="three fourth">
                            <logic:present name="updatedButtonName">
                            <html:password styleClass="generalTbox helptext" title="Shuold be same as password"  property="confirmpassword" maxlength="20" styleId="confirmpassword"  tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                            </logic:present>
                            <logic:notPresent  name="updatedButtonName">
                            <html:password styleClass="generalTbox helptext" title="Shuold be same as password" property="confirmpassword" maxlength="20" styleId="confirmpassword" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(password,this,'C');checkMaxlenReg(this,20,6)"/>
                            </logic:notPresent>
                        </div>
                     </div>     
                     
                
                     <!-- Name -->
                     <div class="whole pad-top">
                        <div class="one fourth">
                                <label> Name<span class="alerttext">*</span></label>
                         </div>
                         <div class="three fourth">
                            <div class="one seventh">
                                     <html:select style="width:95%;" styleClass="chzn-select" styleId="Salutation" property="sal" tabindex="<%=Integer.toString(++iTabIndex)%>">
                                       <html:options property="salValue" labelProperty="salText"/>
                                    </html:select>
                            </div>
                            <div class="two seventh">
                                 <html:text styleClass="mandatoryTbox" property="fullname" maxlength="20" tabindex="<%=Integer.toString(++iTabIndex)%>" styleId="FirstName" onblur="isAlphabetWithApos(this);checkMaxlenReg(this,20,1)"/>
                            </div>
                            <div class="pad-left two seventh">
                                    <html:text styleClass="generalTbox"  property="mname" maxlength="20" styleId="MiddleName" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabetWithApos(this); checkMaxlenReg(this,20,1)"/>
                            </div>
                            <div class="pad-left two seventh">
                                    <html:text styleClass="generalTbox" property="lname" maxlength="20" styleId="lastName" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabetWithApos(this);checkMaxlenReg(this,20,1)"/>
                            </div>
                         </div>
                     </div>
                     
                     
                     
                  
                     
                    <!-- eight -->          
                 <div class="whole pad-top">
                         <div class="one fourth">
                    <label>User Image<span class="alerttext">(Only JPG)</span></label>
                </div>
                 <div class="three fourth">
                    <html:file  property="imageFile"    size="30" onchange="check_file_Image()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file>
                 </div>
                     </div>
                     
                       <!-- Nine -->       
                  <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Designation <span class="alerttext">*</span></label>
                  </div>
                 <div class="three fourth">
                    <html:text styleClass="generalTbox" property="desig" maxlength="40" styleId="Designation" size="30" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);checkMaxlenReg(this,40,2)"/>
                 </div>
                     </div>
                   <!-- Ten -->           
             <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Department</label>
                 </div>
                 <div class="three fourth">
                    <html:text styleClass="generalTbox" property="department" maxlength="40"  styleId="Department" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);checkMaxlenReg(this,40,2)"/>
                   </div>
            </div>
            
              <!-- Eleventh -->      
               <div class="whole pad-top">
                         <div class="one fourth">
                    <label>DOB <span class="alerttext">*</span></label>
                </div>
                 <div class="one fourth">
                     <html:text styleClass="generalTbox" property="strDob" styleId="strDob" onblur="date_chk(this);checkLen(this,10);"   size="5" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                 </div>
                 <div class="pad-left two fourth">
                 <input type="text" id="alternate" size="30"/>
                 </div>
                </div>
         
           <!-- Twelve -->      
            <logic:notPresent name="updatedButtonName"> 
           <div class="whole pad-top">
                         <div class="one fourth">
                         <label>State<span class="alerttext">*</span></label>
                         </div>
                    <div class="three fourth">
                        <html:select styleClass="generalCombo chzn-select" styleId="state" property="state"  onchange="loadStateUser('S')" tabindex="<%=Integer.toString(++iTabIndex)%>">
                        <html:option value="">---Select---</html:option>
                        <html:options property="stateValue" labelProperty="stateText"/>
                        </html:select>
                    </div>
            </div>
            
            
           
                
                 <!-- Institute Name-->
              <div class="whole pad-top">
                         <div class="one fourth">
                    <label> Institution<span class="alerttext">*</span></label>
                    
                </div>
                    <div class="three fourth">
                    <html:select style="width: 400px;"  styleClass="generalCombo chzn-select " property="strinstitute"  styleId="institute" tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="onSelectInst(this)">
                         <html:option value="">---Select---</html:option>
                         <html:options property="instNameValue" labelProperty="instNameText"/>
                         <html:option value="0">Other Institute</html:option>
                    </html:select>
                  </div>
            </div>
            
               <div class="whole" id="div_insName" style="display:none;">
                         <div class="one fourth">
                    <div>
                        <label>Name of the Institute<span class="alerttext">*</span></br></label>
                     </div>
                </div>
                    <div class="three fourth">
                  <div id="div_insNameText" style="display:none;">
                    <html:text styleClass="generalTbox" property="org"  maxlength="90" styleId="Institute" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);checkMaxlenReg(this,90,3)"/>
                   </div> 
                 </div>
            </div>
                 <!-- Institute type -->
                 <div class="whole pad-top" id="div_insType" style="display:none;">
                     <div class="one fourth">
                      <label>Institute Type<span class="alerttext">*</span></label>
                    </div>
                  <div class="three fourth">
                        <html:select styleClass="generalCombo" style="width:400px;"   property="strInstType"  styleId="strInstType" tabindex="<%=Integer.toString(++iTabIndex)%>">
                        <html:option value="">---Select---</html:option>
                         <html:options property="instTypeValue" labelProperty="instTypeText"/>
                        </html:select>
                   </div>
                  </div>
              
            
             <div class="whole pad-top">
                <div class="one fourth">
                    <div id="div_insCityLabel" style="display:none;">
                    <label>City/District<span class="alerttext">*</span></label>
                     </div>
                </div>
                    <div class="three fourth">
                  <div id="div_insCityCombo" style="display:none;">
                    
                    <html:select styleClass="generalCombo" property="city"  styleId="strCity" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                    <html:option value="">---Select---</html:option>
                     <html:options property="cityValue" labelProperty="cityText"/>
                    </html:select>
                    </div>
                      </div>
               
           </div>
            
                 <div class="whole pad-top">
                         <div class="one fourth">
                  <div id="div_insAdd" style="display:none;">
                    <label>Institute &nbsp;&nbsp;Address<span class="alerttext">*</span></label>
                    </div>
                 </div>
                    <div class="three fourth">
                    <div id="div_insAddText" style="display:none;">
                    <html:textarea styleClass="generalTbox" cols="25" rows="2" property="temp_add" styleId="Address" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPAdd,800)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPAdd" size="4"  value="800" />Max Length(800 Characters)
                    </div>
                   </div>
                 </div>               
          </logic:notPresent>
        
        
                 <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Zip Code<span class="alerttext">*</span></label>
                  </div>
                    <div class="three fourth">
                    <html:text styleClass="generalTbox" property="zcode" maxlength="6" styleId="ZipCode" size="30"  tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,6,6)"/>
                 </div>
                 </div>
                 
              <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Mobile No<span class="alerttext">*</span></label>
                   
               </div>
                    <div class="three fourth">
                    <html:text styleClass="generalTbox" property="mob_no" maxlength="10" styleId="MobileNumber" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="mobile(this);checkMaxlenReg(this,10,10);checkZero(this)"/>
                 </div>
                 </div>
                 
                <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Fax No.</label>
                   </div>
                    <div class="three fourth">
                    <html:text styleClass="generalTbox" property="fax_no" maxlength="20" styleId="FaxNumber" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,20,3)"/>
                   </div>
                 </div>
                 
                 
                 <div class="whole pad-top">
                         <div class="one fourth">
                    <label>Email Id<span class="alerttext">*</span></label>
                </div>
                    <div class="three fourth">
                                <logic:present name="updatedButtonName">
                                
                                <html:text styleClass="generalTbox" property="emailid" styleId="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isEmail(this);checkMaxlenReg(this,50,6);checkMailmodify()"/>
                                <html:hidden property="emailidold"/>
                                </logic:present>
                                
                                <logic:notPresent name="updatedButtonName">
                                <html:text styleClass="generalTbox"  property="emailid" styleId="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isEmail(this);checkMaxlenReg(this,50,6);checkMail()"/>
                                </logic:notPresent>
                     </div>
                 </div>
              </fieldset>   
              </section>
              
              <section class="whole">
                <fieldset>
                    <legend>Educational Qualification: Degree Obtained(Begin with Bachelor's Degree)</legend>
                         <table  id="tblremarks" class="footable blue">
                          <thead>
                                    <tr>
                                        <th data-class="expand">Degree <span class="alerttext">*</span></th>
                                        <th data-hide="phone">Institution<br>(Max 500 Chars)<span class="alerttext">*</span></th>
                                        <th data-hide="phone">Field(s) <br/>(Max 500 Chars)<span class="alerttext">*</span></th>
                                        <th data-hide="phone">Year<span class="alerttext">*</span></th>
                                        <th data-hide="phone">Delete</th>
                                        </tr>                
                          </thead>
                    <logic:notPresent name="updatedButtonName">
                     <logic:notPresent  name="degree">
                            <tr>
                                <td>
                                    <html:select styleClass="generalCombo" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                                    <html:option value="">---Select---</html:option>
                                    <html:options property="degreeValue" labelProperty="degreeText"/>
                                    <html:option value="27">Others</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:textarea  styleClass="" cols="15" property="edu_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPInst,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                                </td>
                                <td>
                                    <html:textarea  styleClass="" cols="15" property="edu_field" styleId="Field" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPField,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                                </td>
                                <td>
                                     <html:text styleClass="" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);checkMaxlenReg(this,4,4)" />
                                </td>   
                                <td>
                                <a style='display:block;' href='#' class='deleteRemarksRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                            </tr>
                  </logic:notPresent>
                  </logic:notPresent>
                
                <logic:present name="degree">
                <logic:iterate id="degreeList" name="degree">
                     <tr>
                            <td>
                            <html:select  name="degreeList" styleClass="generalCombo" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                            
                            <html:option value="">---Select---</html:option>
                            <html:options property="degreeValue" labelProperty="degreeText"/>
                            <html:option value="27">Others</html:option>
                            </html:select>
                            </td>
                            <!--td><html:text name="degreeList" size="10" property="edu_inst" maxlength="50" styleId="edu_inst" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);" /> 
                            </td>
                            <td><html:text name="degreeList" size="10" property="edu_field" maxlength="50" styleId="edu_field" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
                            </td-->
                            <td><html:textarea styleClass="mandatoryTArea" name="degreeList" cols="15" rows="1" property="edu_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPInst,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                            <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                            </td>
                            
                            <td><html:textarea styleClass="mandatoryTArea"  name="degreeList" cols="15" rows="1" property="edu_field" styleId="Field"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPField,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                            <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                            </td>
                            
                            <td>
                            <html:text name="degreeList" styleClass="smallmandatoryTbox" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);checkMaxlenReg(this,4,4)" />
                            </td>
                             <td>
                                <a style='display:block;' href='#' class='deleteRemarksRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                     </tr>
                </logic:iterate>
                </logic:present>
                
                <logic:present name="degreeUpdate">
                <logic:iterate id="degreeListUpdate" name="degreeUpdate">
                
                 <tr>
                <td>
                    <html:select  name="degreeListUpdate" styleClass="generalCombo" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      
                      <html:option value="">---Select---</html:option>
                     <html:options property="degreeValue" labelProperty="degreeText"/>
                     <html:option value="27">Others</html:option>
                    </html:select>
                  </td>
                
                    <td><html:textarea styleClass="mandatoryTArea" name="degreeListUpdate" cols="15" rows="1" property="edu_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPInst,500)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                    </td>
                    <td><html:textarea styleClass="mandatoryTArea"  name="degreeListUpdate" cols="15" rows="1" property="edu_field" styleId="Field"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPField,500)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                    </td>
                
                 
                  
                   
                   <td>
                   <html:text name="degreeListUpdate" styleClass="smallmandatoryTbox" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);checkMaxlenReg(this,4,4)" />
                   </td>
                    <td>
                                <a style='display:block;' href='#' class='deleteRemarksRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
              </tr>
                
                </logic:iterate>
                </logic:present>
                
                <logic:present name="degreeUpdateView">
                <logic:iterate id="degreeListUpdateView" name="degreeUpdateView">
                
                 <tr>
                <td>
                    <html:select  name="degreeListUpdateView" styleClass="generalCombo" property="edu_deg"  styleId="edu_deg" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      
                      <html:option value="">---Select---</html:option>
                     <html:options property="degreeValue" labelProperty="degreeText"/>
                     <html:option value="27">Others</html:option>
                    </html:select>
                  </td>
                   <!--td><html:text name="degreeListUpdateView" size="10" property="edu_inst" maxlength="50" styleId="edu_inst" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);" /> 
                   </td>
                   <td><html:text name="degreeListUpdateView" size="10" property="edu_field" maxlength="50" styleId="edu_field" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
                   </td-->
                   
                   <td><html:textarea styleClass="mandatoryTArea" name="degreeListUpdateView" cols="15" rows="1" property="edu_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPInst,500)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPInst" size="4"  value="500">
                    </td>
                    <td><html:textarea styleClass="mandatoryTArea"  name="degreeListUpdateView" cols="15" rows="1" property="edu_field" styleId="Field"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenPField,500)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenPField" size="4"  value="500">
                    </td>
                   
                   <td>
                   <html:text name="degreeListUpdateView" styleClass="smallmandatoryTbox" size="10" property="edu_year" maxlength="4" styleId="Year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);checkMaxlenReg(this,4,4)" />
                   </td>
                    <td>
                                <a style='display:block;' href='#' class='deleteRemarksRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
              </tr>
                </logic:iterate>
                </logic:present>
                </table>
                <div class="whole pad-top" align="right">
                    <input type="button" onclick="addRowToTable()" value="Add More">
                </div>
                
                </fieldset>
                </section>
              
              
                
              <section class="whole">
                <fieldset>
                        <legend>Research Training Experience: </legend>
                 <table  id="tblresearch" class="footable blue">
                   <thead>
                <tr>
                  <th data-class="expand">Duration(in Years)</th>
                  <th data-hide="phone">Institution <br>(Max 500 Chars)</th>
                  <th data-hide="phone">Particulars of Work Done <br>(Max 800 Chars)</th>
                  <th data-hide="phone">Delete</th>
                </tr>
                
                </thead>
                <logic:notPresent name="updatedButtonName">
                <logic:notPresent  name="research">
                 <tr>
                  <td >
                   <html:text  size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,2,1)"/> 
                  </td>
                 
                   <td><html:textarea  cols="15" rows="1" property="work_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenWork,500)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   
                   
                   
                   <td><html:textarea  cols="15" rows="1" property="work_done" styleId="Work Detail"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenDone,800)"   tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                     <td>
                                <a style='display:block;' href='#' class='deleteResearchRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                   
                  </tr>
                </logic:notPresent>
                </logic:notPresent>
                
                
                
                <logic:present name="research">
                <logic:iterate id="reserchList" name="research">
                <tr>
                  <td>
                   <html:text  name="reserchList" size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,2,1)"/> 
                  </td>
                 
                   
                    <td><html:textarea  name="reserchList" cols="15" rows="1" property="work_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenWork,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   
                   
                   <td><html:textarea  name="reserchList" cols="15" rows="1" property="work_done" styleId="Work Detail" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenDone,800)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                   <td>
                                <a style='display:block;' href='#' class='deleteResearchRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                  <logic:present name="researchUpdate">
                <logic:iterate id="reserchListUpdate" name="researchUpdate">
                <tr>
                  <td>
                   <html:text  name="reserchListUpdate" size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,2,1)"/> 
                  </td>
                 
                   <!--td><html:text   name="reserchListUpdate" size="10" property="work_inst" maxlength="50" styleId="work_inst" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);" /> 
                   </td-->
                   
                   
                   <td><html:textarea  name="reserchListUpdate" cols="15" rows="1" property="work_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenWork,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                   <td><html:textarea  name="reserchListUpdate" cols="15" rows="1" property="work_done" styleId="Work Detail"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenDone,800)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type=hidden name="remLenDone" size="4"  value="800">
                    </td>
                   <td>
                                <a style='display:block;' href='#' class='deleteResearchRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                   <logic:present name="researchUpdateView">
                <logic:iterate id="reserchListUpdateView" name="researchUpdateView">
                <tr>
                  <td>
                   <html:text  name="reserchListUpdateView" size="10" property="work_dur" maxlength="2" styleId="Duration" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);checkMaxlenReg(this,2,1)"/> 
                  </td>
                 
                   <!--td><html:text   name="reserchListUpdateView" size="10" property="work_inst" maxlength="50" styleId="work_inst" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);" /> 
                   </td-->
                   
                   
                   <td><html:textarea  name="reserchListUpdateView" cols="15" rows="1" property="work_inst" styleId="Institution"  onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenWork,500)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenWork" size="4"  value="500">
                    </td>
                    
                   <td><html:textarea  name="reserchListUpdateView" cols="15" rows="1" property="work_done" styleId="Work Detail"   onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenDone,800)" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenDone" size="4"  value="800">
                    </td>
                   <td>
                                <a style='display:block;' href='#' class='deleteResearchRow'><img src='/ICMR/app_srv/icmr/gl/images/minus.gif'/></a>
                                </td>
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  </table>
                  <div class="whole pad-top" align="right">
                        <input type="button" onclick="addRowToTableResearch()" value="Add More">
                  </div>
                </fieldset>
             </section>
              
                <section class="whole pad-top">
                 <fieldset>
                     <div class="whole">
                         <div class="one fourth">
                         <label>Research Specialization(Major Scientific fields of interest)<span class="alerttext">*</span></label>
                         </div>
                          <div class="three fourth">
                                <html:textarea  cols="15" rows="1" styleClass="mandatoryTArea" property="strResearch" styleId="ResearchSpecialization" onblur="isAlphaNumericWithApos(this);textCounter(this,this.form.remLenResearch,500)"  tabindex="<%=Integer.toString(++iTabIndex)%>" />
                                <input readonly="readonly" type="hidden" name="remLenResearch" size="4"  value="500"> Max Length(500 Characters)
                          </div>
                    </div>
                    
                    <logic:notPresent  name="updatedButtonName">
                
                   <div class="whole pad-top">
                         <div class="one fourth">
                                    <label>Private Key Password <span class="alerttext">*</span></label>
                         </div>
                          <div class="three fourth">
                    <html:password styleClass="generalTbox" property="strDocpass" styleId="strDocpass" maxlength="50" onblur="passwordcheck(this,strDocConPass,'P');checkDuplicacy('D');checkMaxlenReg(this,50,6)"  size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>" />  
                </div>
                    </div>
                
                 <div class="whole pad-top">
                         <div class="one fourth">
                                 <label>Confirm  Private Key Password <span class="alerttext">*</span></label>
                           </div>
                          <div class="three fourth">
                               <html:password styleClass="generalTbox" styleId="strDocConfirmPass" property="strDocConPass"  maxlength="50" onblur="passwordcheck(strDocpass,this,'C');checkMaxlenReg(this,50,6)"   size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                          </div>
                    </div>                
                </logic:notPresent>
                
                <logic:notPresent  name="updatedButtonName">
               <div class="whole pad-top">
                         <div class="one fourth">
                         <label>Resume <span class="alerttext">*</span>
                   <span class="alerttext">(Only 1 page PDF)</span></label>
                  </div>
                          <div class="three fourth">
                <html:file  property="resumeFile" styleId="resumeFile" onchange="check_file_Resume()" tabindex="<%=Integer.toString(++iTabIndex)%>" ></html:file> 
                <span class="alerttext">(Max size 1MB)</span> 
                <!--    <input type ="file" id="resumeFile" name="resumeFile" onchange="check_file_Resume()" value="" /> -->
               </div>
                    </div>                 
                </logic:notPresent> 
                
                <logic:present name="updatedButtonName">
            <div class="whole pad-top">
                         <div class="one fourth"><label>Resume</label></div>
                          <div class="three fourth"><label class="filelinks" id="<%=sessUserID%>" onclick="callfile(this);" >View Uploaded Resume</label>
                         </div>
            </div>
            
            <div class="whole pad-top">
                         <div class="one fourth"><label>
                Resume 
                <span class="alerttext">(Only 1 Page PDF)</span></label>
            </div>
                          <div class="three fourth">
              <html:file property="resumeFile" styleId="resumeFile" onchange="check_file_Resume()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file> 
              <span class="alerttext">(Max size 1MB)</span> 
                <input type="hidden" value="yes" id='res'/>
             </div>
             </div>
          </logic:present>
          
         <div class="whole pad-top">
                         <div class="one fourth"></div>
                  <div class="three fourth">
                  <logic:present name="updatedButtonName">
                  <input class="generalButton" type="BUTTON" name="mod" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="check_mandatory(this);" value="Modify"></button>
                  </logic:present>
                  <logic:notPresent name="updatedButtonName">
                  
                    <input class="generalButton" type="BUTTON" name="sub" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="check_mandatory(this);" value="Submit"></button>
                    
                    </logic:notPresent>
                    
                    <logic:notPresent name="updatedButtonName">
                      <input class="generalButton" type="BUTTON" name="Reset" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="Cancel(this);" value="Reset"></button>
                     </logic:notPresent>
                    
                    <logic:present name="updatedButtonName">
                    <input class="generalButton" type="BUTTON" name="Reset" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="Cancel(this);" value="Reset" disabled="true"></button>
                     </logic:present>
                 </div>
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
        <div class="pad-top double">
        <jsp:include page="/app_srv/icmr/gl/globals/responsive-footer.jsp"></jsp:include>   
        </div>
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
  
  
    </body>
</html>