<%-- 
    Document   : BookReader
    Created on : Aug 14, 2015, 3:02:47 PM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <% response.addHeader("X-Frame-Options", "SAMEORIGIN");%>
        <title>Book Reader</title>
        <link rel="icon" type="image/png" href="images/wbsl_favicon.png" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/BookReader/BookReader.css" id="BRCSS"/>
        <!-- Custom CSS overrides -->
        <link rel="stylesheet" type="text/css" href="BookReaderDemo.css"/>

        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/jquery-ui-1.8.5.custom.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/dragscrollable.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/jquery.colorbox-min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/jquery.ui.ipad.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/jquery.bt.min.js"></script>

        <script type="text/javascript" src="<%=request.getContextPath()%>/BookReader/BookReader.js"></script>

        <!--Java Script to disable Right-Click-->
        <script language="JavaScript">
            var message="This function is not allowed here."; 
 
            function clickIE() {if (document.all) {alert(message); return false;}}
            function clickNS(e) {if 
                (document.layers||(document.getElementById&&!document.all)) {
                    if (e.which==2||e.which==3) {alert(message);return false;}}}
            if (document.layers) 
            {document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
            else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}
 
            document.oncontextmenu=new Function("return false")           
        </script>
        <!--Java Script to disable Right-Click-->

    </head>
    <body style="background-color: #939598;">

        <div id="BookReader">
            Book Reader   <br/>

            <noscript>
            <p>
                The BookReader requires JavaScript to be enabled. Please check that your browser supports JavaScript and that it is enabled in the browser settings.
            </p>
            </noscript>

        </div>
        <script type="text/javascript"> 
           
            var filename = '<c:forEach items="${itemList}" var="itemList"><c:out value="${itemList.filename}"/></c:forEach>';
            var pdf_location = '<c:forEach items="${itemList}" var="itemList"><c:out value="${itemList.pdf_location}"/></c:forEach>';
            var disk_name = '<c:forEach items="${itemList}" var="itemList"><c:out value="${itemList.disk_name}"/></c:forEach>';
            var totalpages = '<c:forEach items="${itemList}" var="itemList"><c:out value="${itemList.totalpages}"/></c:forEach>';
           
            </script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/BookReaderJSSimple.js"></script>

    </body>
</html>

