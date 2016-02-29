<%-- 
    Document   : ApplicationFormat
    Created on : Nov 3, 2015, 12:36:49 PM
    Author     : CDAC-49
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application Format</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/action-message.css"/>

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
        <h1 align="center">Application Format</h1>
        <br/>
        <s:form action="submitApplicationForm" id="applicationFormatSubmit" enctype="multipart/form-data" theme="simple" onsubmit="return ValidCaptcha();">
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
            <table width="75%"  align="center">
                <tr>
                    <td>
                <h12>Type of Applicant</h12>
            </td>
            <td>
                <s:select name="applicationFormatForm.applicantType" 
                          id="applicantType" 
                          list="#{'sgs':'State Govt. Secretaries','sgo':'State Govt. official','sge':'State Govt. Employees','ogo':'Other Govt. Officials/Employees','rs':'Research Scholars','oths':'Others'}" 
                          headerKey="-1" 
                          headerValue="Select Type of Applicant"/>  
            </td>
        </tr>
        <tr>  
            <td>
               <h12>Upload recent photograph <br/>(File should be less than 64 KB and in jpeg or png format)</h12>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <canvas width="100" height="100" id="canvas" style = "border: 1px solid"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:file name="applicationFormatForm.inputFile" id="inputFile" accept=".pdf,.jpg,.jpeg,.png,.gif"/>
                            <script>
                                var input = document.getElementById('inputFile');
                                input.addEventListener('change', handleFiles);
                                var canvas = document.getElementById('canvas');
 
                                function handleFiles(e) {
                                    var ctx = canvas.getContext('2d');
                                    var img = new Image;
                                    img.onload = function() {
                                        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
                                    }
                                    img.src = URL.createObjectURL(e.target.files[0]);
                                }
                            </script>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
        <h12>Name of the Applicant </h12><font style="color: red">*</font>
    </td>
    <td>
        <s:textfield  name="applicationFormatForm.applicantName" id="applicantName" size="41" autocomplete="off"/>
    </td>
</tr>


<tr>
    <td>
<h12>Residence Address(Local address in India in case of the Foreign nationals) </h12><font style="color: red">*</font>
</td>
<td>
    <s:textarea  name="applicationFormatForm.addressResidence" id="addressResidence" cols="31" rows="2" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Office (with name of the Deptt. and Ph. No.) </h12><font style="color: red">*</font>
</td>
<td>
    <s:textarea  name="applicationFormatForm.addressOffice" id="addressOffice" cols="31" rows="2" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Institute/Organisation (for Research scholars with name of the Deptt. with Phone No.) </h12><font style="color: red">*</font>
</td>
<td>
    <s:textarea  name="applicationFormatForm.organisationName" id="organisationName" cols="31" rows="2" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Phone No.</h12>
</td>
<td>
    <s:textfield  name="applicationFormatForm.phoneNo" id="phoneNo" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Mobile No.</h12>
</td>
<td>
    <s:textfield  name="applicationFormatForm.mobileNo" id="mobileNo" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Email address </h12>
</td>
<td>
    <s:textfield  name="applicationFormatForm.emailAddress" id="emailAddress" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Nationality </h12><font style="color: red">*</font>
</td>
<td>
    <s:textfield  name="applicationFormatForm.nationality" id="nationality" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Profession/Designation</h12>
</td>
<td>
    <s:textfield  name="applicationFormatForm.designation" id="designation" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12>Subject of Research/Paper/Books etc.</h12>
</td>
<td>
    <s:textfield  name="applicationFormatForm.subject" id="subjects" size="41" autocomplete="off"/>
</td>
</tr>
<tr>
    <td colspan="2">
        <h3 align="center">Details of Recommendation</h3>
    </td>
</tr>
<tr>
    <td>
<h12 align="center">Name of the Office/University/Institute </h12><font style="color: red">*</font>
</td>
<td>
    <s:textarea  name="applicationFormatForm.officeName" id="officeName" cols="31" rows="2" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12 align="center">Recommended by ( Name and Designation )   </h12><font style="color: red">*</font>
</td>
<td>
    <s:textarea  name="applicationFormatForm.recommendedBy" id="recommendedBy" cols="31" rows="2" autocomplete="off"/>
</td>
</tr>
<tr>
    <td>
<h12> Capcha Code</h12>
</td>
<td>
    <input type="text" id="mainCaptcha" readonly="true" autocomplete="off" style="border-width:0px; color:rgb(255,235,181);font-size: 16px; font-weight: bold; font-family: futura;font-style: italic; background-color: rgb(72,76,85); text-align: center; width:125px; height:30px" value="a X x M K r v"/>
    <input type="button" id="refresh" value="Refresh" onclick="Captcha();"/>  
    <br/><br/>
</td>
</tr>
<tr>
    <td>
<h12>Type the Capcha Code</h12>
</td>
<td>
    <input type="text" id="txtInput" autocomplete="off" style="text-align: center;font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="50"/>                                                                    
</td>
</tr>
<tr>
    <td colspan="2" style="padding-top: 5px; padding-bottom: 5px;" align="center">
        <s:submit value="Submit"/>
        <input type="reset" id="resetBtn" value="Reset" onclick="Captcha();"/>  
    </td>
</tr>
</table>

</s:form>
</body>
</html>
