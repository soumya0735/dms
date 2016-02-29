
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib  prefix="sj" uri="/struts-jquery-tags" %>
<%@taglib  prefix="sx" uri="/struts-dojo-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css" type="text/css" />
        <link rel="stylesheet" media="screen" type="text/css" href="<%=request.getContextPath()%>/css/layout.css" />                
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/datepicker.js"></script>    
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/utils.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/datetimepicker.js" language="JavaScript"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/eye.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/utils.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/layout.js?ver=1.0.2"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            $(function() {
                $( "#digitalPublicationDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "yy-mm-dd",
                    yearRange: "2000:2100"
                });
                $( "#copyrightDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "yy-mm-dd",
                    yearRange: "1700:2100"
                });
            });
        </script>

        <script language="JavaScript" type="text/javascript">
            function validateForm()
            {
                var bookheadno = document.getElementsByName("bookheadno")[0].value;
                if (bookheadno === "") {
                    alert("Give the Book Head Number !!");
                    return false;
                }
                /*var date1 = document.getElementsByName("date1")[0].value;
                if (date1 === "") {
                    alert("Give date !!");
                    return false;
                }*/

                var title = document.getElementsByName("title")[0].value;
                if (title === "") {
                    alert("Enter title !!");
                    return false;
                }
                var title = document.getElementsByName("filename")[0].value;
                if (title === "") {
                    alert("Enter File Name !!");
                    return false;
                }

                var creator = document.getElementsByName("creator")[0].value;
                if (creator === "") {
                    alert("Enter creator !!");
                    return false;
                }

                var keywords = document.getElementById("keywords").value;
                if (keywords === "" || keywords === null) {
                    alert("Enter at least one Keyword !!");
                    return false;
                }

                var description = document.getElementById("description").value;
                if (description == "") {
                    alert("Enter the Description !!");
                    return false;
                }

                var copyrightDate = document.getElementsByName("copyrightDate")[0].value;
                if (copyrightDate == "") {
                    alert("Give Copyright Date !!");
                    return false;
                }
                
                var digitalPublicationDate = document.getElementsByName("digitalPublicationDate")[0].value;
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
        </script>  
        <script type="text/javascript" src="/eArchive/struts/js/base/jquery.ui.core.min.js?s2j=3.5.1"></script>
        <script type="text/javascript" src="/eArchive/struts/js/plugins/jquery.subscribe.min.js"></script>       
        <script type="text/javascript" src="/eArchive/struts/js/struts2/jquery.struts2.min.js?s2j=3.5.1"></script>   
        <script type="text/javascript">
            $(function() {
                jQuery.struts2_jquery.version = "3.5.1";
                jQuery.scriptPath = "/eArchive/struts/";
                jQuery.ajaxSettings.traditional = true;
                jQuery.ajaxSetup({
                    cache: false
                });

                jQuery.struts2_jquery.require("js/struts2/jquery.ui.struts2.min.js");

            });

        </script>
        <link id="jquery_theme_link" rel="stylesheet" href="/eArchive/struts/themes/smoothness/jquery-ui.css?s2j=3.5.1" type="text/css"/>        
    </head>
    <body>
        <br/>
        <s:form action="/metaDateInsert" method="post" id="metaDataInsertForm" enctype="multipart/form-data" onsubmit="return validateForm();" theme="simple">                                        
            <s:if test="hasActionMessages()" >
                <div class="welcome">
                    <s:actionmessage theme="simple"/>
                </div>                    
            </s:if>
            <s:if test="hasActionErrors()" >
                <div class="errors">
                    <s:actionerror theme="simple"/>
                </div>
            </s:if>

            <div id="form_div">  
                <table id="form_table" cellpadding="0" border="1" align="center" width="96%">
                    <caption style="color: #990000;font-weight: bold; font-size: 18px;">Please provide the following values</caption>
                    <tbody id="body" style="font-weight: bold;font-family:verdana; text-align: left"> 
                        <tr>
                            <td>Type of Material<FONT color=#ff0000>*</FONT> </td>
                            <td>
                                <select name="materialType" id="materialType">
                                    <option value="Book" selected>Book</option>                             
                                </select> 
                            </td>
                            <td>
                                Book Head Number<FONT color=#ff0000>*</FONT>                        
                            </td>
                            <td>
                                <s:textfield name="bookheadno" value="" size="14"/> 
                            </td>
                            <td colspan="2">
                                Language <FONT color=#ff0000>*</FONT>
                            </td>
                            <td>
                                <s:select name="language" id="language" list="languageList" listKey="listId" listValue="listString"/>
                            </td>

                        </tr> 
                        <tr>
                            <td colspan="8" height="30" align="left">
                                Title<FONT color=#ff0000>*</FONT>
                            </td>                            
                        </tr>
                        <tr>
                            <td colspan="2" height="30"  >
                                <s:textfield name="title" value="" size="30"/>
                            </td>
                            <td colspan="2" >
                                <s:textfield name="title1" value="" size="30"/>
                            </td>
                            <td colspan="2" >
                                <s:textfield name="title2" value="" size="30"/>
                            </td>
                            <td colspan="2">
                                <s:textfield name="title3" value="" size="30"/>
                            </td>  
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td height="30" align="left">File Name<FONT color=#ff0000>*</FONT></td>
                            <td colspan="6" align="left"><s:textfield name="filename" value="" size="110"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="left" colspan="8">Creator<FONT color=#ff0000>*</FONT></td>
                        </tr>
                        <tr>
                            <td colspan="2" height="30"><s:textfield name="creator" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="creator1" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="creator2" value="" size="30"/></td>    
                            <td colspan="2"><s:textfield name="creator3" value="" size="30"/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>

                            <td colspan="2" height="30"><s:textfield name="creator4" value="" size="30"/></td>    
                            <td colspan="2"><s:textfield name="creator5" value="" size="30"/></td>   
                            <td colspan="2"><s:textfield name="creator6" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="creator7" value="" size="30"/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>

                            <td colspan="2" height="30" align="left"><s:textfield name="creator8" value="" size="30"/></td>    
                            <td colspan="6" align="left"><s:textfield name="creator9" value="" size="30"/></td>  

                        </tr>
                        <tr>
                            <td  colspan="8" height="30" align="left">
                                Keywords<FONT color=#ff0000>*</FONT> 
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" height="30"><s:textfield name="keywords" id="keywords" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="keywords1" id="keywords1" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="keywords2" id="keywords2" value="" size="30"/></td>
                            <td colspan="2"><s:textfield name="keywords3"  id="keywords3" value="" size="30"/></td>  

                        </tr>
                        <tr>

                            <td colspan="2" height="30"><s:textfield name="keywords4" id="keyword4" value="" size="30"/> </td>    
                            <td colspan="2"><s:textfield name="keywords5" id="keywords5" value="" size="30"/></td>
                            <td colspan="4"></td>

                        </tr>
                        <tr>
                            <td height="30" align="left">
                                Description<FONT color=#ff0000>*</FONT>
                            </td>
                            <td colspan="7" height="30" align="left">
                                <s:textfield name="description" id="description" value="" size="50"/>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="left">Subject <FONT color=#ff0000>*</FONT></td>
                            <td colspan="2">
                                <s:select name="subject" id="subject" list="subjectList" listKey="listId" listValue="listString"/>     
                            </td>
                            <td colspan="4">
                                <s:select name="subject1" id="subject1" list="subjectList1" listKey="listId" listValue="listString"/>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="left">Publisher</td>
                            <td colspan="7" align="left"><s:textfield name="publisher" value="" size="50"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" height="30" align="left">
                                Contributor
                            </td>                        
                            <td colspan="3"><s:textfield name="contributor" value="" size="40"/></td>
                            <td colspan="3"><s:textfield name="contributor1" value="" size="40"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" height="30" align="left">
                                Document Type: 
                            </td>                        
                            <td colspan="3" height="30" align="left">
                                Physical:
                                <s:select name="documentType1" id="documentType1" list="documentType1List" listKey="listId" listValue="listString"/> 
                                <FONT color=#ff0000>*</FONT>&nbsp;
                            </td>
                            <td colspan="3" align="left">
                                Content:
                                <s:select name="documentType2" id="documentType2" list="documentType2List" listKey="listId" listValue="listString"/> 
                            </td>                            
                        </tr>
                        <tr>
                            <td height="30" align="left">
                                Format
                            </td>
                            <td colspan="3">
                                <s:textfield name="format" value="Tagged Image File Format" size="40"/>
                            </td>
                            <td>
                                Identifier
                            </td>
                            <td colspan="3">
                                <s:textfield name="identifier" value="" size="40"/> 
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="left">
                                DVD No.
                            </td>
                            <td colspan="2">
                                <s:textfield name="disk_name" value="WBSL-CDAC-" size="30"/>
                            </td>
                            <td>
                                Site Name
                            </td>
                            <td colspan="2">
                                <s:select name="site_id"  id="site_id" list="sites"  listKey="site_id" listValue="site_name"/>                        
                            </td> 
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td height="30" align="left">
                                Source<FONT color=#ff0000>*</FONT>
                            </td>
                            <td colspan="3" align="left">
                                <s:textfield name="source" value="WEST BENGAL SECRETARIAT LIBRARY, KOLKATA" size="52"/>                        
                            </td> 
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td height="30" align="left">                         
                                Relation                    
                            </td>
                            <td colspan="7" align="left">
                                <s:textfield name="relation" value="" size="40"/> <br/>                        
                                <!--(Relationship of this resource. Eg. [Is a textual version of an audio] [Is Part Of: is contained in another resource])-->
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="left">
                                Coverage
                            </td>
                            <td colspan="3">
                                <s:textfield name="coverage" value="" size="40"/>
                            </td>
                            <td>
                                Rights<FONT color=#ff0000>*</FONT>
                            </td>
                            <td colspan="3">
                                <s:select name="rights" id="rights" list="rightsList" listKey="listId" listValue="listString"/>     
                            </td>
                        </tr>
                        <tr>
                            <td align="left" height="30">Copyright Date<FONT color=#ff0000>*</FONT></td>
                            <td colspan="7"><s:textfield  name="copyrightDate" id="copyrightDate" onfocus="this.value=''"/><font color="red" size="1">(YYYY-MM-DD)</font></td>
                        </tr>
                        <tr>
                            <td height="30" align="left">Scanning Center<FONT color=#ff0000>*</FONT></td>
                            <td colspan="2"><s:textfield name="scanningCentre" value="C-DAC Kolkata"/> </td>
                            <td>Scanner Number</td>
                            <td colspan="2"><s:textfield name="scanningNumber" value="" size="20"/></td>
                            <td colspan="2"></td>

                        </tr>
                        <tr>
                            <td height="30" align="left">Digital Publisher<FONT color=#ff0000>*</FONT></td>
                            <td colspan="3">
                                <s:textfield name="digitalPublisher" value="West Bengal Secretariat Library, Govt. of West Bengal" size="52"/>
                            </td>
                            <td>Digital Publication Date <FONT color=#ff0000>*</FONT></td>
                            <td colspan="3"><s:textfield name="digitalPublicationDate" id="digitalPublicationDate" onfocus="this.value=''"/><font color="red" size="1">(YYYY-MM-DD)</font></td>                            
                        </tr>
                        <tr>
                            <td height="30" align="left">Pages<FONT color=#ff0000>*</FONT> &nbsp;</td>
                            <td colspan="7" align="left"><s:textfield name="pages"  id="pages" value="" size="10"/></td>
                        </tr>
                        <tr>
                            <td colspan="8" align="center">
                                <s:submit name="submit"></s:submit>							
                            </td>	
                        </tr>
                    </tbody>
                </table>                
            </div>       
        </s:form>
    </body>
</html>