<%-- 
    Document   : play_music
    Created on : 18 Feb, 2015, 10:41:42 AM
    Author     : CDAC-36
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Audio Player</title>

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
    </head>
    <body style="background-color: black; text-align:center">
        <br/><br/>
       	<audio controls autoplay>
            <source src="<%=request.getParameter("pdf_location")%>/Sound/<%=request.getParameter("disk_name")%>/<%=request.getParameter("title")%>.mp3" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>
        <div style="color: #d5d3d3">
            <br>
            Title: <%=request.getParameter("title")%>
        </div>
    </body>
</html>
