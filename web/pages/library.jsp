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
                    openEffect	: 'elastic',
                    closeEffect	: 'fade'
                });
            });
        </script>

    </head>
    <body>
        <div class="main" style="margin-left: 30px; margin-right: 30px;"> 
            <h2 style="font-weight: bold">
                Modernization and Development
            </h2> 
            <p align="justify">
                From 1961 till 2010 the Secretariat Library did not get much attention from the authority in regards to its development and modernization. However, in 2011, the Secretariat Library was upgraded with the installation of a Computer Lab. having LAN & Internet connectivity. Thereafter, the Secretariat Library under took a project for digitization & Lamination with the financial assistance of National Archives of India and the State Government. The project is completed and 3,000 books with 12,500 lakhs pages have successfully been digitized.
                </br></br>
                Now a new digitization project work including retrieval and portal system is started in the Secretarial Library by C-DAC, Kolkata. 15 million (Fifteen million) pages as part of almost 50,000 to 60,000 archival documents from the WBSL to be digitized. 
            </p>
            <h2 style="font-weight: bold">
                Users
            </h2> 
            <p align="justify">
                The reading and borrowing facilities are available to all the employees of Government of West Bengal.  Books may be borrowed by submitting the <a href="showRequisitionForm.action"><b>Requisition Form</b></a> to the Librarian. For others, only reading at the Library reading Hall, is available with prior permission/recommendation from the competent authority. Every user has to submit an <a href="showApplicationFormat.action"><b>Application Form</b></a> containing the detail particulars, to the Librarian. Research scholars and readers associated with different universities of India and abroad are frequent users of this library. This library owns some valuable books, documents & gazettes which are not available in other libraries of this country including the National Library. That is why the Secretariat Library often receives requisition of such documents from the higher officials of the State Government & Central Government & Judges Court Library & from the Library of Supreme Court of India.
            </p>
            <h2 style="font-weight: bold">
                Library Automation
            </h2>
            <p align="justify">
                The West Bengal Secretariat Library automation was partially started in the year 2009 by the technical employees of the library. A large numbers of books have already been computerized by the library by this time.Retro conversion/data entry will be started soon.
                </br></br>
                This Library is now using <b>Freeze Drier</b> for disinfecting the books of the library without chemical, and disinfects the books within 4 hrs by 20 degree temperature.
                This heritage library having a stock of more than 2 lakh of books has a great importance and scholars of the home and abroad. West Bengal Secretariat Library is going to celebrate its 150 years in 2017.
            </p>
            <h2 style="font-weight: bold; font-size: 14px; color: rgb(64,64,64);">
                Downloads
            </h2>
            <ul style="list-style-type:circle;">
                <li style="list-style-type:disc; padding-left: 5px; margin-left: 25px;"><a href="forms/Application Format for Books-WBSL.pdf" target="_blank"><b>Application Form</b></a></li>
                <li style="list-style-type:disc; padding-left: 5px; margin-left: 25px;"><a href="forms/Requisition Form.pdf" target="_blank"><b>Requisition Form</b></a></li>                 
            </ul>
            <!--<p>
                <a href="app/WBSL.apk"> <img border="0" alt="Android App" src="images/downloadAppAndroid.png" width="170"> </a>
            </p>-->
        </div>
    </body>
</html>
