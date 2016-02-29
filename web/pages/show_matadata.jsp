<%-- 
    Document   : show_matadata
    Created on : 6 Feb, 2015, 5:49:54 PM
    Author     : CDAC-49
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/resources/displaytag.css" rel="stylesheet" type="text/css" />
        <title>Metadata Page</title>

    </head>
    <body>
        <display:table export="false" id="data" name="itemMetadataList" pagesize="20" class="displaytag"  requestURI="#">
            <display:column property="title" title="Title" sortable="true"/>    
            <display:column property="creator" title="Creater" sortable="true"/>     
            <display:column property="subject" title="Subject" sortable="true"/>    
            <display:column property="language" title="Language" sortable="true"/>    
        </display:table>
    </body>
</html>
