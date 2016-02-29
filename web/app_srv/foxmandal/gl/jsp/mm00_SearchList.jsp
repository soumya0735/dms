

<html>
<head>

<!-- Import Section -->
<%@ page import ="java.util.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

<title>ICMR Portal.....Developed and Designed by C-DAC, Noida</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/ICMR/app_srv/icmr/gl/theme/home.css" rel="stylesheet" type="text/css">
<%@ page import="in.cdacnoida.icmr.gl.adaptor.UserInformation" %>
<jsp:useBean id="DBQueryManager" scope="session" class="in.cdacnoida.icmr.gl.adaptor.DBQueryManager" />
<%
request.getSession(false);
//UserInformation _userinfo=(UserInformation)session.getAttribute("userInfo");



%>


<%
	int i,numcols=0,j,numrows=0;
	String Query="";
	ArrayList ArrayList_1= new ArrayList();
    String search_string1[]={""};

	//System.out.println("--------------Current Position Pankaj---------------------------------------"+request.getParameter("Currentposition"));

	if (request.getParameter("Currentposition") == null)
	{
		//will come in this if the form is called from the parent form
		i=0;
	}
	else
	{
		//will come in this if the form is called from itself like search,goto,navigation buttons
		i=Integer.parseInt(request.getParameter("Currentposition"));
    //System.out.println("I m here in else i is----"+i);
	}

	if (request.getParameter("Search")==null||request.getParameter("Search").equals(""))
	{
		//will come in this if the form is called from the parent form
		if (request.getParameter("order") == null)
		{
			//will come in this if the form is called from the parent form and order clause is not provided
			Query=request.getParameter("query");
      //System.out.println(Query);
		}
		else
		{
			//will come in this if the form is called from the parent form and order clause is provided
			Query=request.getParameter("query");
			Query=Query+ " order by " + request.getParameter("order");
      //System.out.println(Query);
		}
    System.out.println("Query from Search List is1234---------->"+Query);
	}
	else if (request.getParameter("Search")!=null)
	{
  //System.out.println(Query);
		//will come in this if the form is called from itself and search value is given
		String search_criteria=request.getParameter("search_string");		//variable used to store the search criteria
		if (request.getParameter("order") == null ||request.getParameter("order").equals(""))
		{
			//will come in this if the form is called from itself and search value is given and order clause is not provided
      //System.out.println(Query);
			//search_string1 = request.getParameter("STRING").split("#");
			search_string1 =request.getParameter("STRING").toString().split("#");

			for(int l=0;l<search_string1.length;l++)
			{
				if(search_string1[l].equals(search_criteria))
				{
					if(request.getParameter("where_clause").equals("YES"))
					{
						Query=request.getParameter("query") +" and UPPER("+search_criteria+") like UPPER(trim('%"+request.getParameter("Search")+"%')) ";
            //System.out.println(Query);
					}
					else
					{
						if(request.getParameter("where_clause").equals("NO"))
						{
							Query=request.getParameter("query") +" where UPPER("+search_criteria+") like UPPER(trim('%"+request.getParameter("Search")+"%')) ";
						  //System.out.println(Query);
            }
					}
	
				System.out.println("Query after search without order by------"+Query);
				}
			}
     System.out.println("Query from Search List is---------->"+Query);
		}
		else		//else will be executed if order clause is given in the query in parent window
		{

			   //search_string1 = request.getParameter("STRING").split("#");
			   search_string1 =request.getParameter("STRING").toString().split("#");
			   for(int l=0;l<search_string1.length;l++)
			    {
				  if(search_string1[l].equals(search_criteria))
				  {
					if(request.getParameter("where_clause").equals("YES"))
					{
							Query=request.getParameter("query") +" and UPPER("+search_criteria+") like UPPER(trim('%"+request.getParameter("Search")+"%')) ORDER BY "+request.getParameter("order").toString();
					}
					else
					{
						if(request.getParameter("where_clause").equals("NO"))
						{
							Query=request.getParameter("query") +" where UPPER("+search_criteria+") like UPPER(trim('%"+request.getParameter("Search")+"%')) ORDER BY "+request.getParameter("order").toString();
						}
					}
				    System.out.println("Query after search with orderby clause------"+Query);
				  }

				}
        System.out.println("Query from Search List is---------->"+Query);
		}
	}
	else
	{

		Query=request.getParameter("query");
    System.out.println("Query form Serch List is---------->"+Query);
	}
  
  System.out.println("Query form Serch List is---------->"+Query);
  
  
