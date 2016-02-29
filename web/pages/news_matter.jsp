<%-- 
    Document   : News Matter
    Created on : 16 Feb, 2015, 11:20:12 AM
    Author     : Arghya Ghosh
--%>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB" lang="en-GB">
    <!-- Start Header -->
    <head>
        <title>News</title>
        <meta http-equiv="Content-Style-Type" content="text/css"/>
        <meta http-equiv="Content-Script-Type" content="text/javascript"/>
        <link href="/css/print.css" media="print" rel="stylesheet" title="CSS" type="text/css">
            <style type="text/css">
                @import "css/default2.css";
                @import "css/demo_page.css";
                @import "css/demo_table_jui.css";
                @import "css/jquery-ui-1.8.4.custom.css";
            </style> 
            <style type="text/css" media="print">
                #borders,#masthead,#navigation,#navigation1,#content_container,#footer,#search_option,#btn-size-logo{display:none;}
                #tempcontainer{display:block;}
            </style>

            <!-- Add fancyBox -->
            <link rel="stylesheet" href="fancybox/jquery.fancybox.css?v=2.0.3" type="text/css" media="screen"/>
            <script type="text/javascript" src="fancybox/jquery.fancybox.pack.js?v=2.0.3"></script>

            <!-- Optionaly include button and/or thumbnail helpers -->
            <link rel="stylesheet" href="fancybox/helpers/fancybox-buttons.css?v=2.0.3" type="text/css" media="screen"/>
            <script type="text/javascript" src="fancybox/helpers/jquery.fancybox-buttons.js?v=2.0.3"></script>

            <script type="text/javascript" src="fancybox/helpers/jquery.fancybox-thumbs.css?v=2.0.3"></script>
            <script type="text/javascript" src="fancybox/helpers/jquery.fancybox-thumbs.js?v=2.0.3"></script>

            <script lang="javascript">
                $(document).ready(function() {
                    $('.fancybox').fancybox({
                        'beforeShow': function(){
                            var win=null;
                            var content = $('#fancybox-inner');
                            $('.fancybox-wrap').append('<div id="fancy_print"></div>');
                            $('#fancy_print').bind("click", function(){
                                win = window.open("width=200,height=200");
                                self.focus();
                                win.document.open();
                                win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
                                win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
                                win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
                                win.document.write(content.html());
                                win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
                                win.document.close();
                                win.print();
                                win.close();
                            });
                        }
                    });
                });
            </script>
            <script language="JavaScript">
                var message="This function is not allowed here."; 
 
                function clickIE() {if (document.all) {alert(message); return false;}}
                function clickNS(e) {if 
                    (document.layers||(document.getElementById&&!document.all)) {
                        if (e.which==2||e.which==3) {alert(message);return false;}}}
                if (document.layers) 
                {document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
                else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}
 
                document.oncontextmenu=new Function("return false")           
            </script>
    </head>
    <body id="blog" oncontextmenu="return false;">
        <div class="fancybox-wrap">
            <div class="fancybox-outer" >
                <div class="fancybox-inner" >
                    <div class="tempcontainerclass" id="tempcontainer" style="display: block;">                        
                        <div id="btn-size-logo">

                            <div class="clear">&nbsp;  </div>

                        </div><h2>${param.news_heading}</h2><hr>
                            <p align="justify">${param.news_content}</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

