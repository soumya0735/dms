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
      <!-- ends here -->
    
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
<%
DBQueryManager _dbq = new DBQueryManager();
List arrlistmajorArea = new ArrayList();
List majorAreaId = new ArrayList();
String strQuery = "";
int iSize = 0;
int i = 0;
String selectedBroadArea= "";
if(request.getParameter("broadAreaValue")!=null)
selectedBroadArea=request.getParameter("broadAreaValue");
int index=0;

if(selectedBroadArea.equals("X"))
{
strQuery = "select bd.NUM_DISCIPLINE_ID,bd.STR_DESCRIPTION,STR_THEMATIC_AREA_NAME from TDC_BROAD_DISCIPLINE_DTL bd,TDC_THEMATIC_AREA_MASTER thm where bd.NUM_THEMATIC_AREA_ID=thm.NUM_THEMATIC_AREA_ID order by STR_THEMATIC_AREA_NAME,bd.STR_DESCRIPTION";
}
else
{
index=selectedBroadArea.lastIndexOf(",");
selectedBroadArea=selectedBroadArea.substring(0,index);
strQuery = "select bd.NUM_DISCIPLINE_ID,bd.STR_DESCRIPTION,STR_THEMATIC_AREA_NAME,bd.NUM_THEMATIC_AREA_ID from TDC_BROAD_DISCIPLINE_DTL bd,TDC_THEMATIC_AREA_MASTER thm where bd.NUM_THEMATIC_AREA_ID=thm.NUM_THEMATIC_AREA_ID and bd.NUM_THEMATIC_AREA_ID in ("+selectedBroadArea+") order by STR_THEMATIC_AREA_NAME,bd.STR_DESCRIPTION";
}
System.out.println("query is..."+strQuery+"selectedBroadArea"+selectedBroadArea);
arrlistmajorArea = _dbq.fetchData(strQuery);
if(arrlistmajorArea !=null)
iSize = arrlistmajorArea.size();
%>
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
  function makingcheck() 
  {
      var strValues=window.opener.document.forms[0].majorArea.value;
      var tArray=strValues.split(",");
     //alert("hi "+document.rfm.majorAreaId.length);
        
          for(var yy=0;yy<document.rfm.majorAreaId.length;yy++) 
          {
              for(var iCount=0;iCount<tArray.length-1;iCount++) 
                   {
                       var majArray=document.rfm.majorAreaId[yy].value.split(",");
                       if(majArray[0]==tArray[iCount])   
                           document.rfm.majorAreaId[yy].checked=true;
                   }
          }         
    }
  //var majorDiscIds=window.opener.document.forms[0].majorArea.value;
     
       /* function checkMajorDisp(theField)
        {
         var broadArea=document.rfm.brAr.value;
        //alert("out="+broadArea);
        maj_disp=theField.value.split(",");
       // for(var i=0;i<maj_disp.length;i++){
         //   alert(maj_disp[i]);
        //}
        
            if(theField.checked==true)    
            {
               majorDiscIds=majorDiscIds+maj_disp[0]+",";
               broadArea=broadArea+maj_disp[1]+",";
               //alert("in="+maj_disp[1]);
               document.rfm.brAr.value=broadArea;
            }
            else{
                majorDiscIds=majorDiscIds.replace(maj_disp[0]+",","");
            }
            //alert(majorDiscIds);
            //alert(majorDiscNames);
            //document.getElementById("majName").innerHTML='<p class="generaltext"  ><b>'+majorDiscNames+'</b></p>';
            document.forms[0].strMajorDiscipline.value=majorDiscIds;
            
        }*/
  function unique (arr) {
    var hash = {}, result = [];
    for (var i = 0; i < arr.length; i++)
    	if (!(arr[i] in hash)) { //it works with objects! in FF, at least
    		hash[arr[i]] = true;
    		result.push(arr[i]);
    	}
        
    return result.sort();
}
        
function functionClose1()
{
var x = "";
var bb="";
k=0;

       if(document.rfm.majorAreaId.length >0)
          {
                  for(i=0;i<document.rfm.majorAreaId.length;i++)
                  {
                      if(document.rfm.majorAreaId[i].checked == true)
                      {
                        k=1;
                        alpha=document.rfm.majorAreaId[i].value.split(",");;
                        x = x+alpha[0]+",";
                        bb = bb+alpha[1]+",";
                       
                      }       
                  }
                  // alert(x);
                  // alert(bb);
          }
          
         
         if(k==0) {
             alert("Select atleast one major Discipline.");
             return false;
         }

//compare the broad areas from the url and in the brar hidden field if mismatch then show 
//alert stating that you have to select major disciplines from both the broad areas...
var a1 = unique([<%=selectedBroadArea %>]);
var a2=bb;
var index=a2.lastIndexOf(",");
b=a2.substring(0,index);
array2=b.split(",")
var a3 = unique(array2);
if(a3.length==a1.length){
 //alert("hi it is a match");//do nothing
}else{
alert("Please select major disciplines from all the broad areas seleceted by you.");
return false;
}
  var confirmation = confirm("Can we confirm your selection?");
  if(confirmation == true)
  {
     window.opener.document.forms[0].majorArea.value=x;
     window.close();
  }
 else
     return false;
}
</script>
        
    </head>
    <body  onload="makingcheck();" background="images/background.jpg">
    <form name="rfm" method="post" action=""  >
    <input type="hidden" name="strMajorDiscipline" value=""/>
    <input type="hidden" name="brAr" value=""/>
    <div class="row padded">
    <fieldset>
    <div class="whole blue align-center"><h5>Major Discipline</h5></div>
    
    <table class="footable blue" id="tab1">
     <thead>
     <tr>
      <th>Select</th>
      <th data-class="expand">Major Area</th>
      <th data-hide="phone">Broad Area</th>
    </tr>
      </thead>
      <%
     if(iSize>0)
       {
       String broadAreaString="";
            for(i=0;i<iSize;i=i+4)
            {
             %>
        <tr> 
           <td><input type="CHECKBOX" id="majorAreaId"  name="majorAreaId" value="<%=arrlistmajorArea.get(i).toString()+","+arrlistmajorArea.get(i+3).toString()%>"></td>
           <td><%=arrlistmajorArea.get(i+1).toString()%></td>
           <td><%=arrlistmajorArea.get(i+2).toString()%></td>           
        </tr>
       <%  }
        }
      %>
       <tfoot class="footable-pagination">
         <tr>
          <td colspan="3"><ul id="pagination" class="footable-nav"></ul>
          </td>
         </tr>
        </tfoot>
  </table>
  <!--
 <div id="pageNavPosition"></div>

<script type="text/javascript">
var pager = new Pager('tab1', 10); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
   </script> -->
<div class="whole align-center pad-top">
          <input type="button" class="generalButton" name="ADD" value="ADD" onclick="return functionClose1()"/>
       </div>
  </fieldset>
  </div>
  </form>
  </body>
</html>