//out.println(Query);
	if (i==0)
	{
		//will come in this if the form is called from the parent form
		//System.out.println("i---------------"+i);
		//System.out.println("Query---------------"+Query);
		try
		{
                // substring query to check that it should be a select query only and not any other query
                String matchSelect=Query.trim().substring(0,6).toUpperCase();
                System.out.println("matchSelect==="+matchSelect);
                   if(matchSelect.equals("SELECT")){
                    ArrayList_1=DBQueryManager.fetchData(Query,0,10);
                    numcols=DBQueryManager.getNumberOfColumns();		//number of columns
                    numrows=DBQueryManager.getNumberOfRows();//number of rows
                    }			
		}
		catch(Exception e)
		{
		System.out.println("Exception found ...............ck");
		}

	}
	else
	{
		
		try
		{
		numcols=DBQueryManager.getNumberOfColumns();		//number of columns
    
		numrows=DBQueryManager.getNumberOfRows();			//number of rows
    
    ArrayList_1=DBQueryManager.moveData(i,i+10);
		}
		catch(Exception e)
		{
		
		ArrayList_1.add("No Data Found");
		System.out.println(".............ck.............");
		}
	}


	
	String Array_1[] =request.getParameter("Heading").toString().split("#");
	String target[]={""};											//Target field in the parent form
	String search_string[]={""};									//Search Fields Labels
	String isSubmit = new String();
	String where_clause = new String();
  String ckClose = new String();
  String function_name=new String();
	
	
	if (request.getParameter("target")!=null)
		target =request.getParameter("target").toString().split("#");
	if (request.getParameter("col")!=null)
		search_string =request.getParameter("col").toString().split("#");
	if (request.getParameter("coll")!=null)
		    search_string1=request.getParameter("coll").toString().split("#");
	if (request.getParameter("isSubmit")!=null)
	 	 isSubmit = request.getParameter("isSubmit").toString().toUpperCase();
	 	

	if (request.getParameter("where_clause")!=null)
	 	 where_clause = request.getParameter("where_clause").toString().toUpperCase();
  
  if (request.getParameter("ckClose")!=null)
	 	 ckClose = request.getParameter("ckClose").toString().toUpperCase();
   if (request.getParameter("function")!=null)
	 	 function_name = request.getParameter("function").toString();  
   else    
     function_name="";
%>

<Script language="JavaScript">


  function setPrev()
  {
    //function that shows previous ten records
    
    if ((document.form1.Currentposition.value-10)>=0)
    {
          //alert("Currentposition before====="+document.form1.Currentposition.value);
        document.form1.Currentposition.value=document.form1.Currentposition.value-(10*2);
         //alert("Currentposition after====="+document.form1.Currentposition.value);
        if(parseInt(document.form1.Currentposition.value) < 0)
        {
           if(parseInt(document.form1.Currentposition.value) == -10)
            {
              alert("No More Records");
            } 
            document.form1.Currentposition.value = 0;
        }   
        
        form1.submit();
    }
       
    else
    {
      alert("No More Records");
  
    }
  
    
  }

function setNext()
{
	//function that shows next ten records
		Curpos=parseInt(document.form1.Currentposition.value);
	
		max=parseInt(document.form1.Maxposition.value);
	
		if (Curpos<max)
		{
  
			form1.submit();
		}
		else
		{
	
    	alert("No More Records");
		}

}


 var str = "";
 var ckClose = "NO";
function Onclickradio()
{
	//function to set details of the selected record in the parent form
       
	
	if (document.form1.radio1==null)
	{
	 alert("No record available for selection");
	 return false;
	}
  
  
  
	
	if(document.form1.radio1.length >1)
	{
   for(i=0;i<document.form1.radio1.length;i++)
		{
			if(document.form1.radio1[i].checked==true)
			{
	
				str=document.form1.radio1[i].value;		//str contains all values seperated by #

        ckClose="YES";
			}
      

		}
   } 
  if(document.form1.radio1.length >1)
	{
   document.form1.ckClose.value="NO";
   for(i=0;i<document.form1.radio1.length;i++)
		{
			if(document.form1.radio1[i].checked==true)
			{
				ckClose="YES";
        document.form1.ckClose.value="YES";
        //alert("ckClose==="+ckClose);
        break;
			}    
		}
	}
	else
	{
		if(str == null)
			str = "";
		else
			str=document.form1.radio1.value;
	}
    if(str !="" ) // if any radio button is selected
	{
		arraylist=str.split('#');
		
<%

			if (target.length>0)			//target contains the number of parent-form-fields
		{
			for(int int_ctr=0;int_ctr<target.length;int_ctr++)
			{
				if (!target[int_ctr].equals(""))
				{
%>                                    
					window.opener.document.<%=target[int_ctr]%>.value=arraylist[<%=int_ctr%>];
<%
				}
			}if(!function_name.equals("")){%>
      window.opener.<%=function_name%>();
	<% }	}
%>
	}
	
}



