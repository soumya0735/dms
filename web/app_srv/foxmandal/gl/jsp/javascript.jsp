<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  
 <script language="javascript">
 
  function func(this)
  {   
      var val=this.value;
     var val= str.indexOf(".");
     alert(val);
  }
 
 </script>
  <body>
  <input type="TEXT" name="year" id="year" onblur="func(this.id);"/>
  </body>
</html>
