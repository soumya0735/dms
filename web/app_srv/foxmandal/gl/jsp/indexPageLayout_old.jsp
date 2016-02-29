
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
 String sessUserType="X";
 if(session.getAttribute("userInfo")!=null)
    sessUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
   // session.invalidate();
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
  <form name="Oneslideform" id="home" method="post">

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
  if(sessUserType.equals("A"))
  {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="AMenu"></tiles:insert>
  </td>
  </tr>
  
  <%} else if(sessUserType.equals("P")) {%>
   <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="PMenu"></tiles:insert>
  </td>
  </tr>
  <%} else if(sessUserType.equals("E")) {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="EMenu"></tiles:insert>
  </td>
  </tr>
  <%} else if(sessUserType.equals("W")) {%>
  <tr> 
  <td width="100%" colspan="3">
       <tiles:insert attribute="WMenu"></tiles:insert>
  </td>
  </tr>
  <%}%>
	<tr>
		<td colspan="3" style="border-left-style: solid; border-left-width: 1px; border-right-style: solid; border-right-width: 1px;">
 <tiles:insert attribute="banner"></tiles:insert>	
 </td>
	</tr>
	
	
	
<tr>
		<td width="26%" style="border-left-style: solid; border-left-width: 1px" valign="top">
		 
    <tiles:insert attribute="lmenu"></tiles:insert>
     
		</td>
    
		<td width="2px" align="center" valign="top">
		
		<img border="0" src="/ICMR/app_srv/icmr/gl/images/ver_line.gif" width="2" height="482"></td>
		<td width="73%" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px;" valign="top">
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
</form>
</body>

</html>