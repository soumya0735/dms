
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 	<html lang="en"> <!--<![endif]-->
    <%@taglib  prefix="s" uri="/struts-tags" %>
    <%@taglib  prefix="sj" uri="/struts-jquery-tags" %>
    <head>

        <!-- General Metas -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
        <title>Login Form</title>
        <meta name="description" content="">
        <meta name="author" content="">	
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 	
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/base.css">-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/layout.css">
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>  
        <script src="<%=request.getContextPath()%>/resources/app.js"></script>

        <style type="text/css">
            html, body {
                overflow: hidden;
            }
        </style> 

        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.js"></script> 
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.dataTables.js"></script>
        <!-- For Fancy Box-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />


        <script type="text/javascript">
            $(document).ready(function () {
                $('#loginForm').bind('submit', function() {
                    if(ValidCaptcha())
                    {
                        $.ajax({
                            type        : "POST",
                            cache       : false,
                            url         : "login",
                            beforeLoad: function() {
                                this.ajax.data = $('#postp').serialize();
                            },
                            data        : $(this).serializeArray(),
                            error: function(data) {
                                alert('Unable to Login. Check User Id or Password');
                                $.fancybox(data,{
                                    autoDimensions: true,
                                    autoSize: true,
                                    minWidth: 200,
                                    minHeight: 400,
                                    afterClose: function() {
                                        parent.location.reload(true);
                                    }
                                });
                            },
                            input: function(data) {
                                alert('Unable to Login. Check User Id or Password');
                                $.fancybox(data,{
                                    autoDimensions: true,
                                    autoSize: true,
                                    minWidth: 200,
                                    minHeight: 400,
                                    afterClose: function() {
                                        parent.location.reload(true);
                                    }
                                });
                            },
                            success: function(data) {
                                parent.location.reload(true);
                                parent.jQuery.fancybox.close();
                            }
                        });
                        return false;
                    }else{
                        return false;
                    }
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
                    return true;
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
        <div class="form-bg" style="margin: 20px;">
            <form id="loginForm">
                <s:if test="hasActionMessages()">
                    <div class="welcome">
                        <s:actionmessage theme="simple"/>
                    </div>
                </s:if> 
                <s:if test="hasActionErrors()" >
                    <div class="notice">
                        <s:actionerror theme="simple"/>
                    </div>
                </s:if>
                <div style="text-align: center;">
                    <div style="font-size: 20px; font-weight: bold; text-align: center; color: #00477b">
                        <br/>Login<br/><br/>
                    </div>                             				
                    <p>Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName"  placeholder="Username" autocomplete="false" /></p>
                    <p>Password:&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"  name="userPassword" placeholder="Password" autocomplete="off"/></p>
                    <p>Captcha Code:&nbsp;&nbsp;&nbsp;<input type="text" id="mainCaptcha" readonly="true" autocomplete="off" style="border-width:0px; color:rgb(255,235,181);font-size: 16px; font-weight: bold; font-family: futura;font-style: italic; background-color: rgb(72,76,85); text-align: center; width:125px; height:30px"/>&nbsp;<input type="button" id="refresh" value="Refresh" onclick="Captcha();"/></p>
                    <p>Enter Captcha:&nbsp;&nbsp;&nbsp;<input type="text" id="txtInput" autocomplete="off" style="text-align: center;font-family: futura; font-size:15px;font-color:black; height:20px; width:180px;" maxlength="20"/></p>

                    <button id="submitButton" name="submitButton" type="submit"></button>
                    <br/><br/>
                    <p style="text-align: center; font-style: italic;"><a href="showRegistration.action" target="_top">Sign up for a new account</a></p>
                    <br/><br/>
                </div>
            </form>          
        </div> 
    </body>
</html>