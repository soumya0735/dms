
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>
<META http-equiv="Content-Style-Type" content="text/css"/>
<%@taglib  prefix="s" uri="/struts-tags" %>
  <title>Indian Council of Medical Research</title>
   <!-- Modernizr -->
 <script src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/modernizr-2.6.2.min.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/jquery-1.9.1.min.js"></script>
  <!-- GroundworkCSS -->
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/home.css">
  <!--[if IE]>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/home-ie.css">
  <![endif]-->
  <!--[if lt IE 9]>
  <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/libs/html5shiv.min.js"></script>
  <![endif]-->
  <!--[if IE 7]>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/font-awesome-ie7.min.css">
  <![endif]-->
<%System.out.println("0000011111111");%>
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
  
  <script>
$( document ).ready(function() {
	
	 var width=$(window).width();
	
	 /*set images for different screen resolutions*/
	   if(width<=1024 && width >800)
	 {
	 $(".banner1").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner1_800.png");
	 $(".banner2").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner2_800.png");
	 
	 }
else if(width>1024 && width<1200)
{
	 $(".banner1").attr("src","<%=request.getContextPath()%>app_srv/foxmandal/gl/homeimages/banner1.jpg");
	 $(".banner2").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner2.jpg");
}
	  else if(width<=800)
	  {
	  $(".banner1").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner1.jpg");
		  $(".banner2").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner2.jpg");
		  }
		  else
	  {
		  $(".banner1").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner1.jpg");
		  $(".banner2").attr("src","<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner2.jpg");
	  }
	  
//code to display member login div first in mobile view
        if(width<=480)
        {
            $(".quicklink").remove().insertAfter($(".login"));
        } else {
            $(".quicklink").remove().insertBefore($(".login"));
        }
    });
</script> 
 <script type="text/javascript">
   jQuery(document).ready(function() {
	 
	  // $('.cycle-slideshow').cycle('pause'); 
	  
	  
	  //below portion is to open some outside link in new window for banner
    // jQuery('.cycle-slideshow img').click(function (){
    //  document.location.href = jQuery(this).attr('rel');
     //window.open(jQuery(this).attr('rel'));
     //document.location.target='_parent';
    //}).css('cursor','pointer');  
     
     $("#pauseOrPlay").on("click", function(e) {
 	  	
  	    e.preventDefault();
  	   var $this = $(this),
  	        playing = $this.data("playing"),
  	      	$slides = $(".cycle-slideshow");
  	        if (!playing)
  	   {
  	       $this.data("playing", true);
  	       $this.children("img:first").attr("src", "<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/pause_button.jpg").attr("title", "Pause").attr("alt", "Pause");  
  	       // call play for the plugin here
  	     $('.cycle-slideshow').cycle('resume');
  	   } 
  	    else
  	    {
  	    	
  	        $this.data("playing", false);
  	       $this.children("img:first").attr("src", "<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/play_button.jpg").attr("title", "Play").attr("alt", "Play");  
  	       // call pause for the plugin here 
  	     $('.cycle-slideshow').cycle('pause');
  	    }  
  	});
     
     $("#prev").on("click", function(e) {
 	    	// alert("in");
 	   	  
 		     $('.cycle-slideshow').cycle('prev');
 		     
 		});
 	 $("#next").on("click", function(e) {
 		// alert("in");
 		  
 	     $('.cycle-slideshow').cycle('next');
 	     
 	});  
  });
</script>
  
  
 <!-- js for responsive text -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/plugins/jquery-responsiveText.js"></script>
 <% 
      if(session.getAttribute("userInfo")!=null)
      {%> 
    <script>window.history.go(1);</script>  
      <%}  
    response.setHeader("expires","0");
    response.setHeader("expires","now");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires",-1);
 %> 
<script language="javascript">
function check_data()
{
  var v1,v2;
  v1=document.getElementById('password').value;
  v2=document.getElementById('login').value;
  //alert("v1"+v1);
  //alert("v2"+v2);
  if (v1=="" || v2=="" || v1==null || v2==null)
  {
  alert("Fill Login/Password Properly...");
  return false;
  }
  else
  {
  document.forms[0].submit();
  }
}
function blank()
{
        document.getElementById('password').value="";
}
 function blank1()
{
        document.getElementById('login').value="";
}
function queryAction() {
location.href = "<%=request.getContextPath()%>/registrationAction.do";
}
function checkEnter(pwdtxt,e){

        var characterCode = e.keyCode;
     
        if((characterCode == 13) && document.forms[0].password.value.length > 0  )
        {
          document.forms[0].submit();
          return true;
        }
        else
        {			
          return false;
        }
}




function noBack() 
{
  window.history.forward(); 
}

function openforgotWindow()
{
var strQuery="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jsp/forgotPassword.jsp";
window.open(strQuery,'Forgot_Password','scrollbars=no,height=190,width=500,top=270,left=400');
}

function createhintbox(){
var divblock=document.createElement("div");
divblock.setAttribute("id", "hintbox");
document.body.appendChild(divblock);
}

