<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation,in.cdacnoida.icmr.gl.adaptor.DataEncoder" %>
<%@ page import=" java.io.File" %>
<jsp:useBean id="_dbq" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" scope="session"/>
<html:html>
  <head>
  
   
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">

<%

response.setHeader("expires","0");
response.setHeader("expires","now");
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",-1);
%>

 
<%@ page import="java.util.*" %>
    <%  
    
    String strCombpQuery="select NUM_DEGREE_ID,STR_DEGREE_NAME from TDC_DEGREE_MASTER where STR_STATUS='1' and NUM_DEGREE_ID!=27 order by  STR_DEGREE_NAME";
    ArrayList list_data=_dbq.fetchData(strCombpQuery);
    String val="";
    
     String strCombpQuery1="select NUM_SALUTATION_ID,STR_SALUTATION from   TDC_SALUTATIONS_MST  order by  STR_SALUTATION";
    ArrayList list_data1=_dbq.fetchData(strCombpQuery1);
    
    String strNames1="1";
    String strValues1="1";
    for(int i=0;i<list_data1.size();i++)
    {
    strNames1=strNames1+list_data1.get(i).toString()+"#";
    strValues1=strValues1+list_data1.get(++i).toString()+"#";
    }
    
    
    
    
    
    
      Calendar cal = Calendar.getInstance(); 
      int year = cal.get(Calendar.YEAR); 
       int iTabIndex=0;
       String resumepath="";
       
       String sessUserType="";
       String sessUserID="";
       String event="";
       String user_type="";
           String tharea="";
      /* ArrayList list_values=new ArrayList(); 
                 if(request.getSession().getAttribute("listData")!=null)
                  {
                   
                   list_values= (ArrayList)request.getSession().getAttribute("listData");
                   user_type=list_values.get(3).toString();
                   System.out.println("user_type is"+user_type);
      
                 }*/
      
      
    if(session.getAttribute("userInfo")!=null)
    {
    // sessUserType="A";
     UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");
     sessUserType=_userinfo.getStrUserType();
     sessUserID=_userinfo.getStrUserID();
     resumepath=File.separator+"TDCPortal"+File.separator+"app_srv"+File.separator+"tdc"+File.separator+"gl"+File.separator+"files"+File.separator+"resume"+File.separator;
     resumepath = resumepath+""+sessUserID+"_R.pdf";
 
     tharea=request.getAttribute("strStatusTxt").toString();
  
     
     
     
     //resumepath="/ICMR/app_srv/icmr/gl/files/resume/"+sessUserID+"_R.pdf";
    }
    else
    {
     sessUserType="U";
    
    }
  
 System.out.println("user type...."+sessUserType);   
 
 
 
   String uid=request.getParameter("uid");
     DataEncoder daEncoder = new DataEncoder();
                   
      uid=daEncoder.decode(daEncoder.decode(uid));
       System.out.println("uid=="+uid);


       
    %>
    
   
    
    <title>Electronic Project Proposal Submission System</title>
    
    <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">
     <link href="/ICMR/app_srv/icmr/gl/theme/calendar-win2k-cold-1.css" rel="stylesheet" type="text/css">
    <script src="/ICMR/app_srv/icmr/gl/jssrc/datepickupNew.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar.js"></script>
  
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-setup.js"></script>
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jssrc/calendar-en.js"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validNumber.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="/ICMR/app_srv/icmr/gl/jssrc/regDH.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script type="text/javascript">
    
      /*  function functionGetMajorArea()
        {       
         
            var broadAreaValue=document.forms[0].th_area.value;
            var flag;
             if(document.forms[0].operation.value!=null)
               {
               flag=document.forms[0].operation.value; 
               }
               else
                {
               flag="add";
                }
             var str = "/ICMR/app_srv/icmr/gl/jsp/majorAreaPO.jsp?broadAreaValue="+broadAreaValue+ "&flag=" + flag;
            if(broadAreaValue=="") 
            {
                alert("Please Select Broad Area.");
                return false;
                
            }
            else
            window.open(str,"MajorAreas","scrollbars=yes,resizable=no,width=500,height=400,left=200,top=50");

        }*/
    
    
    </script>
   




  </head>

 <body topmargin="0">
 
 
  
  <div align="center">


 
 <%if(sessUserType=="U")
           {%>
 <table border="0" class="general" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
 <tr>
		<td colspan="4"> <%@include file="/app_srv/icmr/gl/html/header.htm"%></td>
	</tr>
	<tr>
		<td colspan="4"><%@include file="/app_srv/icmr/gl/html/menu_new.htm"%></td>
	</tr>
	<tr>
		<td width="26%" rowspan="3" valign="top" align="center"><br><jsp:include  page="lmenu.jsp"/></td>
		<td width="2%" rowspan="3" valign="top">
		<p align="center">
		<img border="0" src="/ICMR/app_srv/icmr/gl/images/ver_line.gif" width="2" height="482"></td>
		<td width="72%" colspan="2">
		</td>
	</tr>

<%}else{%>

<table class="form">
<%}%>  
  <tr>
 	<td height="428" valign="top" >
   <noscript>Sorry, your browser does not support JavaScript!</noscript>
  <html:form  enctype="multipart/form-data" action="/invDHAction.do"  >
   <center>
          
