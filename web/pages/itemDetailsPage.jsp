<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Book Details Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/default5.css" type="text/css" media="screen" />

        <!--JavaScript to disable Right-Click-->
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
    <body>
        <c:forEach items="${itemList}" var="itemList">
            <div>	
                <table align="left" border="1" style="position:absolute;left:0px;width:100%;">
                    <tr><td colspan="2" class="tabtext2" style="font-weight:bold;font-size:22px;text-align:center;width:30%; color: rgb(100,48,0);">Metadata Details</td>
                    </tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Head Number:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.bookheadno}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Title:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.title}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Author(s):&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.creator}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Description:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.description}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Subject:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.subject} - ${itemList.subject1}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Publisher:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.publisher}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Total Pages:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.totalpages}"></c:out></td></tr>

                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Publication Year:&nbsp;</td><td class="bluetextbig1"><c:out value="${fn:substring(itemList.copyrightdate,0,4)}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Digital Publication Date:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.digitalpublicationdate}"></c:out></td></tr>                    
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Format:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.format}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Document Type:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.documenttype1}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Document Category:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.documenttype2}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Disk Name:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.disk_name}"></c:out></td></tr>
                    <!--<tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Microfilm Number:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.microfilm_no}"></c:out></td></tr>-->
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Source:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.source}"></c:out></td></tr>
                    <!--<tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Rights:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.rights}"></c:out></td></tr>-->                  
                    </table>
                </div>
                <!--<div>
                    <table align="left" border="1" style="position:absolute;left:0px;top:300px;width:100%;">
                        <tr><td colspan="2" class="tabtext2" style="font-weight:bold;font-size:22px;text-align:center;width:30%;">Other Details</td>
                        </tr>
                        <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Digital Publication Date:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.digitalpublicationdate}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Format:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.format}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Document Type:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.documenttype1}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Identifier:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.identifier}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Source:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.source}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Rights:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.rights}"></c:out></td></tr>
                    <tr><td class="bluetextbig2" style="font-weight: bold; width:30%">Copyright Date:&nbsp;</td><td class="bluetextbig1"><c:out value="${itemList.copyrightdate}"></c:out></td></tr>
                </table>
            </div>-->


        </c:forEach>

    </body>


</html>
