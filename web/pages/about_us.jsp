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
        <div class="main" style="margin-left: 30px; margin-right: 30px;"> 
            <h2 style="font-weight: bold">
                Introduction
            </h2> 
            <p align="justify">
                The West Bengal Secretariat Library at Writers' Building, Kolkata, is one of the oldest and largest library under Government of West Bengal. It has a traditional and historical significance. The library has a rich collection of books dating back from the British era till date. Some of them are very rare.
            </p>
            <h2 style="font-weight: bold">
                History
            </h2>
            <p align="justify">
                The West Bengal Secretariat Library previously known as <b>"Bengal Secretariat Library"</b> was established in 1867.It was associated with the Bengal Secretariat, and was shifted to different places in Kolkata (the then Calcutta) along with the <b>"Bengal Secretariat"</b> in the past.
                </br></br>
                Since 1921, this library was under the administrative control of Education Department of the then Bengal Government of the undivided India. From 1945 it came under the control of the Chief Minister's Secretariat. After Independence, i.e., 15th August 1947 this library was brought under the control of the Home Department at Writers' Building and still continues to be under this Department.
                </br></br>
                The then Hon'ble Chief Minister of West Bengal Dr. Bidhan Chandra Roy took the initiative to develop and modernize this library. On 9th June 1961, Dr. B.C. Roy inaugurated the library on the ground floor of the F-Block of the Writers' Building.
                </br></br>
                West Bengal Secretariat Library has its collection of books mainly in English belonging to the 18th and 19th centuries. This library has a collection of round about 2 lakhs of books, of which 60,000 are categorised as rare, old, worn-out and brittle. 
            </p>
            <h2 style="font-weight: bold">
                Main Holdings of the Library
            </h2>
            <p align="justify">
                The main features of the holding in the WBSL are as follows:
            </p>
            <div style="margin-left: 40px;">
                1)&nbsp;&nbsp;	General Administrative reports from the middle of the nineteenth century.</br>
                2)&nbsp;&nbsp;	Annual reports on the working of the different departments of the Government.</br>
                3)&nbsp;&nbsp;	Parliamentary debates.</br>
                4)&nbsp;&nbsp;	Census Reports since 1881.</br>
                5)&nbsp;&nbsp;	Reports on Publications registered in India and other provinces from 1874-98.</br>
                6)&nbsp;&nbsp;	Calendar of the Court minutes of the East India Company from 1635 to 1639 and 1655 to 1659.</br>
                7)&nbsp;&nbsp;	Old Directories, almanacs and calendars.</br>
                8)&nbsp;&nbsp;	Different report regarding famine, revenue administration, survey settlement report from the middle of the nineteenth century.</br>
                9)&nbsp;&nbsp;	Unpublished Divisional Commissioners Report comprehending all aspects of Bengal Districts.</br>
                10)&nbsp;&nbsp;	Report regarding early education in this country, especially of Bengal.</br>
                11)&nbsp;&nbsp;	Gazetteers handbooks, statistical accounts and reports of the different districts of Bengal and other provinces.</br>
                12)&nbsp;&nbsp;	Early printed history of India, specially of Bengal.</br>
                13)&nbsp;&nbsp;	Selections from Government records.</br>
                14)&nbsp;&nbsp;	Calcutta Gazette since 1814.(formerly Government Gazette, up to 1832).</br>
                15)&nbsp;&nbsp;	India Gazette since 1864 and other State Government Gazettes.</br>
                16)&nbsp;&nbsp;	Englishman from 1895-1911.</br>
                17)&nbsp;&nbsp;	The Statesman 1909-1915.</br>
                18)&nbsp;&nbsp;	Amrita Bazaar Patrika 1951-59 and 1966 to 1976.</br>
                19)&nbsp;&nbsp;	Jugantor 1946-71.</br>
                20)&nbsp;&nbsp;	Anandabazar Patrika 1946-47 and 1954-2014.</br>
            </div>
        </div>
    </body>
</html>
