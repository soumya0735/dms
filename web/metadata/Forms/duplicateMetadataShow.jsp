<%-- 
    Document   : duplicateMetadataShow
    Created on : 20 Dec, 2013, 5:40:04 PM
    Author     : CDAC-01
--%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@taglib  uri="/struts-jquery-tags" prefix="sj" %>
<%@taglib  prefix="display" uri="http://displaytag.sf.net" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/resources/datetimepicker.js" language="JavaScript"></script>
        <link href="/resources/displaytag.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="/resources/style.css" type="text/css" media="screen" />
        <script>
            jQuery(document).ready(function() {
                jQuery('.forward').fancybox(
                        {
                            autoDimensions: true,
                            autoSize: true,
                            minWidth: 540,
                            minHeight: 450,
                            afterClose: function() {
                                parent.location.reload(true);
                            }
                        }
                );
                jQuery('.back').fancybox(
                        {
                            autoDimensions: false,
                            autoSize: true,
                            minWidth: 540,
                            minHeight: 240

                        }
                );
            });
        </script>
        <script type="text/javascript" src="/eFlora_CMS1/struts/js/base/jquery.ui.core.min.js?s2j=3.5.1"></script>
        <script type="text/javascript" src="/eFlora_CMS1/struts/js/plugins/jquery.subscribe.min.js"></script>
        <script type="text/javascript" src="/eFlora_CMS1/struts/js/struts2/jquery.struts2.min.js?s2j=3.5.1"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <br/>
        <display:table export="false" id="data" name="duplicateMetadataList" pagesize="10" class="displaytag" requestURI="DuplicateMetadataShow.action">                                               
            <display:column title="Book Id" property="bookid"/>
            <display:column title="Book Title" property="title"/>
            <display:column title="Creator" property="creator"/>
            <display:column title="Head No." property="bookheadno"/>
            <display:column title="Publisher" property="publisher"/>
            <display:column title="Material Type" property="materialType"/>
            <display:column title="Language" property="language"/>
            <display:column title="Subject" property="subject"/>
            <display:column title="Total Pages" property="pages"/>
            <display:column title="Action">
                <a href="DeleteMetadataAction.action?bookid=${data.bookid}"><b>Delete</b></a>
            </display:column>
        </display:table>
        <br>
    </body>
</html>
