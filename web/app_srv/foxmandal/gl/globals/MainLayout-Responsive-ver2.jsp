<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]>   <html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]>   <html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
  <!--<![endif]-->

 <head>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
           pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
  <%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation"%>

  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <title></title>
  <!--  javascript to scroll image -->
  <jsp:include page="/app_srv/icmr/gl/globals/responsive-js-css-ver2.jsp"></jsp:include>
 


  <%
response.setHeader("expires","0");
response.setHeader("expires","now");
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",-1);



 String sessUserType="X";
 String reqUserType = "";
 String sesUserType="";
 String strRole = "";


// this line of code will disallow the requestsa without session
    sessUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
 
 if(request.getParameter("userType")!= null)
 {
    reqUserType = request.getParameter("userType").toString();
    session.setAttribute("strSesUserType",reqUserType);
 }
 if(session.getAttribute("strSesUserType")!= null)
 {
 System.out.println("inside mainlayou session");
 sesUserType = session.getAttribute("strSesUserType").toString();
 }
 
 if(request.getParameter("role")!=null)
 {
    strRole = request.getParameter("role").toString();
 }
 System.out.println(sesUserType);
 System.out.println("inside");
%>
  <script type="text/javascript">
<!--


    //3-way slideshow- by Suzanne Arnold (http://jandr.com/, suzanne@mail.jandr.com)
    //Script featured on JavaScript Kit (http://javascriptkit.com)
    //Credit must stay intact
    var Onerotate_delay = 5000;// delay in milliseconds (5000 = 5 secs)
    Onecurrent = 0;
    var OneLinks = new Array(3);
    OneLinks[0] = "http://www.eeps.cdacnoida.in/";
    OneLinks[1] = "http://www.eeps.cdacnoida.in/";
    OneLinks[2] = "http://www.eeps.cdacnoida.in/";

    function Onenext() {
        if (document.Oneslideform.Oneslide[Onecurrent + 1]) {
            document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent + 1].value;
            document.Oneslideform.Oneslide.selectedIndex = ++Onecurrent;
        }
        else 
            Onefirst();
    }

    function Oneprevious() {
        if (Onecurrent - 1 >= 0) {
            document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent - 1].value;
            document.Oneslideform.Oneslide.selectedIndex = --Onecurrent;
        }
        else 
            Onelast();
    }

    function Onefirst() {
        Onecurrent = 0;
        document.images.Oneshow.src = document.Oneslideform.Oneslide[0].value;
        document.Oneslideform.Oneslide.selectedIndex = 0;
    }

    function Onelast() {
        Onecurrent = document.Oneslideform.Oneslide.length - 1;
        document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent].value;
        document.Oneslideform.Oneslide.selectedIndex = Onecurrent;
    }

    function Oneap(text) {

        //alert(document.getElementById("Oneslidebutton").style.backgroundImage);
        //document.Oneslideform.Oneslidebutton.value = (text == "p") ? "r" : "p";
        document.getElementById("Oneslidebutton").style.backgroundImage = (document.getElementById("Oneslidebutton").style.backgroundImage == "url(images/pause_button.jpg)") ? "url(images/play_button.jpg)" : "url(images/pause_button.jpg)";

        //var MyAltText=(text == "Stop") ? "Start" : "Stop";
        //document.Oneslidebutton.setAttribute=("alt", MyAltText)
        //document.Oneslidebutton.src ='images/pause_button.jpg';
        Onerotate();
    }

    function Onechange() {
        Onecurrent = document.Oneslideform.Oneslide.selectedIndex;
        document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent].value;
    }

    function Onerotate() {
        //if (document.Oneslideform.Oneslidebutton.value == "p") {
        if (document.getElementById("Oneslidebutton").style.backgroundImage == "url(images/pause_button.jpg)") {
            Onecurrent = (Onecurrent == document.Oneslideform.Oneslide.length - 1) ? 0 : Onecurrent + 1;
            document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent].value;
            document.Oneslideform.Oneslide.selectedIndex = Onecurrent;
            window.setTimeout("Onerotate()", Onerotate_delay);
        }
    }

    function Onetransport() {
        window.location = OneLinks[Onecurrent]
    }

   
  -->



</script>
 
 </head>
 <body>
  <div class="container container2">

   <tiles:insert attribute="header"></tiles:insert>
    
     <% System.out.println("Anshu jain="+sessUserType);
  if((sessUserType.equals("A") || sesUserType.equals("A")) && strRole.equals(""))
  {%>
    
   <tiles:insert attribute="AMenu"></tiles:insert>
    
   <%}else if((sessUserType.equals("S") || sesUserType.equals("S")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="SFAMenu"></tiles:insert>
    
   <%} else if((sessUserType.equals("P") || sesUserType.equals("P")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="PMenu"></tiles:insert>
    
   <%} else if((sessUserType.equals("E") || sesUserType.equals("E")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="EMenu"></tiles:insert>
    
   <%} else if((sessUserType.equals("W") || sesUserType.equals("W")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="WMenu"></tiles:insert>
    
   <%} else if((sessUserType.equals("R") || sesUserType.equals("R")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="RMenu"></tiles:insert>
    
   <%} else if((sessUserType.equals("O") || sesUserType.equals("O")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="OPMenu"></tiles:insert>  
    
   <%} else if((sessUserType.equals("H") || sesUserType.equals("H")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="DHMenu"></tiles:insert>
    
   <%}else if((sessUserType.equals("D") || sesUserType.equals("D")) && strRole.equals("")) {%>
    
   <tiles:insert attribute="DGMenu"></tiles:insert>
    
   <%}else if((sessUserType.equals("F") && strRole.equals(""))) {%>
    
   <tiles:insert attribute="Fmenu"></tiles:insert>
    
   <%} else  {
      if(sessUserType.length() >1)
      {
   %>
    
   <tiles:insert attribute="Mmenu"></tiles:insert>
    
   <%}%>
    
   <%}%>
    
   <tiles:insert attribute="body"></tiles:insert>
    
   <tiles:insert attribute="footer"></tiles:insert>
  </div>
    <!-- scripts -->
 <script type="text/javascript" src="/ICMR/app_srv/icmr/gl/jscss/js/groundwork.all.js"></script>
 </body>
</html>