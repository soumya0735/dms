<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Reflect Template" />
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <title><tiles:getAsString name="title" ignore="true"/></title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/table.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancy/lib/jquery-1.10.1.min.js"></script>

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
                jQuery('.fancybox').fancybox(
                {			
                    autoDimensions: false,
                    autoSize:true
                }
            );
            });
        </script>  
    </head>

    <body>
        <div id="wrapper"> 
            <div id="page">
                <table id="TableMain" border="1" cellpadding="1" cellspacing="1" width="100%" align="center">
                    <tr>
                        <td colspan="2">
                            <tiles:insertAttribute name="header" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <tiles:insertAttribute name="sidebar"/>
                        </td>
                        <td>                           
                            <tiles:insertAttribute name="body"/>                                        
                        </td>
                    </tr>
                    <tr>
                        <td>  
                            <tiles:insertAttribute name="footer" />
                        </td>
                    </tr>
                </table>
            </div>
        </div> 
    </body>

</html>