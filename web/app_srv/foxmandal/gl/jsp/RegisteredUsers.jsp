<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation,java.util.*,java.sql.*,in.cdacnoida.icmr.gl.adaptor.*"%>
    <%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
    <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>  
    <%@page import="org.apache.struts.Globals"%>
    <%@ page import="org.apache.struts.taglib.html.Constants"%>
    <%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
        <%@ page import="in.cdacnoida.icmr.gl.adaptor.DataEncoder" %>
    <%@ page import="java.io.File" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat,java.text.SimpleDateFormat,java.text.ParseException,java.util.TimeZone" %>

        <script src="/ICMR/app_srv/icmr/gl/jssrc/jquery.easyui.js" language="JavaScript" type="text/javascript"></script>
        <script src="/ICMR/app_srv/icmr/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>
        
        <script src="/ICMR/app_srv/icmr/gl/js/libs/jquery-ui.js"></script>  
       
        <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/css/validateBox.css"></link>
        <link rel="stylesheet" href="/ICMR/app_srv/icmr/gl/css/jquery-ui.css" />

<STYLE type="text/css">
	/*body { margin:30px; }*/
  </STYLE> 
  
  
              <%
                String strStatus="";
                if(request.getAttribute("status")!=null)
                    strStatus=request.getAttribute("status").toString();                    
                if(!strStatus.equals(""))
                {%>
                  <script type="text/javascript" language="javscript">alert("<%=strStatus%>");location.href="/ICMR/pcToReferee.do";</script>
                <%}%>

  
  
<SCRIPT type="text/javascript">

/*attempt to get previously selected  values */
function loadPreviousSelectedUsers()
{
var listOfSelectedUsers="";
//alert (listOfSelectedUsers);
}





     $(function() {
      $('table').footable();
	    $('.clear-filter').click(function(e) {
		    e.preventDefault();
			$('#filter').val($(this).text());
            	    $('table').trigger('footable_clear_filter');
	    });
            $('#clearLink').click(function (e) {
                            $('#filter').val("");
                            $('#bvg_m').val("All");                           
            });
            $('#myTab a').click(function (e) {
			e.preventDefault();
			$(this).tab('show');
		}).on('shown', function (e) {	
			$('.tab-pane.active table').trigger('footable_resize');
            });
            $('.do-filter').change(function(e) {
			e.preventDefault();
                        $('#filter').val("");
			$('#filter').val($(this).find('option:selected').text());
                        if($('#filter').val()!="All")  
                        {
                            
                            $('table').trigger('footable_filter', {filter : $(this).find('option:selected').text()} );
                            
                        }
                        else
                        {
                            
                             $('table').trigger('footable_filter', '');
                        }
		});
    });
  </SCRIPT>


<!-- end footable -->




<%
response.setHeader("expires","0");
response.setHeader("expires","now");
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",-1);
%>

<%
DBQueryManager  _dbq= new DBQueryManager();
DataEncoder dataEncoder = new DataEncoder();  //used for encoding userid
String decodedUserId="";
%>

</head>
<body onload="loadPreviousSelectedUsers();">

<form name="frm" method="POST" >
  
   

<div align="right" >
          
            Search:&nbsp;<INPUT id="filter" type="text" style="height: 30px;" />     <!--This LOC will enable the search functionality -->
   
   <DIV class="tab-pane active" id="link1"> 
        <table class="footable blue" data-filter="#filter" data-page-navigation="#pagination1" data-page-size="5"> <!-- inside footable.paginatte.css -->
            <thead><tr>
            <th data-hide="phone,tablet">Name</th>
            <th data-hide="phone,tablet">UserName </th> 
                <th data-hide="phone,tablet">password</th>
                <th data-hide="phone,tablet">Email</th>
               
                                
            </tr> </thead>
            <tbody>
            <%
            
             try
                 {
                 ArrayList arrayListUsers=new ArrayList();
               
               String qryUsers="select str_user_id,str_password,str_e_mail,get_user_name(str_user_id) from tdc_user_registration";
               
               
                System.out.println("\n qryUsers \n"+qryUsers+"\n");
                arrayListUsers=_dbq.fetchData(qryUsers);
                %>
            <%if(arrayListUsers.size()>0){
            int iCount=1;
            int size=arrayListUsers.size();
            System.out.println("size="+size);
                for(int i=0;i<size;i+=4){
            %>
            <tr>
                <td><%=arrayListUsers.get(i+3).toString()%></td>
                  <td><%=arrayListUsers.get(i).toString()%></td>
                
                <td>
                <%
                
                decodedUserId=dataEncoder.decode(arrayListUsers.get(i+1).toString());
               // System.out.println("the decoded password is :"+ decodedUserId);
                 %>
                <label class="hyplinks"><%=decodedUserId%></label>
               
               </td>   
               <td><%=arrayListUsers.get(i+2).toString()%></td>
               
            </tr>
            <%iCount=iCount+1;
               } //end of for loop
            } else { //end of if loop
            %>
            <tr>
            
            </tr>
            <%} //end of else
            }catch(Exception e){}%>
            </tbody>
           
            </table> 
                </div>
                
                
     
              
        
                </div>
                

</form>

<div class="align-center">
                            <input type="button"  class="blue gap-right" value=<bean:message key='pcToReferee.table.head.submitButton'></bean:message> onclick="save();"></button>
                            <input type="button"  class="blue gap-right" value=<bean:message key='reg.ref.reset'></bean:message> onclick="reset();"></button>
                            </div>
</body>

</html> 
