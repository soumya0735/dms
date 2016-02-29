
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
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
  <script>
      $(document).ready(function () {
      $(function() {
      $('table').footable();
      });
       });
      </script>
<style type="text/css">
        
.pg-normal {
	color: #0000FF;
	font-weight: normal;
	text-decoration: none;
	cursor: pointer;
}

.pg-selected {
	color: #800080;
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
}
</style>

<script type="text/javascript">
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;
    
    this.showRecords = function(from, to) {        
        var rows = document.getElementById(tableName).rows;
       
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)  
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }
    
    this.showPage = function(pageNumber) {
     if (! this.inited) {
      alert("not inited");
      return;
     }

        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
        oldPageAnchor.className = 'pg-normal';
        
        this.currentPage = pageNumber;
        var newPageAnchor = document.getElementById('pg'+this.currentPage);
        newPageAnchor.className = 'pg-selected';
        
        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }   
    
    this.prev = function() {
        if (this.currentPage > 1)
            this.showPage(this.currentPage - 1);
    }
    
    this.next = function() {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    }                        
    
    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1); 
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function(pagerName, positionId) {
     if (! this.inited) {
      alert("not inited");
      return;
      }
    var element = document.getElementById(positionId);
     
     var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> &#171 Prev </span> | ';
        for (var  page = 1; page <=this.pages; page++ ) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> | ';
        pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next &#187;</span>';            
        
        element.innerHTML = pagerHtml;
    }
}
  </script>
  <script type="text/javascript">
  function makingcheck() 
  {
 
      var strValues=window.opener.document.forms[0].deg_val.value;
      
     
      var tArray=strValues.split(",");
      
     
      for(var yy=0;yy<document.rfm.degreeId.length;yy++) 
      {
    
          for(var iCount=0;iCount<tArray.length-1;iCount++) 
          {
            
               if(document.rfm.degreeId[yy].value==tArray[iCount])   
               {
                  
                  
                   document.rfm.degreeId[yy].checked=true;
               }
          }
      }
      
  }
 function functionClose1()
{
var concatenatedValue = "";
var x = "";
k=0;






       if(document.rfm.degreeId.length > 0)
          {
                  for(i =0;i<document.rfm.degreeId.length;i++)
                  {
                      if(document.rfm.degreeId[i].checked == true)
                      {
                          k=1;
                              x = x+document.rfm.degreeId[i].value+",";
                      }       
                  }
          }
          else 
          {
                  if(document.rfm.degreeId.checked == true)
                      {
                          k=1;
                              x = x+document.rfm.degreeId.value+",";
                      } 
          }
          
         
         if(k==0) {
             alert("Select atleast one degree.");
             return false;
         }
         
  
                  var confirmation = confirm("Can we confirm your selection?");
                  if(confirmation == true)
                  {
                    
                     window.opener.document.forms[0].deg_val.value=x;
                     window.close();
                     
                    
                  }
                 else
                     return false;
  }
  
     
  
  
</script>
      
        
   <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/paging.css">         
        
      <%
 





DBQueryManager _dbq = new DBQueryManager();
List arrlistdegree = new ArrayList();
List degreeId = new ArrayList();

String strQuery = "";
int iSize = 0;
int i = 0;



strQuery = "select NUM_DEGREE_ID,STR_DEGREE_NAME from TDC_DEGREE_MASTER  order by STR_DEGREE_NAME ";
arrlistdegree = _dbq.fetchData(strQuery);
if(arrlistdegree !=null)
iSize = arrlistdegree.size();
%>      
    </head>
    
    <body  onload="makingcheck();">
    <form name="rfm" method="post" action=""  >
    <div class="row padded">
    <fieldset>
    <div class="whole blue align-center">
    <h5>Degree</h5></div>
    <table class="footable blue" id="tab1">
     
     
     <tr > 
     <thead>
      <th>
        Select
          </th>
          <th>
            Degree
          </th>
          </thead>

      </tr>
      <%
           if(iSize>0)
           {
      
            for(i=0;i<iSize;i=i+2)
            {
             
                 
                  %>
                    <tr > 
                      <td>
                        <input type="CHECKBOX" id="degreeId"  name="degreeId" value="<%=arrlistdegree.get(i).toString()%>">
                      </td>
                      <td>
                        <%=arrlistdegree.get(i+1).toString()%>
                      </td>
                    </tr>
                  <%
                 
            }
           }
      %>
  <tfoot class="footable-pagination">
         <tr>
          <td colspan="2"><ul id="pagination" class="footable-nav"></ul>
          </td>
         </tr>
        </tfoot>
     
     
  </table>
  
 <!--<div id="pageNavPosition"></div>

<script type="text/javascript">
        var pager = new Pager('tab1', 10); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
  </script>  -->


<div class="whole pad-top align-center">
          <input type="button" class="generalButton" name="ADD" value="ADD" onclick="functionClose1()"/>
       </div>
  </fieldset>
  </div>
  </form>
  </body>
</html>