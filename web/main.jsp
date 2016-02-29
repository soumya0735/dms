<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <% response.addHeader("X-Frame-Options", "SAMEORIGIN");%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Reflect Template" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title><tiles:getAsString name="title" ignore="true"/></title>
        <link rel="icon" type="image/png" href="images/wbsl_favicon.png" />
        <link href="<%=request.getContextPath()%>/resources/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/displaytag.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.js"></script>


        <!-- Add mousewheel plugin (this is optional) -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/lib/jquery.mousewheel-3.0.6.pack.js"></script>

        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancy/source/jquery.fancybox.css?v=2.1.5" media="screen" />

        <!-- Add Button helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancy/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

        <!-- Add Thumbnail helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancy/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

        <!-- Add Media helper (this is optional) -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
        <script type="text/javascript">
            jQuery(document).ready(function() {
                $(".various").fancybox({
                    maxWidth	: 800,
                    maxHeight	: 430,
                    width	: 800,
                    height	: 430,
                    autoSize	: false,
                    closeClick	: true,
                    openEffect	: 'none',
                    closeEffect	: 'none'
                });
            });
        </script>

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
        <div id="wrapper"> 
            <div id="page">
                <table id="TableMain" border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                    <tr>
                        <td>
                            <tiles:insertAttribute name="header" />
                        </td>
                    </tr>
                    <tr>
                        <td>    
                            <div id="page-bgtop">
                                <div id="page-bgbtm">
                                    <div id="content">
                                        <div class="post">
                                            <tiles:insertAttribute name="body"/>
                                        </div>
                                    </div>

                                    <div style="clear: both;">&nbsp;</div>
                                </div>                                                                                
                            </div>

                        </td>
                    </tr>
                    <tr style="top: 40px">
                        <td>                   
                            <tiles:insertAttribute name="footer" />
                        </td>
                    </tr>

                </table>
            </div>
        </div> 
    </body>

</html>