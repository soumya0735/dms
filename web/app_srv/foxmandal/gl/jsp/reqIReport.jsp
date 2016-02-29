
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="/MSIPS/app_srv/tdc/gl/theme/home.css"></link>
    
<link href="/MSIPS/app_srv/tdc/gl/theme/tabs.css" rel="stylesheet" type="text/css"/>
    
     
    
    
            <%@ page import="java.util.*,in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation"%>
    
    <script>
    
        function callIreport(thecntrl,thefield)
    {
   // alert("inside calliReport"+thefield);
  var strPropId=document.forms[0].strPropId.value; 
  var strVerId=document.forms[0].strVersion.value;
       if(thefield=="EMC") 
            document.forms[0].action="/ICMR/app_srv/tdc/mm01/jsp/call_Ireport.jsp?reportName=EMCDetails&strPropId="+strPropId+"&strVersionId="+strVerId;     
        else if(thefield=="PRJ") 
            document.forms[0].action="/ICMR/app_srv/tdc/mm01/jsp/call_Ireport.jsp?reportName=ProjDetails&strPropId="+strPropId+"&strVersionId="+strVerId;     
        else if(thefield=="FIN") 
            document.forms[0].action="/ICMR/app_srv/tdc/mm01/jsp/call_Ireport.jsp?reportName=FinDetails&strPropId="+strPropId+"&strVersionId="+strVerId;     
        else if(thefield=="PAY") 
            document.forms[0].action="/ICMR/app_srv/tdc/mm01/jsp/call_Ireport.jsp?reportName=PayDetails&strPropId="+strPropId+"&strVersionId="+strVerId;     
        else if(thefield=="PRF")
            document.forms[0].action="/ICMR/app_srv/tdc/mm01/jsp/call_Ireport.jsp?reportName=Profile&strUserID="+thecntrl.id;     
        
      //  alert(document.forms[0].action);
        document.forms[0].method="POST";
        
        document.forms[0].submit(); 
   }


 
   