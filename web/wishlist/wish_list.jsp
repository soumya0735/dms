<%-- 
    Document   : eArchive
    Created on : 23 Jun, 2015, 5:42:28 PM
    Author     : CDAC-49
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

        <title>Wish List</title>

        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/media/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources1/demo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/action-message.css"/>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.js"></script> 
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.dataTables.js"></script>
        <!-- For Fancy Box-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />


        <script type="text/javascript">
            $(document).ready(function() {
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
        <script type="text/javascript" language="javascript" class="init">
            $(document).ready(function() {
                $('#example').DataTable(); 
            } );
        </script>
    </head>

    <body>
        <div style="width: 95%; top: 30px; position: relative; left: 25px">
            <s:if test="hasActionMessages()" >
                <s:div cssClass="welcome">
                    <s:actionmessage theme="simple"/>
                </s:div>
                <br/>
            </s:if>
            <s:if test="hasActionErrors()" >
                <s:div cssClass="errors" align="center">
                    <s:actionerror theme="simple"/>
                </s:div>
                <br/>
            </s:if>
            <c:choose>
                <c:when test="${fn:length(itemMetadataList) gt 0}">
                    <table  id="example" class="display" width="100%" style="font-size: 12px; overflow: auto;"> 
                        <thead width="100%"> 
                            <tr style="text-align: left"> 
                                <th style="width: 75px; color: #255987; font-size: 14px; font-weight: bold; padding-left: 0px;"></th> 
                                <th style="min-width: 100%; color: #255987; font-size: 14px; font-weight: normal; padding-left: 0px; text-align: center;"><b>Books in the Wish List</b> <i>&nbsp;&nbsp;(Books will be available in your Wishlist for 15 days)</i></th> 
                            </tr> 
                        </thead> 
                        <tbody> 
                            <c:forEach var="m" items="${itemMetadataList}">
                                <tr class="gradeA"> 
                                    <td>
                                        <a href="bookReader.action?bookId=${m.bookid}" target="_blank">                                                
                                            <img src="${m.pdf_location}/thumbnail/${m.disk_name}/${m.filename}.jpg" alt="Image" style="height: 105px; width: 75px; border-color: rgb(120,55,0);" border="1">
                                        </a>
                                    </td>
                                    <td style="min-width: 170px; text-align: left">
                                        <p><a href="bookSearchResult.action?bookId=${m.bookid}" class="various fancybox.iframe" style="color: rgb(170,81,0); font-size: 14px; font-weight: bold; margin: 0; padding-bottom: 3px;">${m.title}</a></p>
                                        <b>Author: </b>${m.creator}</br>
                                        <b>Publisher: </b>${m.publisher}</br>
                                        <b>Subject: </b>${m.subject1}</br>
                                        <b>Publication Year: </b>${fn:substring(m.copyrightdate,0,4)}</br>
                                        <b>Head No.: </b>${m.bookheadno}</br>
                                        <b>Disk Name: </b>${m.disk_name}
                                        <p style="padding-top: 5px;"><a href="bookSearchResult.action?bookId=${m.bookid}" class="various fancybox.iframe" style="color: rgb(19,108,230);"><b>Metadata</b></a> | <a href="${m.pdf_location}/PDF/${m.disk_name}/${m.filename}.pdf" target="_blank" style="color: rgb(19,108,230);"><b>PDF</b></a> | <a href="bookReader.action?bookId=${m.bookid}" target="_blank" style="color: rgb(19,108,230);"><b>View Book</b></a> | <a href="deleteFromWishList.action?bookId=${m.bookid}" style="color: rgb(19,108,230);"><b>Remove from wishlist</b></a></p>                      
                                    </td>
                                </tr> 
                            </c:forEach>
                        </tbody> 
                    </table> 
                </c:when>
                <c:otherwise>
                    <div style="width: 100%">
                        <p style="margin-left: 40%; font-family: futura; font-size: 16px; color: rgb(140,60,15)">No Record Found</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