function addWhereClause()
{
	if(document.form1.search_string.value=="")
	{
		alert("Select a Search Criteria...");
		document.form1.search_string.focus();
                    return false;
	}
	else if(trim(document.form1.Search.value)=="")
	{
		alert("Enter the Search String...");
		document.form1.Search.focus();
                return false;
	}
	else
	{
   
    ckClose="YES";
    //alert("pankaj--"+ckClose);
    document.form1.ckClose.value="YES";
		document.form1.Currentposition.value=0;

    while (document.form1.Search.value.substring(0,1) == ' ') {
    document.form1.Search.value = document.form1.Search.value.substring(1,document.form1.Search.value.length);
    }
    while (document.form1.Search.value.substring(document.form1.Search.value.length-1,document.form1.Search.value.length) == ' ') {
      document.form1.Search.value = document.form1.Search.value.substring(0,document.form1.Search.value.length-1);
    }
    
		document.form1.submit();
	}
}
function checkEnter(searchtxt,e){

        var characterCode = e.keyCode;
     
        if((characterCode == 13) && document.forms[0].Search.value.length > 0 )
        {
          addWhereClause();
          return true;
        }
        else
        {			
          return false;
        }
}
function setLast()
{
	//function that shows last ten records
	//alert("document.form1.Currentposition.value===b4=="+document.form1.Currentposition.value)
	document.form1.Currentposition.value=document.form1.Maxposition.value-10;
//	alert("document.form1.Currentposition.value====="+document.form1.Currentposition.value)

	form1.submit();
}

function setFirst()
{
	//function that shows first ten records

	document.form1.Currentposition.value=0;
	

	form1.submit();
}
function  viewAll()
{
	document.form1.Search.value="";
	document.form1.search_string.value="";


	document.form1.Currentposition.value=0;

	form1.submit();
}


function function_closeConnection(var_1)
{

  
   if(document.form1.ckClose.value=="NO")
    {
        alert("First Select Any Record");
        return false;
    }
    if("<%=isSubmit%>"=="YES")
    {
      //  alert("Pankaj");
		window.opener.document.forms[0].submit();
    window.close();
		}
    else
    {
      window.close();
    }


}



function trim(string) 
{
 while (string.substring(0,1) == ' ') {
    string = string.substring(1,string.length);
  }
  while (string.substring(string.length-1,string.length) == ' ') {
    string = string.substring(0,string.length-1);
  }
    return string;
}


</script>

</head>

<body>

<form name="form1" method="post">


<table class="data">

<input type="hidden" name="ckClose" value="<%=ckClose%>">

	<tr >
  
    <td align="right"> 
    <img src="/ICMR/app_srv/icmr/gl/images/arrow_start.gif" tabindex="1" onclick="setFirst()" class="hand">
    &nbsp;
    <img src="/ICMR/app_srv/icmr/gl/images/arrow_back.gif" tabindex="2" onclick="setPrev()" class="hand" > 
    </td>
  
 
		<td align="right"  class="generalButton"><input type="button" tabindex="3" name="button5" class="mediumsubmitbutton"
			value=" View All " onclick="viewAll()" 
			></td>
      <%
    String persistList="";
    if(request.getParameter("search_string")!=null)
    persistList=request.getParameter("search_string");
%>
		
		<td class="topBottom"  width="30%" align="left" >
    <select name="search_string" tabindex="4" class="generalCombo" >
			<option  value="">Pick a value....</option>
			
			<%
					for(int iii=0;iii<search_string.length;iii++)
					{
%>   
			<option value="<%=search_string1[iii]%>" <% if(persistList!= null && persistList.equals(%><%search_string1[iii]%><%) ){%>selected <%}%>  class="comboboxlarge">  <%=search_string[iii]%></option>  
       
   
			<%
      System.out.println(search_string[iii]+" -- "+search_string1[iii]);
					}
