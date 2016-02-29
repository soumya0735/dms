<%-- 
    Document   : News
    Created on : 16 Feb, 2015, 11:03:11 AM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/resources/archive.css" rel="stylesheet" type="text/css"/>
    <title>Archive Search Page</title>
    <style type="text/css">
        @import "<%=request.getContextPath()%>/resources/default3.css";
        @import "<%=request.getContextPath()%>/resources/demo_page.css";
        @import "<%=request.getContextPath()%>/resources/demo_table_jui.css";
        @import "<%=request.getContextPath()%>/resources/demo_table.css";
        @import "<%=request.getContextPath()%>/resources/jquery-ui-1.8.4.custom.css";
    </style> 

    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script> 
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.expander.min.js"></script>
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/headersearch.js"></script>
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/searchtab.js"></script>
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/searchtable.js"></script>
    <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.printElement.min.js"></script>


    <!-- For Fancy Box-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css?v=2.0.3" type="text/css" media="screen" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/fancybox/jquery.fancybox.pack.js?v=2.0.3"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".various").fancybox({
                maxWidth	: 800,
                maxHeight	: 600,
                width	: 800,
                height	: 600,
                autoSize	: false,
                closeClick	: true,
                openEffect	: 'none',
                closeEffect	: 'none'
            });
        });  
    </script>
</head>
<body>
    <div id="content_container" class="imagewater">   
        <div class="logo_visva">
            <img alt="Logo" src="<%=request.getContextPath()%>/images/logo_visva.jpg" style="float: left"/>
        </div>
        <div id="div12">
            <br><br> <br><br><br><br>
            <div id="div13">
                <div id="div14">                      
                </div>
                <div id="div15">
                    <span id="span7"></span>
                </div>
            </div>
            <div id="div16">
            </div>
        </div>
        <div id="columnstrip">
        </div>
        <div id="div37">
            <span id="span40">News Updates</span>
        </div>
        <div id="main_content1">
            <c:set var="iCount" value="0"/>
            <table>
                <c:forEach var="n" items="${newsList}">
                    <c:set var="iCount" value="${iCount + 1}"/>
                    <tr class="gradeA"> 
                        <td style="color: rgb(140,60,15); font-family: futura; font-size: 16px; font-weight: bold;">${iCount}.</td> 
                        <td class="center"><a style="color: rgb(140,60,15); font-family: futura; font-size: 16px; font-weight: bold;" class="various fancybox.iframe" href="newsMatter.action?news_heading=${n.name}&news_content=${n.news_matter}">${n.name}</a><br></td>
                    </tr>
                </c:forEach>
            </table> 
        </div>   
    </div>
</body>
</html>
