<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>


<title>New Page 2</title>

</head>

<body>
<% 


DBQueryManager _dbq1 = new DBQueryManager();
List arrlistRelatedArea = new ArrayList();


String strQuery = "";
int iSize = 0;
int i = 0;


strQuery ="Select initcap(STR_THEMATIC_AREA_NAME),NUM_THEMATIC_AREA_ID from TDC_THEMATIC_AREA_MASTER";
 arrlistRelatedArea=_dbq1.fetchData(strQuery);
iSize = arrlistRelatedArea.size();
%>


<table width="250"><tr><td>
		
		<table border="0"  height="222" class="smalltext" class="quicklink" width="250">
			<tr>
				<td background="/ICMR/app_srv/icmr/gl/images/upper.gif"; style="background-repeat:no-repeat;height:30">
				<p align="center"><b>Broad Areas</b></td>
			</tr>
                        
                         <%
           if(iSize>0)
           {
      
            for(i=0;i<iSize;i=i+2)
            {
             
                 
                  %>
			<tr>
				<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
				&nbsp;&nbsp;&nbsp;<img border="0" src="/ICMR/app_srv/icmr/gl/images/arrow.gif" width="15" height="15">&nbsp;&nbsp;
				<a href="#">  <%=arrlistRelatedArea.get(i+1).toString()%></a></td>
			</tr>
			
			
                        
                        
                        <%}}%>
                        <tr>
				<td background="/ICMR/app_srv/icmr/gl/images/bottomstrip.gif" style="background-repeat:no-repeat;">
				<p align="center">
				&nbsp;</td>
			</tr>
		</table>
		<br>
		<table border="0" width="250" height="150" class="smalltext" class="quicklink">
		<tr>
			
			<td height="29" background="/ICMR/app_srv/icmr/gl/images/upper.gif" style="background-repeat:no-repeat;">
			<p align="center"><b>Quick Link</b></td>
		</tr>
		
		<!--tr>
			
			<td height="20" background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a href="#">Registration Information </a></td>
		</tr-->
		
		<!--tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center" >
			<img border="0" src="/ICMR/app_srv/icmr/gl/images/line.gif" width="172" height="1"></td>
		</tr-->
		
		<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a target="_blank" href="/ICMR/app_srv/icmr/gl/formats/registration-guidelines.pdf"> Registration&nbsp;Guidelines&nbsp;for&nbsp;Proposers </a></p></td>
		</tr>
		
		<!--tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center">
			<img border="0" src="/ICMR/app_srv/icmr/gl/images/line.gif" width="172" height="1"></td>
		</tr>
		
		<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a href="#">Award Search &amp; Funding Trends </a></td>
		</tr-->
		
		<!--tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center">
			<img border="0" src="/ICMR/app_srv/icmr/gl/images/line.gif" width="172" height="1"></td>
		</tr-->
		
	  
		
			<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
                        
			<p align="center"><a target="_blank" href="/ICMR/app_srv/icmr/gl/formats/preProposal.pdf"> Pre-Proposal Submission format </a>
         
        </p></td>  
		</tr>
                	
			<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
                        
			<p align="center"><a target="_blank" href="/ICMR/app_srv/icmr/gl/formats/detailedProposal.pdf"> Detailed Proposal Anshu Submission format </a>
         
        </p></td>
		</tr>
		<!--tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center">
			<img border="0" src="/ICMR/app_srv/icmr/gl/images/line.gif" width="172" height="1"></td>
		</tr>
		
		<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a href="#">Selection Procedure</a></td>
		</tr>
		
		<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center">
			<img border="0" src="/ICMR/app_srv/icmr/gl/images/line.gif" width="172" height="1"></td>
		</tr>
		
		<tr>
			
			<td background="/ICMR/app_srv/icmr/gl/images/sidestrip.gif">
			<p align="center"><a href="#">Financial Support</a></td>
		</tr-->
		<tr>
				<td background="/ICMR/app_srv/icmr/gl/images/bottomstrip.gif" style="background-repeat:no-repeat;">
				<p align="center">
				&nbsp;</td>
			</tr>
	</table>
		</td></tr></table>
		
</body>

</html>
