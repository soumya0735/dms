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
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
  

  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <title></title>
  <!--  javascript to scroll image -->
  <jsp:include page="/app_srv/foxmandal/gl/globals/responsive-js-css.jsp"></jsp:include>
 


  <%
response.setHeader("expires","0");
response.setHeader("expires","now");
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",-1);



 String sessUserType="P";
 String reqUserType = "";
 String sesUserType="";
 String strRole = "";


// this line of code will disallow the requestsa without session
    //sessUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
 
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

   <tiles:insertAttribute name="header"/>
    
     <% System.out.println("Anshu jain="+sessUserType);
  if((sessUserType.equals("A") || sesUserType.equals("A")) && strRole.equals(""))
  {%>
    
   <tiles:insertAttribute name="AMenu"/>
    
   <%}else if((sessUserType.equals("S") || sesUserType.equals("S")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="SFAMenu"/>
    
   <%} else if((sessUserType.equals("P") || sesUserType.equals("P")) && strRole.equals("")) {System.out.println("inside proposer");%>
    
   <tiles:insertAttribute name="Menu"/>
    
   <%} else if((sessUserType.equals("E") || sesUserType.equals("E")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="EMenu"/>
    
   <%} else if((sessUserType.equals("W") || sesUserType.equals("W")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="WMenu"/>
    
   <%} else if((sessUserType.equals("R") || sesUserType.equals("R")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="RMenu"/>
    
   <%} else if((sessUserType.equals("O") || sesUserType.equals("O")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="OPMenu"/>  
    
   <%} else if((sessUserType.equals("H") || sesUserType.equals("H")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="DHMenu"/>
    
   <%}else if((sessUserType.equals("D") || sesUserType.equals("D")) && strRole.equals("")) {%>
    
   <tiles:insertAttribute name="DGMenu"/>
    
   <%}else if((sessUserType.equals("F") && strRole.equals(""))) {%>
    
   <tiles:insertAttribute name="Fmenu"/>
    
   <%}else if((sessUserType.equals("C") && strRole.equals(""))) {%>
    
   <tiles:insertAttribute name="AcMenu"/>
    
   <%} else  {
      if(sessUserType.length() >1)
      {
   %>
    
   <tiles:insertAttribute name="Mmenu"/>
    
   <%}%>
    
   <%}%>
    
   <tiles:insertAttribute name="body"/>
    
   <tiles:insertAttribute name="footer"/>
  </div>
    <!-- scripts -->
 <script type="text/javascript" src="<%=request.getContextPath()%>/app_srv/foxmandal/gl/jscss/js/groundwork.all.js"></script>
 </body>
</html>