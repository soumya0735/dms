<%-- 
    Document   : metaDataVerivyShow
    Created on : 20 Dec, 2013, 1:12:17 PM
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
        <script type="text/javascript" src="/resources/datetimepicker.js" language="JavaScript"></script>
        <link href="/resources/displaytag.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="/resources/style.css" type="text/css" media="screen" />
        
        <!-- For Fancy Box-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
        
        <script language="JavaScript" type="text/javascript">            
            function validateForm()
            {

                var accessionNumber = document.getElementById("accessionNumber").value;
                if (accessionNumber == "") {
                    alert("Give the Accession Number !!");
                    return false;
                }
                var date1 = document.getElementById("date1").value;
                if (date1 == "") {
                    alert("Give today's date !!");
                    return false;
                }

                var title = document.getElementById("title").value;
                if (title == "") {
                    alert("Enter title !!");
                    return false;
                }

                var creator = document.getElementById("creator").value;
                if (creator == "") {
                    alert("Enter creator !!");
                    return false;
                }

                var keywords = document.getElementById("keywords").value;
                if (keywords == "") {
                    alert("Enter at lease one Keyword !!");
                    return false;
                }

                var description = document.getElementById("description").value;
                if (description == "") {
                    alert("Enter the Description !!");
                    return false;
                }


                var digitalPublicationDate = document.getElementById("digitalPublicationdate").value;
                if (digitalPublicationDate == "") {
                    alert("Give Digital Publication Date !!");
                    return false;
                }

                var pages = document.getElementById("pages").value;
                if (pages == "") {
                    alert("Enter no of Pages !!");
                    return false;
                }

            }

            jQuery(document).ready(function() {
                jQuery('.forward').fancybox(
                {
                    autoDimensions: true,
                    autoSize: false,
                    minWidth: 900,
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
    </head>
    <body>
        <s:if test="hasActionMessages()">
            <div class="welcome">
                <s:actionmessage theme="simple"/>
            </div>
        </s:if>

        <s:form action="metaDateVerify" theme="simple" id="metadataVerify" enctype="multipart/form-data" onsubmit="return validateForm();">
            <display:table export="false" id="data" name="metadataList" pagesize="10" class="displaytag" requestURI="metaDateVerifyShow.action">
                <display:column>
                    <input type="checkbox" name="bookIdArr"  value="${data.bookid}"/>
                    <input type="hidden" name="bookTitleArr" value="${data.bookid}"  />                    
                </display:column>

                    <display:column title="Title" style="font-weight: bold;">
                    <a class="forward fancybox.iframe" href="getItemDetails.action?bookid=${data.bookid}">
                        <c:out  value="${data.title}"/>                                              
                    </a>
                </display:column>
                <display:column title="Creator" property="creator"/>
                <display:column title="Head No." property="bookheadno"/>
                <display:column title="Publisher" property="publisher"/>
                <display:column title="Action" style="font-weight: bold;">
                    <a href="getMetadataDescription.action?bookid=${data.bookid}">
                        <c:out  value="Edit"/>
                    </a>
                </display:column>                                
            </display:table>
            <table style="padding-left: 40px;">
                <tr>
                    <td>
                        <s:submit name="submit" value="Verify Okay" />
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>
