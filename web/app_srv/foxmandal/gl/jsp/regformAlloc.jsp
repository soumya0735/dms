<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
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
      Calendar cal = Calendar.getInstance(); 
      int year = cal.get(Calendar.YEAR); 
       int iTabIndex=0;
       String sessUserType="";
       String sessUserID="";
       String event="";
       String user_type="";
       ArrayList list_values=new ArrayList(); 
                 if(request.getSession().getAttribute("listData")!=null)
                  {
                   
                   list_values= (ArrayList)request.getSession().getAttribute("listData");
                   user_type=list_values.get(3).toString();
                   System.out.println("user_type is"+user_type);
      
                 }
      
      
    if(session.getAttribute("userInfo")!=null)
    {
    System.out.println("-----------");
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
    <script src="/ICMR/app_srv/icmr/gl/jssrc/userReg.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    
    
    
     <% 
     String msg = (String)request.getSession().getAttribute("msg");
    if("error".equals(msg)){
    event="Y";
    %>
		<script>alert("Please Upload Resume Of One Page Only");
    window.location.href="/ICMR/registrationAction.do?hmode=viewList";
   
    </script>
		 	<%}%>
   
     
    
      
 <% 
    String msgEn = (String)request.getSession().getAttribute("msgEn");
    System.out.println("value of msg is"+msgEn);

    if("error".equals(msgEn)){%>
    event="Y";
		<script>alert("Please Check File is Encryptedsssssss");
    window.location.href="/ICMR/registrationAction.do?hmode=viewList";
   
    </script>
		 	<%}%>





  </head>

 <body topmargin="0" onload="loadStateUser('<%=event%>');">

  <div align="center">
fgjkhkl
<table class="form">

  <tr>
 	<td height="428" valign="top" >
   <noscript>Sorry, your browser does not support JavaScript!</noscript>
  <html:form enctype="multipart/form-data" action="/registrationAction.do"  >
   <center>
     
            <table class="form" id="space">
       
       
              <tr>
                <th colspan="2">
               
                Registration form
                </th>
              </tr>
           
             
               
                <tr>
                  <td >
                 &nbsp;  User Id
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                  <html:hidden property="operation"/>
                 <html:text styleClass="mandatoryTbox"  property="user_id" maxlength="25" styleId="user_id" onblur="userId(this);loadStateUser('U')" tabindex="<%=Integer.toString(++iTabIndex)%>"/>
                 </td>
                </tr>
                
                
                <tr>
                  <td >
                    &nbsp; Password
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                 
                    <html:password styleClass="mandatoryTbox"  property="password" maxlength="20" styleId="password" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(this,confirmpassword,'P');"/>
                   
                  </td>
                </tr>
                
                <tr>
                  <td>
                    &nbsp; Confirm Password
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                   
                    <html:password styleClass="mandatoryTbox" property="confirmpassword" maxlength="20" styleId="confirmpassword" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="passwordcheck(this,password,'C');"/>
                     
                  </td>
                </tr>
                 <tr>
                 <td style="display:none">
                 <html:radio property="utype"  value="E"   tabindex="<%=Integer.toString(++iTabIndex)%>" ></html:radio>
                 <html:radio property="utype"  value="E"   tabindex="<%=Integer.toString(++iTabIndex)%>" ></html:radio>
                 </td>
                <td>
                 <html:hidden  property="usrtype" value="<%=sessUserType%>"/>
                
                 </td>
                 </tr>
                <tr>
                  <td>
                    &nbsp; First Name
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="fullname" maxlength="20" tabindex="<%=Integer.toString(++iTabIndex)%>" styleId="fullname" onblur="isAlphabet(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Middle Name
                  </td>
                  <td>
                     <html:text styleClass="generalTbox"  property="mname" maxlength="20" styleId="mname" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabet(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Last Name
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="lname" maxlength="20" styleId="lname" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphabet(this);"/>
                  </td>
                </tr>
                 <tr>
                  <td>
                    User Image
                   <span class="alerttext">(Only JPG)</span>
                  </td>
                  <td>
                    <html:file  property="imageFile"    size="30" onchange="check_file()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file>
                  </td>
                </tr>
                 <tr>
                  <td>
                    &nbsp; Designation
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="desig" maxlength="40" styleId="desig" size="30" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Department
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="department" maxlength="40"  styleId="department" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
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
                              Calendar.setup({
                              inputField     :    "strDob",	// id of the input field
                              ifFormat       :    "%d-%m-%Y",     	// format of the input field data
                              align          :    "Bl",            	// alignment (defaults to "Bl")
                             singleClick    :    true
                                            });
   
                </script>
                  
                </tr>
                 <tr>
                  <td>
                    &nbsp; Organisation
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="org"  maxlength="90" styleId="org" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isAlphaNumeric(this);"/>
                    
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    &nbsp; Correspondence Address 
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:textarea styleClass="generalTarea" cols="25" rows="2" property="temp_add" styleId="temp_add"  onblur="isAlphaNumeric(this);" onkeypress="textCounter(this,this.form.remLenP,500);" tabindex="<%=Integer.toString(++iTabIndex)%>" />
                    <input readonly type=hidden name=remLenP size=4 maxlength=3 value="800"> 
                    <!--span class="smalltext"><b> Left</b></span-->
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; State
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                  
                  <html:select styleClass="generalCombo" styleId="mediumCombo" property="state"  onchange="loadStateUser('S')" tabindex="<%=Integer.toString(++iTabIndex)%>">
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
                </tr>
                  <tr>
                  <td>
                    &nbsp; Office Telephone Number 
                     <span class="alerttext">*</span>
                  </td>
                  <td>
                    STD Code:<html:text styleClass="smallmandatoryTbox" property="orgSTD"  maxlength="5"   size="5" tabindex="<%=Integer.toString(++iTabIndex)%>"  onblur="isNumber(this);"/>&nbsp;No.
                     <html:text styleClass="smallmandatoryTbox" property="orgContactNo"  maxlength="10"   size="10" tabindex="<%=Integer.toString(++iTabIndex)%>"  onblur="isNumber(this);"/>&nbsp;Ext.
                      <html:text styleClass="smallmandatoryTbox" property="orgExt"  maxlength="4"   size="4"  tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/>&nbsp;(Optional)
                  </td>
                </tr>
               <tr>
                  <td>
                    &nbsp; Mobile No
                   
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="mob_no" maxlength="10" styleId="mob_no" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="mobile(this);"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp; Fax No.
                  </td>
                  <td>
                    <html:text styleClass="generalTbox" property="fax_no" maxlength="20" styleId="fax_no" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isNumber(this);"/>
                  </td>
                </tr>
               
                 <tr>
                  <td>
                    &nbsp; Email Id
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="mandatoryTbox" property="emailid" maxlength="50" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="isEmail(this);"/>
                  </td>
                </tr>
               
               <tr>
                  <td>
                    &nbsp; Last Degree Type
                    <span class="alerttext">*</span>
                  </td>
                  <td>
                    <html:text styleClass="smallmandatoryTbox" property="deg_type"  maxlength="10"   size="10" tabindex="<%=Integer.toString(++iTabIndex)%>"  onblur="degreeType(this);"/>
                  </td>
                </tr>
               
               
               
               
               
                <tr>
                  <td>
                    &nbsp; Last Degree Details
                     <span class="alerttext">*</span>
                  </td>
                  <td>
                    
                   year &nbsp; 
                  <html:select styleClass="generalCombo" styleId="smallCombo" property="deg_year" onblur="chkYear(this);" tabindex="<%=Integer.toString(++iTabIndex)%>">
                  <html:option value="">---Select---</html:option>
                  <%for(int i=1950; i<=year;i++){%>
                  <html:option value="<%=Integer.toString(i)%>"><%=Integer.toString(i)%></html:option> 
                  <%}%>
                  </html:select>
                   &nbsp; Institute &nbsp;
                     <html:text styleClass="smallmandatoryTbox" property="inst"  maxlength="50"   size="10" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="degreeType(this);" />
                     University &nbsp;<html:text styleClass="smallmandatoryTbox" property="university"  maxlength="50"   size="5" tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="degreeType(this);" />
                     
                    Stream<html:text styleClass="smallmandatoryTbox" property="stream"  maxlength="50"   size="10"  tabindex="<%=Integer.toString(++iTabIndex)%>" onblur="degreeType(this);" />
                  </td>
                </tr>
                 <logic:notPresent  name="updatedButtonName">
                <tr>
                  <td height="28">
                    Resume <span class="alerttext">*</span>
                   <span class="alerttext">(Only PDF)</span> 
                  </td>
                  <td>
                    <html:file  property="resumeFile"   tabindex="<%=Integer.toString(++iTabIndex)%>" onchange="check_file()" ></html:file>
                  </td>
                </tr>
                </logic:notPresent> 
                  <logic:present name="updatedButtonName">
                   <tr>
                  <td height="28">
                    Resume 
                   <span class="alerttext">(Only PDF)</span> 
                  </td>
                  <td>
                    <html:file  property="resumeFile" onchange="check_file()" tabindex="<%=Integer.toString(++iTabIndex)%>"></html:file>
                    <input type="hidden" value="yes" id='res'/>
                  </td>
                 
                </tr>
                  </logic:present>
                
                <tr>
                  <td align="center">&nbsp;</td>
                  <td align="center">
                  
                  
                    <input class="generalButton" type="BUTTON" name="sub" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="check_mandatory(this);" value="Submit"></button>
                    <input class="generalButton" type="BUTTON" name="Reset" style="float: left" tabindex="<%=Integer.toString(++iTabIndex)%>" onclick="Cancel(this);" value="Reset"></button>
                    
                    
                    
                  </td>
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
            
            
         <%if(user_type.equals("E")){%><script>
         
        
         </script><%}%>
         
         <div id="thematicAreaID" style="position:absolute; top:270px; left :820px; align : right; height:10px; width: 280; ">
                        <table width="100%" align="center" border="0"  bgcolor="#7dcee7"  >
                                    <tr> 
                                     <td colspan="3" class="heading" bgcolor="white" >
                                        <font size="1.5"> <b> &nbsp;Thematic Area</b></font>
                                      </td>
                                    </tr>
                                   <% 
                                        String strQuery="";
                                        int iSize=0;
                                        List listResult = new ArrayList();
                                        strQuery = "SELECT NUM_THEMATIC_AREA_ID, INITCAP(NVL(STR_THEMATIC_AREA_NAME,' ')) FROM TDC_THEMATIC_AREA_MASTER";
                                        listResult = _dbq.fetchData(strQuery);
                                        iSize = listResult.size();
                                   
                                    if(iSize>0)
                                    {
                                    for(int i=0;i<iSize;i=i+2)
                                    {
                                    %>
                                    <tr> 
                                    
                                  <td width="1%" class="heading" align="right">
                                      <input type="CHECKBOX" id="thematicArea1" name="thematicArea" value="<%=listResult.get(i).toString()%>" >
                                      <input type="hidden" id="thematicId" name="thematicId" value="<%=listResult.get(i).toString()%>">
                                  </td>
                                      <td width="10%" class="heading" align="left">
                                          <font face="verdana" style="font-size: 8pt">&nbsp; <%= listResult.get(i+1).toString()%></font>
                                        </td>
                                    </td>
                                 <%}
                                }%>
                                </table>
                   

</div>


    </center>
    
     </html:form>
     </td>
     </tr>
     </table>

  </div>
  </body>

</html:html>