%>
		</select></td>
		<td class="topBottom" width="25%" align="center"><input type="text" name="Search" onkeypress="checkEnter(this,event);"  tabindex="5"  maxlength="200"
                 class="generalTbox" />
                <!--<td class="topBottom" width="25%" align="center"><Input type="text" name="Search" tabindex="5"  maxlength="200" class="generalTbox" value= "<% try{ if(request.getParameter("Search")==null) out.print("");else out.print(request.getParameter("Search"));}catch(Exception e){ } %>" /> -->
                        
		</td>
    <td class="topBottom" align="right"><input type="button" name="button6" tabindex="6" class="mediumsubmitbutton"
			value=" Search " onClick="addWhereClause()" >
    </td>
  
    <td align="left" > <img src="/ICMR/app_srv/icmr/gl/images/arrow_next.gif" onclick="setNext()" tabindex="7" class="hand">
   &nbsp;
    <img src="/ICMR/app_srv/icmr/gl/images/arrow_end.gif" onclick="setLast()" tabindex="8" class="hand">
    
    </td>
   
	</tr>
</table>

<table class="general" id="highlightwhite">
	
  <tr>
  		<td>
		
    <b><center><%=request.getParameter("Title")%></center></b>
		
		</td>
	</tr>
  
</table>

<div align="center">
<%	if(ArrayList_1.size()>0)
		{
		if(ArrayList_1.get(0).equals("No Data Found"))
          {//System.out.println("...........inside if.................");
      %> <strong><span class="generaltext" id="highlightback">No Data Is Available For The Selected Request...</span></strong></div>
      <%
          }


		else
		{   //System.out.println("...........>>>>>>>>>ELSE size is more than 0>>>>>>>.................");
      %>
      <table class="data">
        <tr>
        <thead>
        
          <th>
                  </th>
          <%
                int i_ctr_hr=0;
                for(i_ctr_hr=0;i_ctr_hr<Array_1.length;i_ctr_hr++)	//print the headers
                {
      %>
          <th>
          <%=Array_1[i_ctr_hr]%>
          </th>
          <%
                }
      %>
      </thead>
        </tr>
      
        <%
                int color_row=1;		//variable used for alternate color of rows
                String String_bgcolor=new String();
                j=0;
                while (j<ArrayList_1.size())
              {
                if((color_row)%2==1)
                  String_bgcolor="#ffffff"  ;
                else
                  String_bgcolor="#E1FFFF"  ;
                color_row++;
      %>
        <tr bgcolor=<%=String_bgcolor%>>
          <%
                  int i_ctr_col=0;
                  String str=new String();
                  //System.out.println("=========numcols======="+numcols);
                  for(i_ctr_col=0;i_ctr_col<numcols-1;i_ctr_col++)
                    str=str+ArrayList_1.get(j+i_ctr_col)+"#";
                    //System.out.println("======b4=========="+str);
      
                  str=str+ ArrayList_1.get(j+i_ctr_col);
                  //System.out.println("=========after======="+str);
      %>
          <td><input type="radio" name="radio1" tabindex="9" value="<%=str%>" id="<%=ArrayList_1.get(j)%>" onClick="{Onclickradio();function_closeConnection(this);}"></td>
          <%
                  //System.out.println("Array_1.length================"+Array_1.length);
      
                  for(i_ctr_col=0;i_ctr_col<Array_1.length;i_ctr_col++)
                  {
      %>
          <td><label for="<%=ArrayList_1.get(j+i_ctr_col)%>"><%=ArrayList_1.get(j+i_ctr_col)%></label>
          </td>
          <%
                  }
      %>
        </tr>
        <%
                  j=j+numcols;
              }					//end of while..
      
              i=i+10;
      %>
      
        <%
      }							//end of else...
      
		}//end of outer if
		else
		{
        %>
    
      <strong><span class="generaltext" id="highlightback">No Data Is Available For The Selected Request...</font></strong>
    
      <%
		}
%>

	<tr>
 
		<td><input type="hidden" name="Currentposition" value="<%=i%>"> <input
			type="hidden" name="Maxposition" value="<%=numrows%>"> <% if (request.getParameter("coll")!=null) { %>
		<input type="hidden" name="STRING"
			value="<%=request.getParameter("coll")%>"> <% } //System.out.println("...........gggggggggggggggggggggg.................");
      %>
		<input type="hidden" name="view" value="view"></td>
	</tr>
</table>

<center>
 
<input type="button" name="Return"  class="submitbutton" value="Close" tabindex="11"
	onClick="window.close(self);" ></center>  
</form>
</body>
</html>