<input type="hidden" name="strNames" value="<%=strNames1%>" />
<input type="hidden" name="strValues" value="<%=strValues1%>" />
<input type="hidden" name="tharea" value="<%=tharea%>" />
     <html:hidden property="uid" value="<%=uid%>"/>     
           
            <table class="form" id="space">
       
       
          <logic:notPresent  name="updatedButtonName">
              <tr>
              
              
              
                <th colspan="2">
               
               Division  Head  Registration
                </th>
                
                
              </tr>
              </logic:notPresent>
             <logic:present name="updatedButtonName">
              <tr>
                <th colspan="2">
                 Update Profile
                </th>
              </tr>
             </logic:present>
       
               
                <tr>
                  <td >
                 &nbsp;  User Id
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                  <html:hidden property="operation"/>
               <logic:present name="updatedButtonName">
                  
                  <html:text styleClass="mandatoryTbox"  property="user_id" maxlength="25" styleId="User Id"  disabled="true"/>
                  </logic:present>
                  
                 <logic:notPresent  name="updatedButtonName">
                     <html:text styleClass="mandatoryTbox"  property="user_id" maxlength="25" styleId="User Id" onblur="userId(this);loadStateUserDIS('U'),checkLength(this, 6, 25),checkZero(this)" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                  </logic:notPresent>
                  </td>
                </tr>
                
                
                <tr>
                  <td >
                    &nbsp; Password
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <logic:present name="updatedButtonName">
                          <html:password styleClass="mandatoryTbox"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                  </logic:present>
                  <logic:notPresent  name="updatedButtonName">
                    <html:password styleClass="mandatoryTbox"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(this,confirmpassword,'P'),checkLength(this, 6, 20);checkDuplicacy('P')"/>
                    </logic:notPresent>
                  </td>
                </tr>
                
                <tr>
                  <td>
                    &nbsp; Confirm Password
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <logic:present name="updatedButtonName">
                   <html:password styleClass="mandatoryTbox"  property="confirmpassword" maxlength="50" styleId="confirmpassword"  tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true"/>
                  </logic:present>
                  <logic:notPresent  name="updatedButtonName">
                    <html:password styleClass="mandatoryTbox" property="confirmpassword" maxlength="20" styleId="confirmpassword" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(password,this,'C');"/>
                     </logic:notPresent>
                  </td>
                </tr>
                <!-- <tr>
                  <logic:notPresent  name="updatedButtonName">
                    <td>
                      &nbsp; User Type
                      <span class="alerttext">*</span> </td>
                   <td>
                  </logic:notPresent>  -->
                 <logic:present name="updatedButtonName">
                 <tr>
	<td>
	 &nbsp; Broad Area<span class="alerttext" >
	*</span></td>
	<td>
  
  
       <html:select property="th_area" styleClass="generalCombo" styleId="th_area"  tabindex="<%=Integer.toString(++iTabIndex)%>" disabled="true" >
                  <html:option value="">---Select---</html:option>
                  <html:options property="th_areaValue" labelProperty="th_areaText"/>
                  </html:select>
 
 <html:hidden property="logUserid" />

 
 <input type="HIDDEN" name="strStatusTxt" />
 
 

	</td>
	
	</tr>
                 </logic:present>
                 <logic:notPresent  name="updatedButtonName">
                <tr>
	<td>
	 &nbsp; Broad Area<span class="alerttext" >
	*</span></td>
	<td>
  
  
       <html:select property="th_area" styleClass="generalCombo" styleId="th_area"  tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="loadStateUserDIS('O')">
                  <html:option value="">---Select---</html:option>
                  <html:options property="th_areaValue" labelProperty="th_areaText"/>
                  </html:select>
 
 <html:hidden property="logUserid" />

 
 <input type="HIDDEN" name="strStatusTxt"/>
 
 

	</td>
	
	</tr>

  </logic:notPresent> 
 
        
       
        
        
        
        
        
              <tr><td> &nbsp; Select Your Title
               <span class="alerttext">*</span>
                  </td>
                
                  <td>   <html:select   styleClass="smallCombo" property="strTitle"  styleId="titleList" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      
                      <html:option value="">---Select---</html:option>
                     <html:options property="titleValue" labelProperty="titleText"/>
                     
                    </html:select></td>
                  </tr>
               
                <tr>
                  <td>
                    &nbsp; First Name
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="fullname" maxlength="20" tabindex="<%=Integer.toString(++iTabIndex)%>" styleId="First Name" onblur="isAlphabetWithApos(this),checkLength(this, 1, 20);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Middle Name
                  </td>
                  <td>
                     <html:text styleClass="generalTbox"  property="mname" maxlength="20" styleId="mname" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabetWithApos(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Last Name
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="lname" maxlength="20" styleId="Last Name" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabetWithApos(this),checkLength(this, 1, 20);"/>
                  </td>
                </tr>
                 <tr>
                  <td>
                    &nbsp; User Image
                   <span class="alerttext">(Only JPG)</span>
                  </td>
                  <td>
                    <html:file  property="imageFile"    size="30" onchange="check_file_Image()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file>
                  </td>
                </tr>
                 <tr>
                  <td>
                    &nbsp; Designation <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="desig" maxlength="50" styleId="Designation" size="30" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this),checkZero(this),checkLength(this, 2, 50);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Division/Unit
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="department" maxlength="40"  styleId="Division/Unit" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this),checkZero(this),checkLength(this, 2, 40);"/>
                  </td>
                </tr>
                 <tr>
                  <td>
                    &nbsp; DOB <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="strDob" styleId="strDob" maxlength="12" onblur="date_chk(this);"   size="5" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                  </td>
                  
                  <script>
                    Calendar.setup( {
                        inputField : "strDob", // id of the input field
                        ifFormat : "%d-%m-%Y", // format of the input field data
                        align : "Bl", // alignment (defaults to "Bl")
                        singleClick : true
                    });
                  </script>
                  
                </tr>
                <html:hidden property="org"  value="ICMR"   />
                <!-- <tr>
                  <td>
                    &nbsp; Name of the Institute
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="org"  maxlength="90" styleId="org" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
                    
                  </td>
                </tr> -->
                 <tr>
                  <td>
                    &nbsp;Office  Telephone Number 
                  </td>
                  <td>
                    STD Code:<html:text styleClass="smallTbox" property="orgSTD"   styleId="STD Code" maxlength="5"   size="5" tabindex="<%=Integer.toString(++iTabIndex)%>"  onblur="isNumber(this),checkZero(this),checkLength(this, 3, 5);"/>&nbsp;No.
                     <html:text styleClass="smallTbox" property="orgContactNo" styleId="Telephone Number" maxlength="10"   size="10" tabindex="<%=Integer.toString(++iTabIndex)%>"  onblur="isNumber(this),checkZero(this),checkLength(this, 6, 10);"/>&nbsp;Ext.
                      <html:text styleClass="smallTbox" property="orgExt"  maxlength="3"   size="3"  tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),checkLength(this, 0, 3);"/>&nbsp;(Optional)
                  </td>
                </tr>
               <!-- <tr>
                  <td>
                    &nbsp; Correspondence &nbsp;&nbsp;Address 
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:textarea styleClass="generalTarea" cols="25" rows="2" property="temp_add" styleId="temp_add"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800"> 
                
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; State
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                  
                  <html:select styleClass="generalCombo" styleId="mediumCombo" property="state"  onchange="loadStateUserDIS('S')" tabindex="<%=Integer.toString(++iTabIndex)%>">
                  <html:option value="">---Select---</html:option>
                  <html:options property="stateValue" labelProperty="stateText"/>
                  </html:select>
                
                  </td>
                  
                  
                </tr>
                <tr>
                  <td>
                    &nbsp; City
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:select styleClass="generalCombo" property="city"  styleId="strCity" tabindex="<%=Integer.toString(++iTabIndex)%>" >
                      
                      <html:option value="">---Select---</html:option>
                     <html:options property="cityValue" labelProperty="cityText"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Zip Code
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="zcode" maxlength="6" styleId="zcode" size="30"  tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/>
                  </td>
                </tr> -->
                 
               <tr>
                  <td>
                    &nbsp; Mobile No
                  
                   
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="mob_no" maxlength="10" styleId="Mobile No" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="mobile(this),checkZero(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Fax No.
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="fax_no" maxlength="20" styleId="Fax No" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),checkZero(this);"/>
                  </td>
                </tr>
               
                 <tr>
                  <td>
                    &nbsp; Email Id
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" readonly="true" property="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                  </td>
                </tr>
                
                
                
                
                
     <!--  <tr>    
   
                 <td colspan="2">
                    Educational Qualification: Degree Obtained(Begin with Bachlor's Degree)
                    <span class="alerttext">*</span>
                  </td>
       
    </tr>
       
       <tr>
        <td colspan="2">        
               <table  id="tblremarks" class="data">
                   <thead>
                   <tr>
                  <th >Degree <span class="alerttext">*</span></th>
                  <th>Institution <span class="alerttext">*</span></th>
                  <th >Field(s) <span class="alerttext">*</span></th>
                  <th >Year<span class="alerttext">*</span></th>
                  
                  <th>
                  <img src="/ICMR/app_srv/icmr/gl/images/plus.gif"  onclick="addRowToTable();"></img>
                  <img src="/ICMR/app_srv/icmr/gl/images/minus.gif" onclick="removeRowFromTable();"></img>
                  </th>
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
                
                
                
              
                   
                    <td><html:textarea  cols="15" rows="1" property="edu_inst" styleId="edu_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                    <td><html:textarea  cols="15" rows="1" property="edu_field" styleId="edu_field"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   
                   
                   
                   
                   <td>
                   <html:text  size="10" property="edu_year" maxlength="4" styleId="edu_year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);" />
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
                
                
                
                 
                
                   <td><html:textarea name="degreeList" cols="15" rows="1" property="edu_inst" styleId="edu_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                    
                    <td><html:textarea name="degreeList" cols="15" rows="1" property="edu_field" styleId="edu_field"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   
                   <td>
                   <html:text name="degreeList" size="10" property="edu_year" maxlength="4" styleId="edu_year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);" />
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
                
                    <td><html:textarea name="degreeListUpdate" cols="15" rows="1" property="edu_inst" styleId="edu_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                    <td><html:textarea name="degreeListUpdate" cols="15" rows="1" property="edu_field" styleId="edu_field"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                
                 
              
                   
                   <td>
                   <html:text name="degreeListUpdate" size="10" property="edu_year" maxlength="4" styleId="edu_year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);" />
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
                
                
                
                 
                
                   
                   <td><html:textarea name="degreeListUpdateView" cols="15" rows="1" property="edu_inst" styleId="edu_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                    <td><html:textarea name="degreeListUpdateView" cols="15" rows="1" property="edu_field" styleId="edu_field"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   
                   <td>
                   <html:text name="degreeListUpdateView" size="10" property="edu_year" maxlength="4" styleId="edu_year" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this),chkYear(this);" />
                   </td>
                  
                  
                  
                  
                  
                  
              </tr>
                
                
                
                
                
                </logic:iterate>
                </logic:present>
                
                
                
                
                
                
                
   
               </table>
    
       </td>
    </tr>
                
   
    <tr>    
   
                 <td colspan="2">
                   Research Training Experience: 
                    
                  </td>
       
    </tr>
   
    <tr>
        <td colspan="2">        
               <table  id="tblresearch" class="data">
                   <thead>
                   <tr>
                  <th >Duration(in months)</th>
                  <th>Institution </th>
                  <th >Particulars of Work Done </th>
                  
                  
                  <th>
                  <img src="/ICMR/app_srv/icmr/gl/images/plus.gif"  onclick="addRowToTableResearch();"></img>
                  <img src="/ICMR/app_srv/icmr/gl/images/minus.gif" onclick="removeRowFromTableResearch();"></img>
                  </th>
                </tr>
                
                </thead>
                <logic:notPresent name="updatedButtonName">
                <logic:notPresent  name="research">
                 <tr>
                  <td >
                   <html:text  size="10" property="work_dur" maxlength="3" styleId="work_dur" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/> 
                  </td>
                  
                   <td><html:textarea  cols="15" rows="1" property="work_inst" styleId="work_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   
                   
                   
                   <td><html:textarea  cols="15" rows="1" property="work_done" styleId="work_done"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,800);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800">
                    </td>
                   
                  </tr>
                </logic:notPresent>
                </logic:notPresent>
                
                
                
                <logic:present name="research">
                <logic:iterate id="reserchList" name="research">
                <tr>
                  <td>
                   <html:text  name="reserchList" size="10" property="work_dur" maxlength="3" styleId="work_dur" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/> 
                  </td>
                 
                 
                    <td><html:textarea  name="reserchList" cols="15" rows="1" property="work_inst" styleId="work_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   
                   
                   <td><html:textarea  name="reserchList" cols="15" rows="1" property="work_done" styleId="work_done"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,800);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800">
                    </td>
                   
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                  <logic:present name="researchUpdate">
                <logic:iterate id="reserchListUpdate" name="researchUpdate">
                <tr>
                  <td>
                   <html:text  name="reserchListUpdate" size="10" property="work_dur" maxlength="3" styleId="work_dur" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/> 
                  </td>
                 
                
                   
                   
                   <td><html:textarea  name="reserchListUpdate" cols="15" rows="1" property="work_inst" styleId="work_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                   <td><html:textarea  name="reserchListUpdate" cols="15" rows="1" property="work_done" styleId="work_done"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,800);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800">
                    </td>
                   
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                   <logic:present name="researchUpdateView">
                <logic:iterate id="reserchListUpdateView" name="researchUpdateView">
                <tr>
                  <td>
                   <html:text  name="reserchListUpdateView" size="10" property="work_dur" maxlength="3" styleId="work_dur" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/> 
                  </td>
                 
                 
                   
                   
                   <td><html:textarea  name="reserchListUpdateView" cols="15" rows="1" property="work_inst" styleId="work_inst"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="500">
                    </td>
                    
                   <td><html:textarea  name="reserchListUpdateView" cols="15" rows="1" property="work_done" styleId="work_done"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,800);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800">
                    </td>
                   
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  
                
                
                
                
   
               </table>
    
       </td>
    </tr>-->
   
   
   
        <tr>
                  <td>
                    Research Specialization(Major Scientific fields of interest):
                    <span class="alerttext">*</span>
                  </td>
                  <td><html:textarea  styleClass="mandatoryTArea" cols="15" rows="1" property="strResearch" styleId="strResearch"  onblur="isAlphaNumericWithApos(this),textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly="readonly" type="hidden" name="remLenP" size="4" maxlength="3" value="500">Max Length(500 Characters) 
                  
                  </td>
                </tr>
   
    
   
   
   
   
   
   
   
  
                  <logic:notPresent  name="updatedButtonName">
                
                    <tr>
                  <td height="28">
                   Private Key Password <span class="alerttext">*</span>
                   <span class="alerttext"></span> 
                  </td>
                  <td>
                    <html:password styleClass="smallmandatoryTbox" property="strDocpass" styleId="Private Key Password" maxlength="50"  onblur="passwordcheck(this,strDocConPass,'P');checkDuplicacy('D'),checkLength(this, 6, 50)"  size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>" />  </td>
                </tr>
                
                  <tr>
                  <td height="28">
                  Confirm  Private Key Password <span class="alerttext">*</span>
                   <span class="alerttext"></span> 
                  </td>
                  <td>
                    <html:password styleClass="smallmandatoryTbox" property="strDocConPass"  maxlength="50" onblur="passwordcheck(strDocpass,this,'C')"   size="10"   tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                  </td>
                </tr>
                
                </logic:notPresent>
                  
              
                
                  
      
                
                <tr>
                  <td align="center">&nbsp;</td>
                  <td align="center">
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
                    <input class="generalButton" type="BUTTON" name="Reset" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="Cancel(this);" value="Reset" disabled></button>
                     </logic:present>
                  </td><!--td>
                     <input class="generalButton" type="BUTTON" name="sub" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="check_mandatory(this);" value="Submit"></button>
                    </td-->
                </tr>
                
                
                <tr>
                                         
    
                  <%if(session.getAttribute("userInfo")==null)
                 {%><td colspan="2">
                    <p align="left">
                     <span class="alerttext">
                      <a href="/ICMR/index.do">Already Registered</a></span>
                    </p>
                  </td>
                  <%}%><input type="hidden"  name="hmode"/>
                </tr>
            
            </table>
            
            
        

    </center>
    
     </html:form>
     </td>
     </tr>
     </table>

  </div>
  
  
  
  
  
    <div id="login" style="display:none ; border-style: none; border-color: inherit; border-width: medium; position: absolute; z-index:0 ; left: 0px; top: 0px; width: 100%; height: 350%; filter:alpha(opacity:60); opacity:.60; -moz-opacity:.60;
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
  
  </div>
  
  </body>

</html:html>