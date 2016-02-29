<%-- 
    Document   : Audio Search
    Created on : 6 Sep, 2013, 11:05:15 AM
    Author     : Arghya Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/resources/archive.css" rel="stylesheet" type="text/css"/>
        <title>Archive Search Page</title>
        <style type="text/css">
            @import "<%=request.getContextPath()%>/resources/default3.css";
            @import "<%=request.getContextPath()%>/resources/demo_page.css";
            @import "<%=request.getContextPath()%>/resources/demo_table_jui.css";
            @import "<%=request.getContextPath()%>/resources/demo_table.css";
            @import "<%=request.getContextPath()%>/resources/jquery-ui-1.8.4.custom.css";
        </style> 
        <script type="text/javascript">
            $.noConflict();
        </script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.expander.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/headersearch.js"></script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/searchtab.js"></script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/searchtable.js"></script>
        <script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery.printElement.min.js"></script>


        <!-- For Fancy Box-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css?v=2.0.3" type="text/css" media="screen" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/fancybox/jquery.fancybox.pack.js?v=2.0.3"></script>
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
       
            $(document).ready(function() {
                $(".various1").fancybox({
                    maxWidth	: 500,
                    maxHeight	: 25,
                    width	: 800,
                    height	: 600,
                    autoSize	: false,
                    closeClick	: true,
                    openEffect	: 'none',
                    closeEffect	: 'none'
                });
            }); 
        </script>
        <!-- End Fancy Box-->

        <!-- Button Reset -->

        <script>
            $(document).ready(function() {
                $("#reset").click(function() { 
                    $( "#title" ).val("");
                    $( "#creator" ).val("");
                    $( "#keywords" ).val("");
                    $( "#subject" ).val("");
                    $( "#language" ).val("");  
                    $( "#txtInput" ).val(""); 
                    
                });
            });
        </script>
        <!-- End Button Reset -->

        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

        <style>
            .ui-autocomplete {
                max-height: 205px;
                max-width:  199px;
                overflow-y: auto;
                /* prevent horizontal scrollbar */
                overflow-x: hidden;
            }
            /* IE 6 doesn't support max-height
             * we use height instead, but this forces the menu to always be this tall
            */
            * html .ui-autocomplete {
                height: 205px;
                width:  199px;
                overflow-y: auto;
                overflow-x: hidden;
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function() {
                $( "#title" ).autocomplete({
                    source : function(request, response) {
                        $.ajax({
                            url : "SearchController_audiotitle",
                            type : "POST",
                            data : {
                                term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                response(jsonResponse.list);
                            }
                        });
                    }
                });
                
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $( "#creator" ).autocomplete({
                    source : function(request, response) {
                        $.ajax({
                            url : "SearchController_audiocreator",
                            type : "POST",
                            data : {
                                term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                response(jsonResponse.list);
                            }
                        });
                    }
                });
                
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $( "#keywords" ).autocomplete({
                    source : function(request, response) {
                        $.ajax({
                            url : "SearchController_audiokeyword",
                            type : "POST",
                            data : {
                                term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                response(jsonResponse.list);
                            }
                        });
                    }
                });
                
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $( "#language" ).autocomplete({
                    source : function(request, response) {
                        $.ajax({
                            url : "SearchController_audiolanguage",
                            type : "POST",
                            data : {
                                term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                response(jsonResponse.list);
                            }
                        });
                    }
                });
                
            });
        </script>    
        <script type="text/javascript">
            $(document).ready(function() {
                $( "#subject" ).autocomplete({
                    source : function(request, response) {
                        $.ajax({
                            url : "SearchController_audiosubject",
                            type : "POST",
                            data : {
                                term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                response(jsonResponse.list);
                            }
                        });
                    }
                });
                
            });
        </script> 
        <script type="text/javascript">
          
            function Captcha(){
                var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
                var i;
                for (i=0;i<6;i++){
                    var a = alpha[Math.floor(Math.random() * alpha.length)];
                    var b = alpha[Math.floor(Math.random() * alpha.length)];
                    var c = alpha[Math.floor(Math.random() * alpha.length)];
                    var d = alpha[Math.floor(Math.random() * alpha.length)];
                    var e = alpha[Math.floor(Math.random() * alpha.length)];
                    var f = alpha[Math.floor(Math.random() * alpha.length)];
                    var g = alpha[Math.floor(Math.random() * alpha.length)];
                }
                var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
                document.getElementById("mainCaptcha").value = code
                
            }
            function ValidCaptcha(){
                var string1 = removeSpaces(document.getElementById('mainCaptcha').value);                
                var string2 = removeSpaces(document.getElementById('txtInput').value);
                
                if (string1 == string2 ){
                  
                }
                else{        
                    alert('Captcha Mismatch!');
                    return false;
                }
            }
            function removeSpaces(string){
                return string.split(' ').join('');
            }

        </script>
    </head>
    <body onload="Captcha();">

        <div id="content_container" class="imagewater">   
            <div class="logo_visva">
                <img alt="Logo" src="<%=request.getContextPath()%>/images/logo_visva.jpg" style="float: left"/>
            </div>

            <div id="tabbed_box_1" class="tabbed_box">

                <div class="tabbed_area">


                    <ul class="tabs">
                        <li><a href="showBookSearch.action" id="def_tab" title="Book-Search" >Book Archive</a></li>
                        <li><a href="showAudioSearch.action"  title="Audio-Search" class="tab active">Audio Archive</a></li>

                    </ul>
                    <div id="Audio-Search" class="content">
                        <form  method="get" action="book_search.action" onsubmit="return ValidCaptcha();">
                            <input type="hidden" name="searchtype" value="audio"/>
                            <!--<div style="top:5px; position:relative; font-size:16px; color:#0000FF; font-weight:bold;" class="opa"> <span >Search</span></div> -->

                            <div id="div44"> 
                                <label for="search2"  title="" class="la1" >Title:</label>	
                                <span>
                                    <input type="text" id="title" name="title" style="font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="255"/>
                                </span>
                            </div>
                            <div id="div44"> 
                                <span>
                                    <label for="search3" title="" class="la1" >Composer:</label>
                                    <input type="text" id="creator"  name="creator" style="font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="255"/>
                                </span>
                            </div>
                            <div id="div44"> 
                                <span>
                                    <label for="search4" title="" class="la1" >Singer:</label>
                                    <input type="text" id="keywords" name="keywords" style="font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="255"/>
                                </span>
                            </div>
                            <div id="div44"> 
                                <span>
                                    <label for="search5" title="" class="la1" >Lyricist:</label>
                                    <input type="text" id="subject" name="subject" style="font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="255"/>
                                </span>
                            </div>
                            <div id="div44"> 
                                <span>
                                    <label for="search6" title="" class="la1" >Language:</label>
                                    <input type="text" id="language" name="language" style="font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="255"/>
                                </span>
                            </div>

                            <br>
                            <div id="div44">                                                                
                                <input type="text" id="mainCaptcha" readonly="true" style="border-width:0px; color:rgb(255,235,181);font-size: 16px; font-weight: bold; font-family: futura;font-style: italic; background-color: rgb(72,76,85); text-align: center; width:125px; height:30px" />
                                <input type="button" id="refresh" value="Refresh" onclick="Captcha();"/>  
                                <br/><br/>
                            </div>

                            <div id="div44"> 
                                <label for="captcha" title="" class="la1" style="font-size: 12px; font-weight: bold; color: rgb(140,60,15); font-family: futura;">Enter the CAPTCHA text below:</label>
                            </div>
                            <div id="div44">                                                             
                                <input type="text" id="txtInput" autocomplete="off" style="text-align: center;font-family: futura; font-size:15px;font-color:black; height:18px; width:200px;" maxlength="50"/>                                                                    
                            </div> 

                            <br>
                            <div id="div44">

                                <div id="div50">
                                    <input type="hidden" name="type" value="book"/>
                                    <input type="submit" class="css3button" value="Search" />

                                </div>
                                <div id="div51">                           
                                    <input type="button" id="reset" value="Reset"/> 
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <div id="columnstrip"></div>

            <div class="demo_jui" id="div61"> 
                <s:if test="hasActionErrors()" >
                    <div class="errors">
                        <s:actionerror theme="simple"/>
                    </div>
                </s:if>
                <s:else>
                    <c:choose>
                        <c:when test="${fn:length(itemMetadataList) gt 0}">
                            <table class="display" id="example" width="100%" style="font-size: 12px; overflow: auto;"> 
                                <thead width="100%"> 
                                    <tr> 
                                        <th style="min-width: 170px;">Title</th> 
                                        <th>Composer</th>
                                        <th>Lyricist</th>
                                        <th>Singer</th>
                                        <th>Details</th>
                                        <th>Play</th>
                                    </tr> 
                                </thead> 
                                <tbody> 
                                    <c:forEach var="m" items="${itemMetadataList}">
                                        <tr class="gradeA"> 
                                            <td style="min-width: 170px; text-align: left;">${m.title}</td> 
                                            <td>${m.creator}</td> 
                                            <td>${m.subject}</td> 
                                            <td>${m.keywords}</td> 
                                            <td><a href="audioSearchResult.action?bookId=${m.bookid}" class="various fancybox.iframe">Details</a></td>
                                            <td>
                                                <a href="<%=request.getContextPath()%>/pages/play_music.jsp?pdf_location=${m.pdf_location}&disk_name=${m.disk_name}&title=${m.title}" class="various1 fancybox.iframe">Play</a>
                                            </td>
                                        </tr> 
                                    </c:forEach>

                                </tbody> 
                            </table> 
                        </c:when>
                        <c:otherwise>
                            <div style="width: 100%">
                                <p style="margin-left: 20%; font-family: futura; font-size: 16px; color: rgb(140,60,15)">Please Enter the Specific Requirement to Narrow-Down the Search</p>
                                <!--<p style="margin-left: 30%; font-family: futura; font-size: 16px; font-style: italic; color: rgb(140,60,15)">(Flash Player support is required to play songs)</p>-->
                            </div>
                        </c:otherwise>
                    </c:choose>
                </s:else>
            </div>
        </div>
    </body>
</html>
