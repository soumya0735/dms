<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<%@ page import="java.util.*,in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<title>New Page 2</title>
<link rel="stylesheet" type="text/css" href="/ICMR/app_srv/icmr/gl/theme/home.css" />
</head>
<body>
<table width="250"><tr><td width="270">
		<table border="0"  height="222" class="smalltext" class="quicklink" width="250">
			<tr>
				<td colspan="2" background="/ICMR/app_srv/icmr/gl/images/upper.gif"; style="background-repeat:no-repeat;height:30">
				<p align="center"><b>Broad Areas</b></td>
			</tr>		
 <% 
String strQuery="";

DBQueryManager  _dbq= new DBQueryManager();
try
 {
strQuery="select NUM_THEMATIC_AREA_ID,STR_THEMATIC_AREA_NAME from TDC_THEMATIC_AREA_MASTER";
ArrayList arrlistThematicArea=_dbq.fetchData(strQuery);
   if(arrlistThematicArea.size()>0)
 {
 for(int i=0;i<arrlistThematicArea.size();i=i+2)
  {
%>
			<tr>
                            <td style="background-image:url('/ICMR/app_srv/icmr/gl/images/sidestrip.gif');">
                            &nbsp;&nbsp;&nbsp;<img border="0" src="/ICMR/app_srv/icmr/gl/images/arrow.gif" width="15" height="15">&nbsp;&nbsp;</td>
                            <td><a href="#"><%=arrlistThematicArea.get(i+1).toString()%></a></td>
			</tr>
                  <%} }else{%>
                 <tr>
                    <td colspan="2" background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif"></td>
		</tr>
                <%}}
       catch(Exception e)
        {
         e.printStackTrace();
        } 
%>
<tr>
				<td colspan="2" background="/ICMR/app_srv/icmr/gl/images/bottomstrip.gif" style="background-repeat:no-repeat;">
				<p align="center">
				&nbsp;</td>
			</tr>
  </table><br></br>
		<table border="0" width="250" height="150" >
		<tr>
			<td height="29" background="/ICMR/app_srv/icmr/gl/images/upper.gif" style="background-repeat:no-repeat;">
			<p align="center"><b>Quick Link</b></td>
		</tr>
                <!--Start:Change Request  Feb 18 2014-->
                                       <tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/revised_procedure_EMR.pdf">Extramural Programme of ICMR  </a>
        </p></td>
		</tr>	
                <!--End:Change Request  Feb 18 2014-->
		                <tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/Registration_guidelines.pdf" >Registration Guidelines </a>
                        </p></td>
		</tr>	
                       <tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/preProposal.pdf"> Pre-Proposal Submission format </a>
        </p></td>
		</tr>	
                <tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/formats/detailedProposal.pdf"> Detailed Proposal Submission format </a>
        </p></td>
		</tr>
<tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a style="font-size:11" class="hyplinks" target="_blank" href="/ICMR/app_srv/icmr/gl/jsp/docReport.jsp"> Documents Required for Codal Formalities </a>
        </p></td>
		</tr>
		<tr>
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center">
         &nbsp;
        </p></td>
		</tr>
		<tr>
				<td background="/ICMR/app_srv/icmr/gl/images/bottomstrip.gif" style="background-repeat:no-repeat;">
				<p align="center">
				&nbsp;&nbsp;</td>
			</tr>
	</table>
		</td></tr></table>
</body>
</html>
