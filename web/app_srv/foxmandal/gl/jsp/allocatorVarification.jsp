<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html;charset=windows-1252"%>
<%@ page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>


<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title> Allocator Varification Form </title>
    <script src="../jssrc/validDate.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="../jssrc/validemail.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>
    <script src="../jssrc/validString.js" LANGUAGE="JavaScript" TYPE="text/javascript"></script>

<%
DBQueryManager _dbq = new DBQueryManager();
java.text.SimpleDateFormat sdmFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");
String dt = sdmFormat.format(new java.util.Date());
System.out.println("error");
String [] strCheckedId = request.getParameterValues("thematicAreaId");
System.out.println("error");
String strUserId = request.getParameter("strUserId");
System.out.println("error");
String [] strQueryArr = {};
String strQuery0 = "";
String strQuery11 = "";
String [] arrConcatenateId = {};
boolean flag = false;
System.out.println("checked id....."+strCheckedId);
System.out.println("user id....."+strUserId);
if(strCheckedId != null && strUserId != null)
{
System.out.println("in if");
if(strCheckedId.length > 0)
{
//System.out.println("");
strQuery0 = "SELECT COUNT(*) FROM TDC_EXPERT_MASTER WHERE STR_EXPERT_ID='"+strUserId+"'";
int count = Integer.parseInt(_dbq.fetchSingleData(strQuery0));
if(count > 0)
{
  strQuery0 = "DELETE FROM TDC_EXPERT_MASTER WHERE STR_EXPERT_ID='"+strUserId+"'";
  flag = _dbq.insert(strQuery0);
}
else
{
  flag = true;
}

if(flag == true)
{
  for(int l = 0;l<strCheckedId.length;l++)
  {
    System.out.println("strCheckedId[l].toString()  "+strCheckedId[l].toString());
    arrConcatenateId = strCheckedId[l].toString().split("@");
    strQuery11 = strQuery11 + "INSERT INTO TDC_EXPERT_MASTER(NUM_THEMATIC_AREA_ID,STR_EXPERT_ID) VALUES('"+arrConcatenateId[0].toString()+"','"+strUserId+"') #@#";
  }
  strQueryArr = strQuery11.split("#@#");
  int[] iCount ={};
  if(strQueryArr.length > 0)
  {
  try{
    iCount =  _dbq.batchInsert(strQueryArr);
    if(iCount.length >0)
    {
        System.out.println("Data is inserted");
             
    }
    else
    {
        System.out.println("data insertion is rollback");
    }
    }
    catch(Exception e)
    {
      System.out.println("error is in batch insert  "+e);
    }
  }
  }
  else
  {
      System.out.println("Data is not deleted");
  }
}
else
{
  strQuery0 = "DELETE FROM TDC_EXPERT_MASTER WHERE STR_EXPERT_ID='"+strUserId+"'";
  flag = _dbq.insert(strQuery0);
    if(flag == true)
    {
      System.out.println("data is deleted");
    }
    else
    {
      System.out.println("data is not deleted");
    }
}
}



%>

<%

  String strQuery = "";
  int iSize = 0;
  int i=0;
  int iCount = 1;
  String strQuery1 = "";
  String strThematicArea = "";
  String strThematicId = "";
  

  List arrlistGetResult = new ArrayList();
  List arrlistThematicArea = new ArrayList();
System.out.println("error");
strQuery = "SELECT R.STR_USER_ID,INITCAP(R.STR_FNAME) || INITCAP(NVL(R.STR_MNAME,' ')) || INITCAP(NVL(R.STR_LNAME,' ')),NVL(R.STR_E_MAIL,' '),NVL(R.STR_ORGANISATION,' '),NVL(R.STR_DESIGNATION,' '),R.STR_ALLOC_VERIFIED,(SELECT get_themetic_area_name(R.STR_USER_ID) from  dual),(SELECT get_themetic_area(R.STR_USER_ID) from  dual) FROM TDC_USER_REGISTRATION R WHERE R.STR_USER_TYPE='E' ORDER BY R.STR_ALLOC_VERIFIED";
arrlistGetResult = _dbq.fetchData(strQuery);
System.out.println("arrlistGetResult"+arrlistGetResult);
iSize = arrlistGetResult.size();
System.out.println("in second code");
%>

