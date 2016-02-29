function callfile1(thefield)
  {
  var _values=thefield.id;
 var list_value= _values.split("#");
   document.forms[0].method="post";
  document.forms[0].action="/ICMR/registrationAction.do?hmode=getFile&strFileType=F&strProposalId="+list_value[0]+"&strFileId="+list_value[1];
  document.forms[0].submit();
  }
  
  
  
 
  function callComments(thefield) 
{
        var _values = thefield.id;
        //alert(_values);
        var list_value = _values.split("#");
        var abstractID = list_value[0];
        
        var versionID = list_value[1]; 
        document.forms[0].method = "post";
        document.forms[0].action="/ICMR/PDFReportXMLParser?reportName=view_comments_allocator_archive&where_clause1="+abstractID+"&where_clause2=A1";
        document.forms[0].submit();  
}