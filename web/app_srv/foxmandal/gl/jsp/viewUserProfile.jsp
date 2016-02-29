<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>viewUserProfile</title>
        <script language="javascript" TYPE="text/javascript">
          function Viewprofile()
          {
              var userid="";
               userid=document.getElementById("userid").value;
               
               if(userid=="") 
               {
                   alert("Please Enter User Id");
                   document.getElementById("userid").focus();
                   return false;
               }
               else
               {
                var str="/ICMR/PDFReportXMLParser?reportName=User_Profile&where_clause1="+userid+"";
		window.open(str,'child','scrollbars,width=900,height=600');
               }
 
                
                
            }
            
            
            
            
             function ViewReport()
               {
              var propid="";
              var verid=""
               propid=document.getElementById("propid").value;
                 verid=document.getElementById("verid").value;
               if(propid=="") 
               {
                   alert("Please Enter  Id");
                   document.getElementById("propid").focus();
                   return false;
               }
               else
               {
                var str="/ICMR/PDFReportXMLParser?reportName=Proposal_Details&where_clause1="+propid+"&where_clause2="+ verid+"";
		window.open(str,'child','scrollbars,width=900,height=600');
               }
 
                
                
            }
           
            
            
            
           
        </script>
        
        
        
    </head>
    <body>
    
    
     <fieldset style="width:500px"><legend class="formheading"><b>User Profile</b></legend>
     <form>
  <table>
   <!---tr><td align="center" colspan="2" valign="top"><h3>User Profile Form</h3></td></tr>
   <tr><td>Enter User Id <span class="alerttext">*</span></td><td><input type="text" id="userid" name="userid" value=""></td></tr>-->
    <tr><td>Proposal Id <span class="alerttext">*</span></td><td><input type="text" id="propid" name="propid" value=""></td></tr>-->
    <tr><td>Version Id <span class="alerttext">*</span></td><td><input type="text" id="verid" name="verid" value=""></td></tr>-->
   
 
 
 
  <!-- <tr><td colspan="2" align="center"> <input class="generalButton" type="BUTTON" name="sub" style="float: center" value="Submit" onclick="Viewprofile()"></button></td></tr>-->
   
    <tr><td colspan="2" align="center"> <input class="generalButton" type="BUTTON" name="sub" style="float: center" value="Submit" onclick="ViewReport()"></button></td></tr>
   
  </table>
</form>
  </fieldset>
    
    
    
    </body>
</html>