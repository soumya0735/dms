

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<html>
   <head>
      <script type="text/javascript"
              src="/ICMR/app_srv/icmr/gl/jscss/js/libs/jquery-1.9.1.min.js"></script>
      <link rel="stylesheet" type="text/css"
            href="/ICMR/app_srv/icmr/gl/jscss/home.css"></link>
      <script type="text/javascript"
              src="/ICMR/app_srv/icmr/gl/jscss/jquery.easyui.js"></script>
      <!--for footable
  -->
      <link href="/ICMR/app_srv/icmr/gl/jscss/footable/css/footable-0.1.css"
            rel="stylesheet" type="text/css"/>
      <link href="/ICMR/app_srv/icmr/gl/jscss/footable/css/footable.sortable-0.1.css"
            rel="stylesheet" type="text/css"/>
      <link href="/ICMR/app_srv/icmr/gl/jscss/footable/css/footable.paginate.css"
            rel="stylesheet" type="text/css"/>
      <script src="/ICMR/app_srv/icmr/gl/jscss/footable/js/footable.js"
              type="text/javascript"></script>
      <script src="/ICMR/app_srv/icmr/gl/jscss/footable/js/footable.filter.js"
              type="text/javascript"></script>
      <script src="/ICMR/app_srv/icmr/gl/jscss/footable/js/footable.paginate.js"
              type="text/javascript"></script>
      <script src="/ICMR/app_srv/icmr/gl/jscss/footable/js/footable.sortable.js"
              type="text/javascript"></script>
      <!-- ends here -->
      <script>
      $(document).ready(function () {
      $(function() {
      $('table').footable();
      });
       });
      </script>
      <script type="text/javascript">
        function makingcheck() {

            var strValues = window.opener.document.forms[0].broadArea.value;

            var tArray = strValues.split(",");

            for (var yy = 0;yy < document.rfm.broadAreaId.length;yy++) {

                for (var iCount = 0;iCount < tArray.length - 1;iCount++) {

                    if (document.rfm.broadAreaId[yy].value == tArray[iCount]) {
                        document.rfm.broadAreaId[yy].checked = true;
                    }
                }
            }

        }

        function functionClose1() {
            var x = "";
            k = 0;

            if (document.rfm.broadAreaId.length > 0) {
                for (i = 0;i < document.rfm.broadAreaId.length;i++) {
                    if (document.rfm.broadAreaId[i].checked == true) {
                        k = 1;
                        x = x + document.rfm.broadAreaId[i].value + ",";
                        //alert(x);
                    }
                }
            }
            else {
                if (document.rfm.broadAreaId.checked == true) {
                    k = 1;
                    x = x + document.rfm.broadAreaId.value + ",";
                    //alert(x+"in else block");
                }
            }

            if (k == 0) {
                alert("Select atleast one area.");
                return false;
            }

            var confirmation = confirm("Can we confirm your selection?");
            if (confirmation == true) {
                //alert(x);
                window.opener.document.forms[0].broadArea.value = x;
                window.close();
            }
            else 
                return false;
        }
      </script>
      <%
DBQueryManager _dbq = new DBQueryManager();
List arrlistBroadArea = new ArrayList();
List broadAreaId = new ArrayList();

String strQuery = "";
int iSize = 0;
int i = 0;


strQuery = "select NUM_THEMATIC_AREA_ID,STR_THEMATIC_AREA_NAME from TDC_THEMATIC_AREA_MASTER order by STR_THEMATIC_AREA_NAME  ";
arrlistBroadArea = _dbq.fetchData(strQuery);
if(arrlistBroadArea !=null)
iSize = arrlistBroadArea.size();
%>
   </head>
   <body onload="makingcheck();">
      <form name="rfm" method="post" action="">
         <div class="row padded">
           <fieldset>
            <div class="whole blue align-center">
               <h5>Broad Area</h5>
            </div>
          
               <table class="footable blue" id="tab1">
                  <thead>
                     <tr>
                        <th>Select</th>
                        <th>Broad Area</th>
                     </tr>
                  </thead>
                   
                  <%
           if(iSize>0)
           {
      
            for(i=0;i<iSize;i=i+2)
            {
             
                 
                  %>
                   
                  <tr>
                     <td class="middle">
                        <input type="CHECKBOX" id="broadAreaId"
                               name="broadAreaId"
                               value="<%=arrlistBroadArea.get(i).toString()%>"></input>
                     </td>
                     <td>
                        <%=arrlistBroadArea.get(i+1).toString()%>
                     </td>
                  </tr>
                   
                  <%
                 
            }
           }
      %>
               </table>
               <script type="text/javascript" charset="utf-8">
                 $(document).ready(function () {
                     $('#tab1').dataTable();
                 });
               </script>
               <div class="whole align-center pad-top">
                  <input type="button" class="generalButton" name="ADD"
                         value="ADD" onclick="functionClose1()"/>
               </div>
            </fieldset>
         </div>
      </form>
   </body>
</html>