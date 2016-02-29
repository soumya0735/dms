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
        <title></title>

    </head>
    <body onload="Captcha();">
        <div id="main" > 
            Registration Successful.
            Thank You for Registering.
        </div>
    </body>
</body>
</html>
