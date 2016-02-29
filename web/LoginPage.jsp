
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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/base.css">        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/layout.css">
        <script src="/wbslcms/resources/app.js"></script>

        <script type="text/javascript">
            jQuery(document).ready(function() {
                jQuery('.forward').fancybox(
                {
                    autoDimensions: false,
                    autoSize: false,
                    minWidth: 400,
                    maxWidth: 410,
                    minHeight: 285,
                    maxHeight: 300
                        
                }
            );
                jQuery('.back').fancybox(
                {
                    autoDimensions: false,
                    autoSize: true,
                    minWidth: 100,
                    minHeight: 240
                        
                }
            );
            });
        </script>  


    </head>
    <body>           
        <div class="form-bg">
            <form method="post" action="logon.action">
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
                <h2>Login</h2>                             				
                <p><input type="text" name="userName"  placeholder="Username"/></p>
                <p><input type="password"  name="userPassword" placeholder="Password"/></p>				
                <button type="submit"></button>                
            </form>
        </div>        		
        <!-- End Document -->
    </body>
</html>