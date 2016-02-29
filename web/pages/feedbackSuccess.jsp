<%-- 
    Document   : feedbackSuccess
    Created on : 25 Jun, 2015, 10:56:24 AM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/resources/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/fancy_readmore.js"></script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
        <title>Feedback Success Page</title>

    </head>
    <body>
        <div id="main"> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div id="main_content1"> 
                <!-- <p style="margin-left: 50%; font-family: futura; font-size: 22px; color: rgb(140,60,15)">Feedback Submitted Successfully</p> -->
                <p style="margin-left: 330px; font-family: futura; font-size: 22px; color: rgb(140,60,15)">Feedback Submitted Successfully</p>
                <p style="margin-left: 355px; font-family: futura; font-size: 16px; color: rgb(140,60,15)">Thank you for your valuable feedback</p>   
            </div>   
    </body>
</html>
