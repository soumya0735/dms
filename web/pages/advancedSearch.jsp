<%-- 
    Document   : advancedSearch.jsp
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
        <style>
            tr.spaceUnder > td
            {
                /*padding-bottom: 1em;*/
            }
            .tb10 {
                background-image:url(images/form_bg.jpg);
                background-repeat:repeat-x;
                border:1px solid #d1c7ac;
                width: 310px;
                color:#333333;
                padding:3px;
                margin-right:4px;
                /*margin-bottom:8px;*/
                font-family:tahoma, arial, sans-serif;
            }
        </style>
        <sx:head/>
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
            <s:form  action="advancedSearchSubmitAction" enctype="multipart/form-data" theme="simple">
                <!-- <s:div cssClass="form_div" align="center"> -->
                    <fieldset id="form_fieldset" style="width: 60%">

                        <table id="form_table"  width="99%"  align="center">
                            <caption style="color: rgb(140,60,15);font-weight: bold; font-size: 18px; padding-top: 5px; padding-bottom: 10px;font-family:verdana;">Advanced Search</caption>
                            <tbody id="body" style="font-weight: bold;font-family:verdana;font-size: 12px; background-color: white;">
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Head No.
                                    </td>
                                    <td align="left">
                                        <sx:autocompleter 
                                            id="bookheadno"
                                            name="search_criteria.bookheadno"
                                            cssClass="tb10"
                                            list="bookheadno_list"
                                            showDownArrow="false"
                                            dropdownHeight="280"
                                            dropdownWidth="310"
                                            />
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Title:
                                    </td>
                                    <td align="left">
                                        <sx:autocompleter 
                                            id="title"
                                            name="search_criteria.title"
                                            cssClass="tb10"
                                            list="title_list"
                                            showDownArrow="false"
                                            dropdownHeight="280"
                                            dropdownWidth="310"
                                            />
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Author:
                                    </td>
                                    <td align="left">
                                        <sx:autocompleter 
                                            id="creator"
                                            name="search_criteria.creator"
                                            cssClass="tb10"
                                            list="creator_list"
                                            showDownArrow="false"
                                            dropdownHeight="280"
                                            dropdownWidth="310"
                                            />
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        Keywords: 
                                    </td>
                                    <td align="left">
                                        <s:textfield  id="keywords" name="search_criteria.keywords"  cssClass="tb10"/>
                                    </td>
                                </tr>
                                <tr class="spaceUnder">
                                    <td align="left">
                                        From Year (YYYY):
                                    </td>
                                    <td align="left">
                                        <s:textfield  id="fromPeriod" name="search_criteria.fromPeriod" cssClass="tb10" cssStyle="width: 90px;" maxLength="4"/> To Year (YYYY):
                                        <s:textfield  id="toPeriod" name="search_criteria.toPeriod" cssClass="tb10" cssStyle="width: 92px;" maxLength="4"/>
                                    </td>
                                </tr>

                            </tbody>
                            <tfoot style="text-align: center">
                                <tr>
                                    <td colspan="2" style="padding-top: 5px; padding-bottom: 5px; background-color: white;">
                                        <s:submit value="Search" cssStyle="font-family:tahoma, arial, sans-serif; font-weight:bold; width: 100px; height: 25px; color: rgb(102,43,11); " />
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