<script>
function submitData()
{
var flag = 0;
    if(document.allocatorVarrification.userIdChecked.length == null)
    {
      if(document.allocatorVarrification.userIdChecked.checked == true)
      {
        flag = 1;
      }
    }
    else
    {
      for(var i=0;i<document.allocatorVarrification.userIdChecked.length;i++)
          {
              if(document.allocatorVarrification.userIdChecked[i].checked == true)
              {
                flag = 1;
                break;
              }
          }
    }
    
    if(flag == 0)
    {
      alert("First Select a user for verification");
      return false;
    }
    else
    {
      var confirmation = confirm("Are you sure to verify these users");
      if(confirmation == true)
      {
      document.allocatorVarrification.submit();
      }
      else
      {
        return false;
      }
    }
}

function functionSelectAll()
{
   if(document.allocatorVarrification.selection.checked == true)
   {
        if(document.allocatorVarrification.userIdChecked.length == null)
        {
           document.allocatorVarrification.userIdChecked.checked = true;
        }
        else if(document.allocatorVarrification.userIdChecked.length > 0)
        {
          for(var i=0;i<document.allocatorVarrification.userIdChecked.length;i++)
          {
              document.allocatorVarrification.userIdChecked[i].checked = true;
          }
        }
   }
   else if(document.allocatorVarrification.selection.checked == false)
   {
        if(document.allocatorVarrification.userIdChecked.length == null)
        {
           document.allocatorVarrification.userIdChecked.checked = false;
        }
        else if(document.allocatorVarrification.userIdChecked.length > 0)
        {
          for(var i=0;i<document.allocatorVarrification.userIdChecked.length;i++)
          {
              document.allocatorVarrification.userIdChecked[i].checked = false;
          }
        }
   }
}

function functionGetThematicArea(theField)
{
//alert(theField.id);
var idx=theField.id;
var tidx=idx.substring(3);
var name = tidx+"td";
var userId = tidx;
var thematicId = document.getElementById(tidx).value;

   window.open("thematicArea.jsp?userId="+userId+"&thematicId="+thematicId,"Thematic Areas","scrollbars=yes,resizable=no,width=400,height=200,left=200,top=50");
}

                                              


