<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib  prefix="sx" uri="/struts-dojo-tags" %>
<%@taglib  prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>        
        <link href="<%=request.getContextPath()%>/resources/archive.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/resources/action-message.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/utils.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/datetimepicker.js" language="JavaScript"></script>
        <!--<script language="JavaScript" type="text/javascript">
            function checkState()
            {
                var financialYear = $F("financialYear");
                if (financialYear == "")
                {
                    alert("Choose Financial Year!");
                    document.getElementById("financialYear").focus();
                }
            }
            function currentDate() {
                Stamp = new Date();
                year = Stamp.getYear();
                if (year < 2000)
                    year = 1900 + year;
                document.write('<font size="2" face="Arial"><B>' + (Stamp.getMonth() + 1) + "/" + Stamp.getDate() + "/" + year + '</B></font><BR>');
                alert(Stamp.getMonth());
            }

            function showHideDiv(div, elementId) {

                //alert(elementId);	
                if (elementId == 'R') {
                    //alert("Hi");
                    document.forms[0].minutesFile.disabled = false;
                } else {
                    document.forms[0].minutesFile.disabled = true;
                }
            }
        </script>-->
        <script language="JavaScript" type="text/javascript">
            function validateForm()
            {                
                var bookheadno = document.getElementById("bookheadno").value;
                alert("Hello! I am an alert box!!");
                if (bookheadno == "") {
                    alert("Give the Book Head Number !!");
                    return false;
                }
                /*var date1 = document.getElementById("date1").value;
        if (date1 == "") {
            alert("Give today's date !!");
            return false;
        }*/

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
                    alert("Enter at least one Keyword !!");
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
            
        </script>  
        <sj:head/>
    </head>
    <body>
        <s:form action="updateMetadata" method="post" id="metaDataUpdateForm" enctype="multipart/form-data" onsubmit="return validateForm();" theme="simple">                                        
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
                <table id="metadata_table" cellpadding="0" align="left" width="99%"> 
                    <caption style="color: #990000; font-weight: bold">Please provide the following values</caption>

                    <tbody id="body" style="font-weight: bold; font-family:verdana; text-align: left;">
                        <tr>	
                            <td colspan="4" >Type of Material<FONT color=#ff0000>*</FONT> &nbsp;

                                <select name="materialType">
                                    <option value="book">Book</option>                            
                                </select>                 
                                &nbsp;&nbsp;Book Head Number<FONT color=#ff0000>*</FONT>&nbsp;
                                <s:textfield name="bookheadno"  size="40"/> &nbsp;
                                Language <FONT color=#ff0000>*</FONT>&nbsp;                                
                                <s:select name="language" id="language" list="%{languageList}" listKey="listId" listValue="listString" />  
                            </td>    
                        </tr>
                        <tr>
                            <!--<td colspan="4" >Language <FONT color=#ff0000>*</FONT>                                
                            <s:select name="language" id="language" list="%{languageList}" listKey="listId" listValue="listString" />  -->

                            <!--Date<FONT color=#ff0000>*</FONT> 
                            <sj:datepicker name="date1"  displayFormat="yy-mm-dd"/>                                                  
                            <font color="red" size="1">(YYYY-MM-DD)</font>-->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="15"><hr></td>
                        </tr>
                        <tr>
                            <td colspan="2" >Title</td>
                            <td><s:textfield name="title"  size="40"/>
                                <FONT color=#ff0000>*</FONT> &nbsp;                    
                            </td>    
                            <td><s:textfield name="title1"   size="40"/>
                            </td>    
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="title2"   size="40"/>                                   
                            </td>    
                            <td>
                                <s:textfield name="title3"   size="40"/>
                            </td>    
                        </tr>
                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="2" >File Name<FONT color=#ff0000>*</FONT></td>
                            <td><s:textfield name="filename"  size="60"/></td>
                        </tr>
                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="2" >Creator</td>
                            <td><s:textfield name="creator" styleId="creator"   size="40"/><FONT color=#ff0000>*</FONT> &nbsp;                    
                            </td>
                            <td><s:textfield name="creator1"   size="40"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="creator2"   size="40"/> &nbsp;</td>    
                            <td><s:textfield name="creator3"   size="40"/></td>    
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="creator4"   size="40"/> &nbsp;</td>    
                            <td><s:textfield name="creator5"   size="40"/></td>    
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="creator6"   size="40"/> &nbsp;</td>    
                            <td><s:textfield name="creator7"   size="40"/></td>    
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="creator8"   size="40"/> &nbsp;</td>    
                            <td><s:textfield name="creator9"   size="40"/></td>    
                        </tr>


                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="2" >Keywords</td>
                            <td><s:textfield name="keywords" size="40"/><FONT color=#ff0000>*</FONT> &nbsp;                    
                            </td>
                            <td><s:textfield name="keywords1"   size="40"/></td>                            
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="keywords2"   size="40"/> &nbsp;</td>    
                            <td><s:textfield name="keywords3"   size="40"/></td>    
                        </tr>
                        <tr>
                            <td colspan="2" ></td>
                            <td><s:textfield name="keywords4"   size="40"/> &nbsp;</td>    
                        </tr>

                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="2" >Description<FONT color=#ff0000>*</FONT></td>
                            <td><s:textfield name="description"  size="60"/></td>
                        </tr>
                        <tr>	
                            <td colspan="2" >Subject <FONT color=#ff0000>*</FONT></td>
                            <td>
                                <s:select name="subject" id="subject" list="%{subjectList}" listKey="listId" listValue="listString" />     
                            </td>
                            <td colspan="2" >
                                <s:select name="subject1" id="subject" list="%{subjectList1}" listKey="listId" listValue="listString" />     
                            </td>
                        </tr>

                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="2" >Publisher</td>
                            <td><s:textfield name="publisher"    size="60"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" >Contributor</td>
                            <td><s:textfield name="contributor"    size="40"/> 
                            </td>
                            <td><s:textfield name="contributor1"    size="40"/></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>



                        <tr><td colspan="10"><hr></td></tr>

                        <tr><td  rowspan="0" colspan="1" >&nbsp;</td><td>+Physical</td><td>++Content</td></tr>
                        <tr><td colspan="1"  >Document Type</td>
                            <td>
                                <s:hidden name="bookid"></s:hidden>
                                <s:select name="documentType1" id="documentType1" list="%{documentType1List}" listKey="listId" listValue="listString" /> <FONT color=#ff0000>*</FONT>&nbsp;+ &nbsp;

                            </td>
                            <td>
                                <s:select name="documentType2" id="documentType2" list="%{documentType2List}" listKey="listId" listValue="listString" /> 
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr><td colspan="1" >Format</td>
                            <td><s:textfield name="format" id="format"   size="40"/>
                            </td>
                        </tr>
                        <tr><td colspan="1" >Identifier</td>
                            <td><s:textfield name="identifier"   size="40"/>
                            </td>
                        </tr>
                        <tr><td colspan="1" >DVD No.</td>
                            <td><s:textfield name="disk_name"   size="40"/>
                            </td>
                        </tr>
                        <tr><td colspan="1" >Site Name</td>
                            <td>
                                <s:select name="site_id" id="site_id" list="%{sites}" listKey="site_id" listValue="site_name" />                                 
                            </td>
                        </tr>

                        <tr><td colspan="10"><hr></td></tr>
                        <tr>	
                            <td colspan="1"  align="left">Source<FONT color=#ff0000>*</FONT>
                            </td>
                            <td colspan="1"  align="left">
                                <s:textfield name="source"  size="40"/>     
                            </td>				
                        </tr>

                        <tr><td colspan="10"><hr></td></tr>
                        <tr><td colspan="1" >Relation</td>
                            <td><s:textfield name="relation"   size="40"/>&nbsp;                    
                            </td>
                            <td class="bluetext" colspan="1">
                                <!--(Relationship of this resource. Eg. [Is a textual version of an audio] [Is Part Of: is contained in another resource])-->
                            </td>    
                        </tr>
                        <tr><td colspan="1" >Coverage</td>
                            <td><s:textfield name="coverage"   size="40"/> &nbsp;                    
                            </td>
                        </tr>
                        <tr>	
                            <td colspan="1" >Rights</td><td>
                                <s:select name="rights" id="rights" list="%{rightsList}" listKey="listId" listValue="listString" /> <FONT color=#ff0000>*</FONT>      
                            </td>				
                        </tr>
                        <tr><td colspan="1"  align='left'>Copy Right Date &nbsp;</td>
                            <td colspan="1" align='left' >
                                <sj:datepicker  name="copyrightDate" displayFormat="yy-mm-dd"/><FONT color=#ff0000>*</FONT>                                
                                <font color="red" size="1">(YYYY-MM-DD)</font></td>
                            <td colspan='1'>&nbsp;</td>
                        </tr>

                        <tr>	
                            <td colspan="1"  align="left">Scanning Center</td>                            
                            <td colspan="1" align="left"><s:textfield name="scanningCentre" value="C-DAC, KOLKATA"/> </td>
                    <FONT color=#ff0000>*</FONT>      
                    </td>				
                    </tr>
                    <tr><td colspan="1" >Scanner Number
                        </td><td colspan="1"  align="left"><s:textfield name="scanningNumber"   size="30"/> &nbsp;
                        </td></tr>

                    <!--<tr><td colspan="1"  align="left">Digital Publisher
                        </td><td colspan="1"  align="left">
                    <s:textfield name="digitalPublisher"  size="40"/><FONT color=#ff0000>*</FONT> &nbsp;</td></tr>-->

                    <tr><td colspan="1"  align="left">Digital Publication Date</td>
                        <td colspan="1"  align="left">
                            <sj:datepicker name="digitalPublicationDate" displayFormat="yy-mm-dd"/><FONT color=#ff0000>*</FONT>                                
                            <font color="red" size="1">(YYYY-MM-DD)</font> &nbsp;</td>
                    </tr>

                    <tr><td colspan="1"  align="left">Pages</td>
                        <td colspan="1"  align="left">
                            <s:textfield name="pages"  size="10"/>
                            <FONT color=#ff0000>*</FONT> &nbsp;</td>    
                    </tr>

                    <tr><td colspan="10" noshasdow size="2"><hr></td></tr>
                    <tr>
                        <td colspan="12" align="center">
                            <s:submit name="submit" value="Update"></s:submit>							
                            </td>	
                        </tr>
                        <tr><td colspan="10" noshasdow><hr></td></tr>                
                        </tbody>

                    </table>                
                </div>       
        </s:form>
    </body>
</html>
