<%-- 
    Document   : ShowRequisitionForm
    Created on : Nov 3, 2015, 12:52:11 PM
    Author     : CDAC-49
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-dojo-tags" prefix="d"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/action-message.css"/>
        <sj:head/>
        <title>Requisition for book</title>
        <script type="text/javascript">
            function Captcha(){
                var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
                var i;
                for (i=0;i<6;i++){
                    var a = alpha[Math.floor(Math.random() * alpha.length)];
                    var b = alpha[Math.floor(Math.random() * alpha.length)];
                    var c = alpha[Math.floor(Math.random() * alpha.length)];
                    var d = alpha[Math.floor(Math.random() * alpha.length)];
                    var e = alpha[Math.floor(Math.random() * alpha.length)];
                    var f = alpha[Math.floor(Math.random() * alpha.length)];
                    var g = alpha[Math.floor(Math.random() * alpha.length)];
                }
                var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
                document.getElementById("mainCaptcha").value = code
            }
            function ValidCaptcha(){
                var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
                var string2 = removeSpaces(document.getElementById('txtInput').value);
                if (string1 == string2){
                    //return true;
                }
                else{        
                    alert('Captcha Mismatch!');
                    return false;
                }
            }
            function removeSpaces(string){
                return string.split(' ').join('');
            }
        </script>

    </head>
    <body onload="Captcha();" onreset="Captcha();">
        <h1 align="center">Requisition Form</h1>
        <s:form action="submitRequisitionForm" id="requisitionFormSubmit" enctype="multipart/form-data" theme="simple" onsubmit="return ValidCaptcha();" onreset="Captcha();">
            <s:if test="hasActionMessages()">
                <br/>
                <div class="welcome" width="69%" >
                    <s:actionmessage theme="simple"/>
                </div>
            </s:if>
            <s:if test="hasActionErrors()">
                <br/>
                <div class="errors" width="69%" >
                    <s:actionerror theme="simple"/>
                </div>
            </s:if>
            <br/>
            <table width="50%"  align="center">
                <tr>
                    <td><h12>Call No. </h12><font style="color: red">*</font>
                <td>
                    <s:textfield  name="requisitionForm.callNo" id="applicantName" size="41" autocomplete="off"/>
                </td>
            </tr>
            <tr>
                <td><h12>Date of issue </h12><font style="color: red">*</font>
            <td>
                <sj:datepicker id="issueDate" name="requisitionForm.issueDate" displayFormat="yy-mm-dd" maxDate="%{maxDate}" readonly="true"/>
            </td>
        </tr>
        <tr>
            <td><h12>Author Name </h12><font style="color: red">*</font>
        <td>
            <s:textfield  name="requisitionForm.authorName" id="authorName" size="41" autocomplete="off"/>
        </td>
    </tr>
    <tr>
        <td><h12>Title </h12><font style="color: red">*</font>
    <td>
        <s:textfield  name="requisitionForm.title" id="title" size="41" autocomplete="off"/>
    </td>
</tr>
<tr>
    <td><h12>Issuer Name </h12><font style="color: red">*</font>
<td>
    <s:textfield  name="requisitionForm.issuerName" id="issuerName" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td><h12>Department </h12><font style="color: red">*</font>
<td>
    <s:textfield  name="requisitionForm.issuerDepartment" id="issuerDepartment" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td><h12>Issued By </h12><font style="color: red">*</font>
<td>
    <s:textfield  name="requisitionForm.issuedBy" id="issuedBy" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
        <h12> Capcha Code</h12>
    </td>
    <td>
        <input type="text" id="mainCaptcha" readonly="true" autocomplete="off" style="border-width:0px; color:rgb(255,235,181);font-size: 16px; font-weight: bold; font-family: futura;font-style: italic; background-color: rgb(72,76,85); text-align: center; width:125px; height:30px" value="v X y P Q n p"/>
        <input type="button" id="refresh" value="Refresh" onclick="Captcha();"/>  
        <br/><br/>
    </td>
</tr>
<tr>
    <td>
       <h12>Type the Capcha Code:</h12>
    </td>
    <td>
        <input type="text" id="txtInput" autocomplete="off" style="text-align: center;font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="50"/>                                                                    
    </td>
</tr>
<tr>
    <td colspan="2" style="padding-top: 5px; padding-bottom: 5px;" align="center">
        <s:submit value="Submit"/>
        <input type="reset" id="resetBtn" value="Reset" onclick="Captcha();" onreset="Captcha();"/>  
    </td>
</tr>
</table>
</s:form>
</body>
</html>
