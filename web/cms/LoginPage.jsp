
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
        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->	
        <!-- General Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 	

        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/base.css">-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/layout.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/action-message.css"/>
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>  
        <script src="<%=request.getContextPath()%>/resources/app.js"></script>

        <style type="text/css">
            html, body {
                overflow: hidden;
            }
        </style> 
    </head>
    <body>
        </br></br></br></br> 
        <div class="form-bg" style="margin-left: 300px;">
            <form method="post" action="logon.action">
                <s:if test="hasActionMessages()" >
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
                        </br>Login</br></br> 
                    </div>                             				
                    <p>Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName"  placeholder="Username" autocomplete="false" /></p>
                    <p>Password:&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"  name="userPassword" placeholder="Password" autocomplete="off"/></p>	
                    </br>
                    <button type="submit"></button> 
                    <br/><br/><br/><br/>
                </div>
                <p style="text-align: center; font-style: italic; font-weight: bold"><a href="showRegistration.action" target="_top">Sign up for a new account</a></p>
            </form>
        </div> 
        </br></br></br></br> </br></br> 
        <!-- End Document -->
    </body>
</html>