<%-- 
    Document   : 
    Created on : 6 Sep, 2013, 11:03:11 AM
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
        <!--<link href="<%=request.getContextPath()%>/resources/style.css" rel="stylesheet" type="text/css"/>-->
        <link href="<%=request.getContextPath()%>/resources/default_wbsl.css" rel="stylesheet" type="text/css"/>  

        <script type="text/javascript" language="javascript" src="js/jquery.js"></script>       
        <!-- Add fancyBox -->
        <link rel="stylesheet" href="fancybox/jquery.fancybox.css?v=2.0.3" type="text/css" media="screen" />
        <script type="text/javascript" src="fancybox/jquery.fancybox.pack.js?v=2.0.3"></script> 

        <script type="text/javascript">
            
            $(document).ready(function() {                            
                $(".various").fancybox({
                    openEffect	: 'none',
                    closeEffect	: 'none'
                });
            });
        </script>

        <title>About Us</title>

    </head>
    <body>
        <div class="main"> 
            <h2 style="font-weight: bold; text-align: center;">
                Mailing Address:
            </h2>
            <p align="justify" style="text-align: center;">
                sectt.liby-wb@nic.in</br></br>
            </p>
            <h2 style="font-weight: bold; text-align: center;">
                Present Address:
            </h2>
            <p align="justify" style="text-align: center;">
                W.B. Secretariat Library </br>
                Block-F,</br>
                Ground Floor,</br>
                Writers' Building</br>
                Kolkata – 700001</br></br>
                
                <b>Library will be shifted very soon in the following address:</b></br>
                W.B. Secretariat Library </br>
                Block – II,</br>
                Ground Floor,</br>
                Writers' Building</br>
                Kolkata – 700001</br></br>
                <b>Librarian:</b> Mrs. Rama Barai</br>
                <b>Phone No.:</b> 2214-4410 (Direct),
                2254-4230 (PBX)</br>
                <b>Technical Section:</b> 2254-4620</br>
            </p>
        </div>
    </body>
</html>
