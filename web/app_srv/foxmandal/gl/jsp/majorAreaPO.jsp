<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>


<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
     <LINK href="theme/Master.css" rel="stylesheet" type="text/css">   
 
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
      var strValues=window.opener.document.forms[0].majorArea.value;
      var enabledisable=document.rfm.flag.value;

      
      //var strValues=window.opener.document.forms[0].strStatusTxtval.value;
   
      var tArray=strValues.split(",");
      
     
      for(var yy=0;yy<document.rfm.majorAreaId.length;yy++) 
      {
    
          for(var iCount=0;iCount<tArray.length-1;iCount++) 
          {
            
               if(document.rfm.majorAreaId[yy].value==tArray[iCount])   
               {
                 if(enabledisable=="update")
                   {
                    document.rfm.majorAreaId[yy].checked=true;
                    document.rfm.majorAreaId[yy].disabled = true;
                   }
                   else {
                        document.rfm.majorAreaId[yy].checked=true;
                      }
               }
          }
      }
      makingcheckoldval() ;
  }
  
   function makingcheckoldval() 
  {
 
      var strValues=window.opener.document.forms[0].majorAreaold.value;
     
   
      var tArray=strValues.split(",");
     
     
      for(var yy=0;yy<document.rfm.majorAreaId.length;yy++) 
      {
    
          for(var iCount=0;iCount<tArray.length-1;iCount++) 
          {
            
               if(document.rfm.majorAreaId[yy].value==tArray[iCount])   
               {
                
                   document.rfm.majorAreaId[yy].checked=true;
                  
                  
               }
          }
      }
      
  }
  
  
  
 function functionClose1()
{
var concatenatedValue = "";
  var enflag=document.rfm.flag.value;
var x = "";
k=0;






       if(document.rfm.majorAreaId.length > 0)
          {
                  for(i =0;i<document.rfm.majorAreaId.length;i++)
                  {
                      if(document.rfm.majorAreaId[i].checked == true)
                      {
                          k=1;
                          if(document.rfm.majorAreaId[i].disabled!=true)
                              x = x+document.rfm.majorAreaId[i].value+",";
                      }       
                  }
          }
          else 
          {
                  if(document.rfm.majorAreaId.checked == true)
                      {
                          k=1;
                              x = x+document.rfm.majorAreaId.value+",";
                      } 
          }
          
         
         if(k==0) {
             alert("Select atleast one major discipline.");
             return false;
         }
         
  
                  var confirmation = confirm("Can we confirm your selection?");
                  if(confirmation == true)
                  {
                     
                    
                    //window.opener.document.forms[0] .strStatusTxtval.value=x;
                    if(enflag=='update')
                      { 
                        window.opener.document.forms[0].majorAreaold.value=x;
                      }
                      else
                       {
                     window.opener.document.forms[0].majorArea.value=x;
                       }
                     window.close();
                     
                    
                  }
                 else
                     return false;
  }
  
     
  
  
</script>
      
        
   <link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/paging.css">         
        
      <%
 





DBQueryManager _dbq = new DBQueryManager();
List arrlistmajorArea = new ArrayList();
List majorAreaId = new ArrayList();
String flag="";
String strQuery = "";
int iSize = 0;
int i = 0;
String selectedBroadArea= request.getParameter("broadAreaValue");
flag=request.getParameter("flag");



strQuery = "select NUM_DISCIPLINE_ID,STR_DESCRIPTION from TDC_BROAD_DISCIPLINE_DTL where NUM_THEMATIC_AREA_ID in("+selectedBroadArea+")";
arrlistmajorArea = _dbq.fetchData(strQuery);
if(arrlistmajorArea !=null)
iSize = arrlistmajorArea.size();













%>      
        
        
    </head>
    
    <body  onload="makingcheck();" background="images/background.jpg">
    <form name="rfm" method="post" action=""  >
    <span class="formheading">Major Discipline</span>
    <table class="data" id="tab1" width="70%">
     
     
     <tr > 
     <thead>
      <th width="8%">
        Select
          </th>
          <th>
            Major Area
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
                      <td width="5%" align="right" >
                        <input type="CHECKBOX" id="majorAreaId"  name="majorAreaId" value="<%=arrlistmajorArea.get(i).toString()%>">
                      </td>
                      <td width="70%" align="left" >
                        <%=arrlistmajorArea.get(i+1).toString()%>
                      </td>
                    </tr>
                  <%
                 
            }
           }
      %>
 
   
     
  </table>
  
 <div id="pageNavPosition"></div>

<script type="text/javascript"><!--
        var pager = new Pager('tab1', 10); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    //--></script>

</div>
<table align="center">
  <tr> 
        <td colspan="2" align="center" >
          <input type="button" class="generalButton" name="ADD" value="ADD" onclick="functionClose1()"/>
          
           <input type="hidden" name="flag"  value="<%=flag%>">
          
          
        </td>
      </tr>
  </table>
  </form>
  </body>
</html>