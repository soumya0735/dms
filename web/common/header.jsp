<%-- 
    Document   : header
    Created on : 26 Aug, 2013, 12:59:30 PM
    Author     : CDAC-49
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=charset=ISO-8859-1" />        
        <link href="<%=request.getContextPath()%>/resources/style_wbsl.css" rel="stylesheet" type="text/css" media="screen" />
        <title>WBSL</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" href="/images/favicon.ico" >
            <script type="text/javascript">
                jQuery(document).ready(function() {
                    jQuery('.forward').fancybox(
                    {
                        autoDimensions: false,
                        autoSize: false,
                        minWidth: 100,
                        maxWidth: 370,
                        minHeight: 200,
                        maxHeight: 270

                    }
                );
                    jQuery('.back').fancybox(
                    {
                        autoDimensions: false,
                        autoSize: true,
                        minWidth: 100,
                        minHeight: 240

                    }
                );
                });
            </script> 
            <script type="text/javascript" src="/wbslcms/struts/js/base/jquery.ui.core.min.js?s2j=3.5.1"></script>
            <script type="text/javascript" src="/wbslcms/struts/js/plugins/jquery.subscribe.min.js"></script>

            <script type="text/javascript" src="/wbslcms/struts/js/struts2/jquery.struts2.min.js?s2j=3.5.1"></script>

            <script type="text/javascript">
                $(function() {
                    jQuery.struts2_jquery.version = "3.5.1";
                    jQuery.scriptPath = "/wbslcms/struts/";
                    jQuery.ajaxSettings.traditional = true;
                    jQuery.ajaxSetup({
                        cache: false
                    });
                    
                    jQuery.struts2_jquery.require("js/struts2/jquery.ui.struts2.min.js");
                    
                });
            </script>
            <script type="text/javascript">
                function googleTranslateElementInit() {
                    new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'bn,en,gu,hi,kn,mr,pa,ta,te', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
                }
            </script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

            <link id="jquery_theme_link" rel="stylesheet" href="<%=request.getContextPath()%>/struts/themes/smoothness/jquery-ui.css?s2j=3.5.1" type="text/css"/>
    </head>
    <body>
        <div id="header-wrapper">
            <div id="header">
                <div id="logo">
                    <table align="center" width="100%">
                        <tr>
                            <td style="text-align: left;width: 30px">
                                <img src="<%=request.getContextPath()%>/images/national-emblem.gif" alt="Ashok Stambh" style="padding-right: 20px;"/>
                            </td>
                            <td class="hone" style="text-align: left;vertical-align: text-top">
                                <h2 class="h2_header">West Bengal Secretariat Library</h2>                                       
                                <h2 class="hone_sub">Government of West Bengal</h2>
                            </td>
                            <td style="text-align: right;width: 30px">
                                <!--   <img src="/wbsl/images/national-emblem.gif" alt="" height="70"/>-->                                
                            </td>
                        </tr>
                    </table>                   
                </div>
            </div>
        </div>
        <div id="menu-wrapper" align="center">
            <div id="menu" align="center">
                <ul>
                    <li><a href="homePage.action" title="Home">Home</a></li>
                    <li><a href="aboutUs.action" title="About Us">About Us</a></li>   
                    <li><a href="eArchive.action" title="Archive">Archive</a></li>
                    <li><a href="getAdvancedSearch.action" title="Advanced Search" >Advanced Search</a></li>
                    <li><a href="library.action" title="Library">Library</a></li>
                    <li><a href="gallery.action" title="Gallery">Gallery</a></li>
                    <!--<li><a href="showFeedbackForm.action" title="Feedback">Feedback</a></li>-->
                    <li><a href="contactUs.action" title="Contact Us">Contact Us</a></li>
                    <c:if test="${sessionScope.userName != null}">
                        <li><a href="applicationIndex.action" title="CMS">CMS</a></li>
                    </c:if>
                    <c:if test="${sessionScope.userName == null}">

                    </c:if> 
                    <c:if test="${sessionScope.userName != null}">
                        <li><a href="logout.action" title="Log Out">Log out</a></li>
                    </c:if>
                    <c:if test="${sessionScope.userName == null}">
                        <li><a href="login.action" title="Login">Login</a></li>
                    </c:if> 
                </ul>
            </div>
            <!--<div id="google_translate_element" style="text-align: right; margin-top: -14px; padding-right: 5px;"></div>-->
        </div>
        <!-- end #menu --> 
    </body>
</html>
