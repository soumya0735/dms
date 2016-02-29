<%-- 
    Document   : updateMetadataSearch.jsp
    Created on : 25 Jun, 2015, 10:56:24 AM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/resources/displaytag.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
        <title>Advanced Search</title>
    </head>
    <body>
        <div id="main" > 
            <s:if test="hasActionMessages()" >
                <s:div cssClass="welcome">
                    <s:actionmessage theme="simple"/>
                </s:div>
            </s:if>
            <s:if test="hasActionErrors()" >
                <s:div cssClass="errors" align="center">
                    <s:actionerror theme="simple"/>
                </s:div>
            </s:if>
            <br/>
            <s:form  action="advancedSearchSubmitActionMetadata" enctype="multipart/form-data" theme="simple">
                <!-- <s:div cssClass="form_div" align="center"> -->
                    <fieldset id="form_fieldset" style="width: 60%">

                        <table id="form_table"  width="99%"  align="center">
                            <caption style="color: rgb(140,60,15);font-weight: bold; font-size: 18px; padding-top: 5px; padding-bottom: 10px;font-family:verdana;">Search Records</caption>
                            <tbody id="body" style="font-weight: bold;font-family:verdana;font-size: 12px;">
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Head No.
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="search_criteria.bookheadno" id="bookheadno" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Title:
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="search_criteria.title" id="title" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Author:
                                    </td>
                                    <td align="left">
                                        <s:textfield  name="search_criteria.creator" id="creator" size="40" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Keywords: 
                                    </td>
                                    <td align="left">
                                        <s:textfield name="search_criteria.keywords" id="keywords" cssClass="tb10"/>
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        From Year (YYYY):
                                    </td>
                                    <td align="left">
                                        <s:textfield  id="fromPeriod" name="search_criteria.fromPeriod" cssStyle="width: 92px;" maxLength="4"/> To Year (YYYY):
                                        <s:textfield  id="toPeriod" name="search_criteria.toPeriod" cssStyle="width: 92px;" maxLength="4"/>
                                    </td>
                                </tr>

                            </tbody>
                            <tfoot style="text-align: center">
                                <tr>
                                    <td colspan="2" style="padding-top: 5px; padding-bottom: 5px; background-color: white;">
                                        <s:submit value="Search" cssStyle="font-family:tahoma, arial, sans-serif; font-weight:bold; width: 100px; height: 25px; color: rgb(102,43,11)" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </fieldset>
                    <br><br>
                    <!-- </s:div> -->
            </s:form> 
        </div>
    </body>
</body>
</html>