if (window.addEventListener)
window.addEventListener("load", createhintbox, false);
else if (window.attachEvent)
window.attachEvent("onload", createhintbox);
else if (document.getElementById)
window.onload=createhintbox;
</script>
 
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="container">
 <header class="header">
 <div class="whole">
 <div class="four sixth mobile pad-left">
 <img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/logo_fm_full.png" alt="FOX MANDAL logo" class="class1 pad-top-half2">
 </div>

 </div>
 
 </header>
  <section>
 <div class="banner row hide-on-mobile hide-on-small-tablet">
<div class="whole blue_back" >
 <div data-cycle-fx="scrollHorz" data-cycle-pause-on-hover="true" data-cycle-paused="false" class="cycle-slideshow">
<div class="cycle-prev"></div>
    <div class="cycle-next"></div>
        <img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner1.jpg" alt="Welcome to eppms" class="banner1">
        <img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/banner2.jpg"  class="banner2"  alt="What does eppms offer">
  </div>

<div id="controls">
   <span><img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/previous.gif" alt="Previous" title="Previous" id="prev"></span>
     <span><a  href="#" id="pauseOrPlay" data-playing='true'><img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/pause_button.jpg"alt="Pause" title="Pause"></a></span>
    <span><img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/next.gif" alt="Next" title="Next" id="next"></span>
</div>		 	

<!-- <h4 class="bold">Welcome to e-PPMS</h4>
 The Electronic Project Proposal Management system is a entry point for electronic administration of FOX MANDAL-funded projects promoting research in biomedical research, and hosts the services 
for managing your proposals and projects throughout their lifecycle.
Depending on your role in projects and organisation, you can view information on projects, negotiate your grant agreement, manage amendments, submit financial and scientific reports or 
review projects. -->

 </div>
 
 </div><!--  banner ends here -->
 
 </section>
  <article>

    <div class="five ninth border-right border-left double login">
	<div class="grey_back align-center gapped"><h3 class="bold"><span class="blue">Member</span><span class="green2"> Login</span></h3>
	
	<form action="logon.action" method="post">
        <div id="incorrectLogin" style="color:red;">
                    <s:if test="hasActionMessages()" >
                   
                        <s:actionmessage/>
                        
                    
                </s:if> 
                <s:if test="hasActionErrors()" >
                    
                        <s:actionerror/>
                    
                </s:if>
            </div>
	<div class="row">
	<div class="white_back three fourth centered align-left">
	<div class="ten twelfth centered">
	<label>Username</label>
        <input type="text" class="generalTbox" name="userName" id="login" maxlength="25" size="17" onfocus="javascript:this.value=this.value.replace(/^\s+|\s+$/g,'')" onblur="javascript:this.value=this.value.replace(/^\s+|\s+$/g,'')"  value=""/>
	<label>Password</label>
	<input type="password" class="generalTbox"  name="userPassword" maxlength="20" styleId="password" size="17"  value="" onkeypress="checkEnter(this,event)"/>
	<div class="row pad-top pad-bottom">
		<div class="blue pull-left"><a href="javascript:openforgotWindow()">Forgot Password?</a></div>
                <div class="pull-right">
<!--                    <button type="submit" class="blue white pill-right round" name="B1" value="Log In"/>-->
<button type="submit">LOGIN</button> 
                </div>
	</div>
		
	</div>
	</div>
<div class=" skip-one seven eighth blue bold align-left pad-top pad-bottom"><a href="#" onClick="queryAction()">Register Now</a></div>
	</div>
        </form>
	
	</div>
<!--	<div class="large-text green2 bold pad-left hide-on-mobile">System Usage Notification</div>
	<div class="justify padded hide-on-mobile">This system is provided as a public service by the Indian Council of Medical Research. It is intended for use by different stakeholders for viewing, submission, retrieval and monitoring of authorized information only. Unauthorized attempts to upload information, change or access information on this service are strictly 
prohibited and may be punishable.Usage may be monitored.</div>-->

</div>
	 <div class="two ninth">
	 <div class="pad-left" >
	  <div class="padded-half large-text "><img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/barea.gif" alt="Broad Areas" class="middle class2">
  <span class="bold blue pad-top double">Broad Areas</span>
   </div>
  <ul class="blue-bullet shadow ">
<li>	 Bioinformatics</li>
   <li>   	Health System Research</li>
     <li> 	Basic Medical Science</li>
    <li>  	Epidemiology & Communicable Diseases</li>
    <li>  	Non Communicable Diseases</li>
    <li>  	Reproduction & Child Health</li>
    <li>  	Publication & Information</li>
    <li>  	Social & Behavioral Research</li>
    <li>  	Nutrition</li>
    <li>  	Research Methodology</li>
</ul>
   
   </div>
   </div>
	
  </article>
  

 <footer class="row footer white align-center">
 <div class="two eighth"><img src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/homeimages/cdac_logo.png" alt="C-DAC logo"></div>
  <div class="four eighth pad-top">
 Designed, Developed and Maintained by C-DAC</div>
 </footer>
  <!-- scripts -->

  <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/groundwork.all.js"></script>
</div>
</body>
</html>
