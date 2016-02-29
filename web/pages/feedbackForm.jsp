<%-- 
    Document   : feedbackForm.jsp
    Created on : 25 Jun, 2015, 10:56:24 AM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="display" uri="http://displaytag.sf.net" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/resources/displaytag.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
        <title>Feedback</title>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".various").fancybox({
                    maxWidth: 1300,
                    maxHeight: 1200,
                    width: 1300,
                    height: 1200,
                    autoSize: false,
                    closeClick: true,
                    openEffect: 'none',
                    closeEffect: 'none'
                });
            });
        </script>
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
    <body onload="Captcha();">
        <div id="main" > 
            <s:form action="submitFeedbackAction.action" id="feedbackSubmit" enctype="multipart/form-data" theme="simple" onsubmit="return ValidCaptcha();">
                <!-- <s:div cssClass="form_div" align="center"> -->
                    <fieldset id="form_fieldset" style="width: 60%">
                        <s:if test="hasActionMessages()" >
                            <s:div cssClass="welcome">
                                <s:actionmessage theme="simple"/>
                            </s:div>
                        </s:if>
                        <s:if test="hasActionErrors()" >
                            <s:div cssClass="errors" align="center">
                                <s:actionerror theme="simple"/>
                            </s:div>
                        </s:if>
                        <table width="99%"  align="center">
                            <caption style="color: rgb(140,60,15);font-weight: bold; font-size: 18px; padding-top: 5px; padding-bottom: 10px;">Write Your Feedback</caption>
                            <tbody id="body" style="font-weight: bold;font-family:futura; font-size: 14px;">
                                <tr>
                                    <td align="left">
                                        Name:<font color="red">*</font>
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="visitor_Name" id="visitor_Name" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Email:<font color="red">*</font>
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="visitor_Email" id="visitor_Email" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Organization:<font color="red">*</font>
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="visitor_Organisation" id="visitor_Organisation" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Address: 
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="visitor_Address" id="visitor_Address" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        Feedback:<font color="red">*</font>
                                    </td>
                                    <td align="left">
                                        <s:textarea  name="visitor_Comment" id="visitor_Comment"  cols="40" rows="10" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="font-weight: bold; font-family: futura;">
                                        CAPTCHA Code:
                                    </td>
                                    <td>
                                        <input type="text" id="mainCaptcha" readonly="true" autocomplete="off" style="border-width:0px; color:rgb(255,235,181);font-size: 16px; font-weight: bold; font-family: futura;font-style: italic; background-color: rgb(72,76,85); text-align: center; width:125px; height:30px"/>
                                        <input type="button" id="refresh" value="Refresh" onclick="Captcha();"/>  
                                        <br/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="font-weight: bold; font-family: futura;">
                                        Type the CAPTCHA Code:
                                    </td>
                                    <td>
                                        <input type="text" id="txtInput" autocomplete="off" style="text-align: center;font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="50"/>                                                                    
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot style="text-align: center">
                                <tr>
                                    <td colspan="2" style="padding-top: 5px; padding-bottom: 5px;">
                                        <s:submit value="Submit"/>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </fieldset>
                    <br><br>
                    <!-- </s:div> -->
            </s:form> 
        </div>
    </body>
</body>
</html>
