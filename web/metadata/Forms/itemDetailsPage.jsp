<%-- 
    Document   : itemDetailsPage
    Created on : 19 Dec, 2013, 2:26:51 PM
    Author     : CDAC-01
--%>
<%@taglib  prefix="s" uri="/struts-jquery-tags" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <c:forEach items="${itemDetailsList}" var="itemList">
            <div id="content">	
                <br>
                <table align="left" border="1" cellpadding="0" cellspacing="0" style="position:absolute;left:0px;width:100%;">
                    <caption style="color: rgb(47,97,6);font-weight: bold">Basic Details</caption> 
                    <tbody id="body" style="font-family:verdana">
                        <tr>
                            <td style="font-weight: bold;">Book Head Number:</td>
                            <td><c:out value="${itemList.bookheadno}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Title:</td>
                                <td ><c:out value="${itemList.title}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Language:</td>
                                <td ><c:out value="${itemList.language}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Keywords:</td>
                                <td ><c:out value="${itemList.keywords}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Creator:</td>
                                <td ><c:out value="${itemList.creator}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Description:</td>
                                <td ><c:out value="${itemList.description}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Subject:</td>
                                <td ><c:out value="${itemList.subject}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Publisher:</td>
                                <td ><c:out value="${itemList.publisher}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Total Pages:</td>
                                <td ><c:out value="${itemList.pages}"></c:out></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="color: rgb(47,97,6);font-weight: bold" align="center">
                                    Other Details
                                </td>
                            </tr>                        
                            <tr>
                                <td style="font-weight: bold;">Digital Publication Date:</td>
                                <td><c:out value="${itemList.digitalPublicationDate}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Format:</td>
                                <td><c:out value="${itemList.format}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Document Type:</td>
                                <td><c:out value="${itemList.documentType1}"></c:out></td>
                            </tr>
                            <!--<tr>
                                <td style="font-weight: bold;">Material Type:</td>
                                <td><c:out value="${itemList.materialType}"></c:out></td>
                            </tr>-->
                            <!--<tr>
                                <td style="font-weight: bold;">Identifier:</td>
                                <td><c:out value="${itemList.identifier}"></c:out></td>
                            </tr>-->
                            <tr>
                                <td style="font-weight: bold;">Source:</td>
                                <td><c:out value="${itemList.source}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Rights:</td>
                                <td><c:out value="${itemList.rights}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Copy Right Date:</td>
                                <td><c:out value="${itemList.copyrightDate}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Rights:</td>
                                <td><c:out value="${itemList.rights}"></c:out></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Scanning Centre:</td>
                                <td>C-DAC Kolkata</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Digital Publisher:</td>
                                <td>West Bengal Secretariat Library, Govt. of West Bengal</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
        </c:forEach>
    </body>
</html>
