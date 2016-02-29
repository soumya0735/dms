<%-- 
    Document   : ImportBatchMetadataShow
    Created on : 23 Dec, 2013, 1:31:51 PM
    Author     : CDAC-49
--%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%> 
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Import Batch Metadata</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <br>
        <h2 style="color: #990000">Import Batch Metadata</h2>
        <s:form action="importMetaData" theme="simple">
            <s:if test="hasActionMessages()" >
                <div class="welcome">
                    <s:actionmessage theme="simple"/>
                </div>
            </s:if>
            <s:if test="hasActionErrors()" >
                <div class="errors">
                    <s:actionerror theme="simple"/>
                </div>
            </s:if>
            <br/><br/>
            <table>
                <tr>
                    <td style="font-weight: bold">Select Base Folder <FONT color=#ff0000>*</FONT></td>
                    <td><s:select list="fileList" name="selectedFileName" id="selectedFileName"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <br><s:submit value="Import"/>
                        <s:reset/>
                    </td>
                </tr>
            </table>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

        </s:form>

    </body>
</html>