</script>
</head>
  <body bgcolor="#E0FFFF"  topmargin="0" >
    <form name="allocatorVarrification" action="allocatorVarificationResult.jsp">
      <table width="100%" align="center" border="0"  bgcolor="#E0FFFF"  >
        <tr> 
          <td colspan="8" class="heading" bgcolor="#AFC7C7"  valign="middle">
            <b> &nbsp;Allocator Verification Form </b>
          </td>
        </tr>
        <tr> 
          <td width="2%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong>S.No</strong></font>
          </td>
          <td width="10%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong> User Id</strong></font>
          </td>
          <td width="10%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong>User Name </strong></font>
          </td>
          <td width="13%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong> E-Mail Id</strong></font>
          </td>
          <td width="15%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong> Organisation</strong></font>
          </td>
         <td width="15%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong> Designation</strong></font>
          </td>
          <td width="30%" class="heading" align="center" bgcolor="#AFC7C7">
            <font face="verdana" style="font-size: 9pt"><strong> Thematic Area</strong></font>
          </td>
          <td width="5%" class="heading" align="center" bgcolor="#AFC7C7">
          <font face="verdana" style="font-size: 9pt"><strong> Verified</strong></font>
           <input type="CHECKBOX" id="selection" name="selection" onclick="functionSelectAll() ">
          </td>
        </tr> 
        <% 
        if(iSize>0)
        {
        System.out.println("size is .... "+iSize);
        for(i=0;i<iSize;i=i+8)
        {
        %>
        <tr> 
       
          <td width="2%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= iCount%></strong></font>
          </td>
          <td width="10%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= arrlistGetResult.get(i).toString()%></strong></font>
          </td>
          <td width="10%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= arrlistGetResult.get(i+1).toString()%></strong></font>
          </td>
         <td width="13%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= arrlistGetResult.get(i+2).toString()%></strong></font>
          </td>
          <td width="15%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= arrlistGetResult.get(i+3).toString()%></strong></font>
          </td>
          <td width="15%" class="heading" align="left">
            <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400">&nbsp; <%= arrlistGetResult.get(i+4).toString()%></strong></font>
          </td>
            <%
            if(strUserId == null)
            {            
               if(arrlistGetResult.get(i+6) != null)
               strThematicArea = arrlistGetResult.get(i+6).toString();
               if(!strThematicArea.equals("NA"))
               {
                  strThematicArea = strThematicArea.substring(0,strThematicArea.lastIndexOf(","));
               }
               
               if(arrlistGetResult.get(i+7) != null)
               strThematicId = arrlistGetResult.get(i+7).toString();
               if(!strThematicId.equals("NA"))
               {
                  strThematicId = strThematicId.substring(0,strThematicId.lastIndexOf(","));
               }
           }
           else if(strUserId.equals(arrlistGetResult.get(i).toString()))
           {
           System.out.println("in else of second code");
              if(strCheckedId != null)
              {
                if(strCheckedId.length > 0)
                {
                String [] strConcatenated = {};
                strThematicId = "";
                strThematicArea = "";
                  for(int j=0;j<strCheckedId.length;j++)
                  {
                    strConcatenated = strCheckedId[j].toString().split("@");
                    if(j == 0)
                    {
                      strThematicId = strConcatenated[0].toString();
                      strThematicArea = strConcatenated[1].toString();
                    }
                    else
                    {
                      strThematicId = strThematicId+","+strConcatenated[0].toString();
                      strThematicArea = strThematicArea+","+strConcatenated[1].toString();
                    }
                  }
                }
              }
           }
            %>
          <td width="30%" class="heading" align="center">
           <font face="verdana" style="font-size: 8pt"><strong style="font-weight: 400"><div id="<%=arrlistGetResult.get(i).toString()+"td"%>"> <%= strThematicArea%> </div></strong></font>
          <input type="hidden" name="themeticids" id="<%=arrlistGetResult.get(i).toString()%>" value="<%=strThematicId%>" >
          <input type="button" name="edit"  id="<%="btn"+arrlistGetResult.get(i).toString()%>"   value="Edit" onclick="functionGetThematicArea(this)" >
          </td>
          <%
          System.out.println("value is..... "+arrlistGetResult.get(i+5).toString());
            if(arrlistGetResult.get(i+5).toString().equals("Y"))
            {
            %>
             <td width="5%" class="heading" align="center">
              <input type="CHECKBOX" checked="checked" id="userIdChecked" name="userIdChecked" value="<%=(arrlistGetResult.get(i).toString()+"-"+arrlistGetResult.get(i+1).toString()+"-"+arrlistGetResult.get(i+2).toString())%>" >
             
             </td> 
            <%
            }        
            else 
            {
            %>
             <td width="5%" class="heading" align="center">
              <input type="CHECKBOX" id="userIdChecked" name="userIdChecked" value="<%=(arrlistGetResult.get(i).toString()+"-"+arrlistGetResult.get(i+1).toString()+"-"+arrlistGetResult.get(i+2).toString())%>" >
             </td>
            <%
            }
          %>
          
        </tr> 
         <%
       iCount++;
       }%>
        <tr>
          <td align="center" colspan="8">
            <input type="button" name="verify" value="Verify" onclick="submitData()" >
              &nbsp;
            <input type="button" name="back" value="Back" >
          </td>
        </tr>
      <%
       }
       else
       {
       %>
          <tr> 
            <td class="heading" align="center" colspan="9">
              <font face="verdana" style="font-size: 9pt"><strong style="font-weight: 400"> There is no User for allocator varification.</strong></font>
            </td>
          </tr>
          <%
       }
       %> 
    </table>
  </form>
  </body>
</html>
