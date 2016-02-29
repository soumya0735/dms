    <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/jquery-1.9.1.min.js"></script>

        <!-- Modernizr -->
        <script src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/modernizr-2.6.2.min.js"></script>
        <!-- jQuery -->
     
        <!-- GroundworkCSS -->
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/home.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/font-awesome.css">
          <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/font-awesome-ie7.min.css">
        
        <!--[if IE]>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/home-ie.css">
        <![endif]-->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/html5shiv.min.js"></script>
        <![endif]-->
        <!--[if IE 7]>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/font-awesome-ie7.min.css">
        <![endif]-->

<!-- calendar -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/jquery-ui.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/jquery-ui.js"></script>
<!-- -->

<!--  for footable-->
    <LINK href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/css/footable-0.1.css" rel="stylesheet" type="text/css" />
    <LINK href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/css/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
    <LINK href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/css/footable.paginate.css" rel="stylesheet" type="text/css" />
    <SCRIPT src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/js/footable.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/js/footable.filter.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/js/footable.paginate.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/footable/js/footable.sortable.js" type="text/javascript"></SCRIPT>
    
    
   
    
    
<!-- ends here -->

  <script type="text/javascript">
    // extend Modernizr to have datauri test
    (function(){
      var datauri = new Image();
      datauri.onerror = function() {
          Modernizr.addTest('datauri', function () { return false; });
      };
      datauri.onload = function() {
          Modernizr.addTest('datauri', function () { return (datauri.width == 1 && datauri.height == 1); });
          Modernizr.load({
            test: Modernizr.datauri,
            nope: './css/no-datauri.css'
          });
      };
      datauri.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
    })();
    // fallback if SVG unsupported
    Modernizr.load({
      test: Modernizr.inlinesvg,
      nope: [
        './css/no-svg.css'
      ]
    });
    // polyfill for HTML5 placeholders
    Modernizr.load({
      test: Modernizr.input.placeholder,
      nope: [
        './css/placeholder_polyfill.css',
        './js/libs/placeholder_polyfill.jquery.js'
      ]
    });
  </script>
  <!-- script for scrolling banner -->
  
 <!-- js for responsive text -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/plugins/jquery-responsiveText.js"></script>
   
   <!-- For tool tip -->
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/jquery.powertip.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/jquery.powertip-dark.css"/>
<script type="text/javascript">
// $(function() {
        // // placement examples
        // $('.helptext').powerTip({ placement: 'nw-alt' });
        // $('.helptext_down').powerTip({ placement: 'se-alt' });
        
        // //Footable
            // $('table').footable();     
// });
// </script>-->
   
 <% if(session.getAttribute("userInfo")!=null){%> 
    <script>window.history.go(1);</script>  
 <%}  
    response.setHeader("expires","0");
    response.setHeader("expires","now");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires",-1);
  %> 
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/validateBox.css"/>
<!--<script src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/respond.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/jquery.easyui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/ValidationFunctions.js"></script>
  
  