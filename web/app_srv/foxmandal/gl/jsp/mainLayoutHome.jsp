
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Electronic Project Proposal Submission System</title>
<!--  javascript to scroll image -->


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
 sesUserType = session.getAttribute("strSesUserType").toString();
 }
 
 if(request.getParameter("role")!=null)
 {
    strRole = request.getParameter("role").toString();
 }
 System.out.println(sesUserType);
 System.out.println("inside");
%>

<SCRIPT type="text/javascript">
<!-- Begin

//3-way slideshow- by Suzanne Arnold (http://jandr.com/, suzanne@mail.jandr.com)
//Script featured on JavaScript Kit (http://javascriptkit.com)
//Credit must stay intact

var Onerotate_delay = 5000; // delay in milliseconds (5000 = 5 secs)
Onecurrent = 0;
var OneLinks = new Array(3);
OneLinks[0] = "http://www.eeps.cdacnoida.in/";
OneLinks[1] = "http://www.eeps.cdacnoida.in/";
OneLinks[2] = "http://www.eeps.cdacnoida.in/";


function Onenext() {
if (document.Oneslideform.Oneslide[Onecurrent+1]) {
document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent+1].value;
document.Oneslideform.Oneslide.selectedIndex = ++Onecurrent;
   }
else Onefirst();
}
function Oneprevious() {
if (Onecurrent-1 >= 0) {
document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent-1].value;
document.Oneslideform.Oneslide.selectedIndex = --Onecurrent;
   }
else Onelast();
}
function Onefirst() {
Onecurrent = 0;
document.images.Oneshow.src = document.Oneslideform.Oneslide[0].value;
document.Oneslideform.Oneslide.selectedIndex = 0;
}
function Onelast() {
Onecurrent = document.Oneslideform.Oneslide.length-1;
document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent].value;
document.Oneslideform.Oneslide.selectedIndex = Onecurrent;
}
function Oneap(text) {

//alert(document.getElementById("Oneslidebutton").style.backgroundImage);
//document.Oneslideform.Oneslidebutton.value = (text == "p") ? "r" : "p";
document.getElementById("Oneslidebutton").style.backgroundImage =(document.getElementById("Oneslidebutton").style.backgroundImage== "url(images/pause_button.jpg)") ? "url(images/play_button.jpg)" : "url(images/pause_button.jpg)";

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
if (document.getElementById("Oneslidebutton").style.backgroundImage=="url(images/pause_button.jpg)") {
Onecurrent = (Onecurrent == document.Oneslideform.Oneslide.length-1) ? 0 : Onecurrent+1;
document.images.Oneshow.src = document.Oneslideform.Oneslide[Onecurrent].value;
document.Oneslideform.Oneslide.selectedIndex = Onecurrent;
window.setTimeout("Onerotate()", Onerotate_delay);
}
}
function Onetransport(){
window.location=OneLinks[Onecurrent]
}


//  End -->



</SCRIPT>


<link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css">


</head>

<body>
 

<table border="0" bgcolor="#FFFFFF" class="general" align="center" >
	<tr>
		<td colspan="3" style="border-left-style: solid; border-left-width: 1px; border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px">
    <tiles:insert attribute="header"></tiles:insert>
    </td>
	</tr>
	
<tr>
		<td colspan="3" style="border-left-style: solid; border-left-width: 1px; border-right-style: solid; border-right-width: 1px">
     <tiles:insert attribute="menu"></tiles:insert>
     </td>
	</tr>
  
  
  <%
  if((sessUserType.equals("A") || sesUserType.equals("A")) && strRole.equals(""))
  {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="AMenu"></tiles:insert>
  </td>
  </tr>
  
  <%} else if((sessUserType.equals("P") || sesUserType.equals("P")) && strRole.equals("")) {%>
   <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="PMenu"></tiles:insert>
  </td>
  </tr>
  <%} else if((sessUserType.equals("E") || sesUserType.equals("E")) && strRole.equals("")) {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="EMenu"></tiles:insert>
  </td>
  </tr>
  <%} else if((sessUserType.equals("W") || sesUserType.equals("W")) && strRole.equals("")) {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="WMenu"></tiles:insert>
  </td>
  </tr>
 
  
   <%} else if((sessUserType.equals("R") || sesUserType.equals("R")) && strRole.equals("")) {%>
    <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="RMenu"></tiles:insert>
  </td>
  </tr>
  
  
  <%} else if((sessUserType.equals("O") || sesUserType.equals("O")) && strRole.equals("")) {%>
    <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="OPMenu"></tiles:insert>
  </td>
  </tr>
  
    <%} else if((sessUserType.equals("H") || sesUserType.equals("H")) && strRole.equals("")) {%>
    <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="DHMenu"></tiles:insert>
  </td>
  </tr>
  
 <%}else if((sessUserType.equals("D") || sesUserType.equals("D")) && strRole.equals("")) {%>
    <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="DGMenu"></tiles:insert>
  </td>
  </tr>
  
   <%} else  {
      if(sessUserType.length() >1)
      {
   %>
  <tr> 
  <td width="100%" colspan="3">
    <tiles:insert attribute="Mmenu"></tiles:insert>
  </td>
  <%}%>
</tr>
  <%}%>
	
<tr>
		<td width="15%" style="border-left-style: solid; border-left-width: 1px" valign="top">
		  <% if(sessUserType.equals("X")) {%>
    <tiles:insert attribute="lmenu"></tiles:insert>
    <% } else  %>
       <tiles:insert attribute="profile"></tiles:insert>        
		</td>
    
		<td width="2px" align="center" valign="top">
		
		<img border="0" src="/ICMR/app_srv/icmr/gl/images/ver_line.gif" width="2" height="482"></td>
		<td width="84%" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px;" valign="top">
<p style="margin-left: 10px;margin-top: 10px;">
			
		<tiles:insert  attribute="body"></tiles:insert>
		</td>
	</tr>
	
	
	
	<tr>
		<td colspan="3" style="border-left-style: solid; border-left-width: 1px; border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">

 <tiles:insert attribute="footer"></tiles:insert>
		</td>
	</tr>
</table>

</body>

</html>