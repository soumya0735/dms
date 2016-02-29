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
  <title>Indian Council of Medical Research</title>
   <!-- Modernizr -->
 <script src="/ICMR/app_srv/icmr/gl/jscss/js/libs/modernizr-2.6.2.min.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/libs/jquery-1.9.1.min.js"></script>
  <!-- GroundworkCSS -->
  <link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/jscss/home.css">
  <!--[if IE]>
<link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/jscss/home-ie.css">
  <![endif]-->
  <!--[if lt IE 9]>
  <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/libs/html5shiv.min.js"></script>
  <![endif]-->
  <!--[if IE 7]>
  <link type="text/css" rel="stylesheet" href="/ICMR/app_srv/icmr/gl/jscss/font-awesome-ie7.min.css">
  <![endif]-->

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
	   if(width<=1024)
	 {
	 $(".banner1").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner1_800.png");
	 $(".banner2").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner2_800.png");
	 
	 }
else if(width>1024 && width<1200)
{
	 $(".banner1").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner1_1024.png");
	 $(".banner2").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner2_1024.png");
}
	  else{
		  $(".banner1").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner1.png");
		  $(".banner2").attr("src","/ICMR/app_srv/icmr/gl/homeimages/banner2.png");
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
  	       $this.children("img:first").attr("src", "/ICMR/app_srv/icmr/gl/homeimages/pause_button.jpg").attr("title", "Pause").attr("alt", "Pause");  
  	       // call play for the plugin here
  	     $('.cycle-slideshow').cycle('resume');
  	   } 
  	    else
  	    {
  	    	
  	        $this.data("playing", false);
  	       $this.children("img:first").attr("src", "/ICMR/app_srv/icmr/gl/homeimages/play_button.jpg").attr("title", "Play").attr("alt", "Play");  
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
    <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/plugins/jquery-responsiveText.js"></script>

  </head>
  <body>
  <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="container">
 <header class="header">
 <div class="whole">
 <div class="two ninth mobile pad-left">
 <img src="/ICMR/app_srv/icmr/gl/homeimages/logo.png" alt="ICMR logo" class="class1 pad-top-half2">
 </div>
  <div class="five ninth align-center mobile"><div class="responsive blue2 morelineheight" data-compression="27" data-min="12" data-max="170">
  &#2349;&#2366;&#2352;&#2340;&#2368;&#2351; &#2310;&#2351;&#2369;&#2352;&#2381;&#2357;&#2367;&#2332;&#2381;&#2334;&#2366;&#2344;  &#2309;&#2344;&#2369;&#2360;&#2306;&#2343;&#2366;&#2344; &#2346;&#2352;&#2367;&#2359;&#2342;
  </div>
  <div class="lesslineheight">
<div class="responsive blue2 bold" data-compression="27" data-min="8" data-max="170">  India Council of Medical Research</div>
 <div class="responsive blue2" data-compression="45" data-min="8" data-max="170">Department of Health Research, Ministry of Health &amp; Family Welfare<br>Government of India</div>
<div class="responsive green2 bold" data-compression="40" data-min="8" data-max="170">
  Web based Submission,Processing & Management for Extramural Proposals</div>
  </div>
  </div>
  <div class="two ninth mobile align-right pad-right">
  <img src="/ICMR/app_srv/icmr/gl/homeimages/emblem.gif" alt="National emblem" class="padded class3"  >
  </div>
 </div>
 
 </header>
  <section>
 <div class="banner row hide-on-mobile hide-on-small-tablet">
<div class="seven ninth blue_back" >
 <div data-cycle-fx="scrollHorz" data-cycle-pause-on-hover="true" data-cycle-paused="false" class="cycle-slideshow">
<div class="cycle-prev"></div>
    <div class="cycle-next"></div>
        <img src="/ICMR/app_srv/icmr/gl/homeimages/banner1.png" alt="Welcome to eppms" class="banner1">
        <img src="/ICMR/app_srv/icmr/gl/homeimages/banner2.png"  class="banner2"  alt="What does eppms offer">
  </div>

<div id="controls">
   <span><img src="/ICMR/app_srv/icmr/gl/homeimages/previous.gif" alt="Previous" title="Previous" id="prev"></span>
     <span><a  href="#" id="pauseOrPlay" data-playing='true'><img src="/ICMR/app_srv/icmr/gl/homeimages/pause_button.jpg"alt="Pause" title="Pause"></a></span>
    <span><img src="/ICMR/app_srv/icmr/gl/homeimages/next.gif" alt="Next" title="Next" id="next"></span>
</div>		 	

<!-- <h4 class="bold">Welcome to e-PPMS</h4>
 The Electronic Project Proposal Management system is a entry point for electronic administration of ICMR-funded projects promoting research in biomedical research, and hosts the services 
for managing your proposals and projects throughout their lifecycle.
Depending on your role in projects and organisation, you can view information on projects, negotiate your grant agreement, manage amendments, submit financial and scientific reports or 
review projects. -->

 </div>
 <div class="two ninth">
<ul>
    <li class="home"><a href="/ICMR//app_srv/icmr/gl/jsp/quickpath.jsp">Home</a></li>
    <li class="contact"><a href="/ICMR/app_srv/icmr/gl/jsp/contactus.jsp" target="_blank">Contact</a></li>
</ul>	
		</div>
 </div><!--  banner ends here -->
 <div class="mobile-only small-tablet-only banner whole">
 <ul>
 <li class="pad-left pad-right"><i class="icon-home pad-right"></i>Home</li>
  <li class="pad-left pad-right"><i class="icon-phone pad-right"></i>Contact Us</li>
 </ul>
 </div>
 </section>
 
 
	<div class="justify padded" style="border:1px solid;">
        <p><b>
                Indian Council of Medical Research</b><br>
                Dr.V K Srivastava<br>
                Scientist 'G', Head (P&I)<br>
                Indian Council of Medical Research<br>
                Ansari Nagar,New Delhi-110029<br>
                Phone:011 26589578,+919891011755<br>
                E-mail:vijaiksri@gmail.com<br>
                </span></p>
        </div>
 
 <footer class="row footer white align-center">
 <div class="two eighth"><img src="/ICMR/app_srv/icmr/gl/homeimages/cdac_logo.png" alt="C-DAC logo"></div>
  <div class="four eighth pad-top">
 Designed, Developed and Maintained by C-DAC</div>
 </footer>
  <!-- scripts -->

  <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
 </div>
 </body>
 </html>
 
 
 
 
 