var http_request4;
function loadMajDis()
{

var selected=document.forms[0].th_area.value;

var url="";




  if(selected!= null)
    url="abstractsubmission.do?hmode=getDecipline&matType="+selected;   
else
   return false;	
			if (window.XMLHttpRequest) // Mozilla, Safari,...
			{ 
		    		http_request4 = new XMLHttpRequest();
		    //	alert('Mozilla');
			} 
			else if (window.ActiveXObject)  // IE
			{
      // alert('IE');
				try {
		
					http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
		 //alert('IE  2'+http_request4);
				}
				catch (e) {
					try {
		
						http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
		// alert('IE   3'+http_request4);
					}
					catch (e) {}
				}
			}
			
			if (!http_request4) {
				alert('Giving up :( Cannot create an XMLHTTP instance');
				return false;
			}
		
   
    	http_request4.open("GET", url, true);
			http_request4.onreadystatechange = loadUomData1;
      http_request4.send(null);

   
    
			
}
    


function loadUomData1()
{
var frm=document.forms[0];
	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
			 var o=document.getElementById("maj_area");
			len=o.childNodes.length;

			for(var rem=len;rem>1;rem--){
                            //alert("more");
                            o.removeChild(o.childNodes[rem-1]);
                            //alert("mor43434e");
			}		
			var x= str.getElementsByTagName("UOM");
                        
			for(var y=0;y<x[0].childNodes.length;y++)
					{
                                       
                                        partOption1=document.createElement("option");
                                        partOption1.value=x[0].childNodes[y].attributes[1].nodeValue;
                                        partOption1.innerText=x[0].childNodes[y].attributes[0].nodeValue;
                                        partOption1.text=x[0].childNodes[y].attributes[0].nodeValue;
                                        o.appendChild(partOption1);										
					}
                                        
				if(document.forms[0].multiDis.value!="a")
                                         document.forms[0].maj_area.value=document.forms[0].multiDis.value;                              
                                 
				}
                                 $("#maj_area").trigger("liszt:updated"); 
                                 $("#th_area").trigger("liszt:updated");
		}
}


function RemoveWhiteSpaces(theField) 
{

 t=0;
 var strValue=theField.value;
 if(strValue!="")
 {
 while (t==0) 
 {
 if(strValue.indexOf("  ")!=-1)
  {
     strValue=strValue.replace("  "," ");
  }  
  else
   t=1;
 }
 }
 theField.value=strValue;
    
}
function checkTitle()
{

var vartitle=document.forms[0].title.value;

var url="";

if(document.forms[0].title.value=="")
 return false;
else
    url="abstractsubmission.do?hmode=checkProposalTitle&pTitle="+vartitle+"&propId="+document.forms[0].prop_id.value;		
  
			if (window.XMLHttpRequest) // Mozilla, Safari,...
			{ 
		    		http_request4 = new XMLHttpRequest();
		    	//alert('Mozilla');
			} 
			else if (window.ActiveXObject)  // IE
			{
      // alert('IE');
				try {
		
					http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
		// alert('IE  2'+http_request1);
				}
				catch (e) {
					try {
		
						http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
		/// alert('IE   3'+http_request1);
					}
					catch (e) { alert("1");
                                        }
				}
			}
			
			if (!http_request4) {
				alert('Giving up :( Cannot create an XMLHTTP instance');
				return false;
			}
		
    
    	//http_request4.open("POST", url, true);
	//http_request4.onreadystatechange = loadTitle();
       
       
        //http_request4.send(null);
        
        
        
        
        
        
         try
    {
    
      // initiate server request
      http_request4.open("GET", url, true);
	http_request4.onreadystatechange = loadTitle;
    
        http_request4.send(null);
        
    }
    // display an error in case of failure
    catch (e)
    {
      alert("Can't connect to server:\n" + e.toString());
    }

        
        
 }

   
    
function checkTitleonSubmit()
{
var vartitle=document.forms[0].title.value;

var url="";

if(document.forms[0].title.value=="")
 return false;
else
    url="abstractsubmission.do?hmode=checkProposalTitle&pTitle="+vartitle+"&propId="+document.forms[0].prop_id.value;		
  
			if (window.XMLHttpRequest) // Mozilla, Safari,...
			{ 
		    		http_request4 = new XMLHttpRequest();
		    	//alert('Mozilla');
			} 
			else if (window.ActiveXObject)  // IE
			{
      // alert('IE');
				try {
                                    http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
		// alert('IE  2'+http_request1);
				}
				catch (e) {
					try {
		
						http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
		/// alert('IE   3'+http_request1);
					}
					catch (e) { alert("1");
                                        }
				}
			}
			
			if(!http_request4) {
				alert('Giving up :( Cannot create an XMLHTTP instance');
				return false;
			}
		
    
    	//http_request4.open("POST", url, true);
	//http_request4.onreadystatechange = loadTitle();
       
       
        //http_request4.send(null);
        
        
        
        
        
        
         try
    {
    
      // initiate server request
      http_request4.open("GET", url, true);
	http_request4.onreadystatechange = loadTitleOnSubmit;
    
        http_request4.send(null);
        
    }
    // display an error in case of failure
    catch (e)
    {
      alert("Can't connect to server:\n" + e.toString());
    }

        
        
 }		


 function loadTitleOnSubmit()
{
 
  //alert("inside loadtitle"+http_request1.readyState);
  //alert("inside loadtitle"+http_request1.status);
   if(http_request4.readyState == 4)
   {
   
     
    if(http_request4.status == 200) 
    {
     //alert("x5");
       var str = http_request4.responseXML.documentElement;
      
       var x= str.getElementsByTagName("TitleID");
  
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
        alert("This Proposal Title : ' "+document.forms[0].title.value+ " ' already submitted by you.");
        document.forms[0].title.value="";
        document.forms[0].title.focus();
        
       }
       else 
       {
        var check = false;

      if (document.forms[0].operation.value == "Add")
          check = confirm("Do You Really Want to Add This Proposal?");
      else if (document.forms[0].operation.value=="ReSubmit")     
      check=confirm("Do You Really Want to Resubmit This Proposal?");
      else if (document.forms[0].operation.value == "Modify")

          check = confirm("Do You Really Want to Modify This Proposal?");
      else {
          alert("You Have Selected Wrong Operation");
          check = false;
      }

      if (check == true) {
          alert("Please note that the Broad Area,Major Discipline and Related Discipline can be changed by ICMR authorities as they deem fit.");  
          document.forms[0].hmode.value = "SubmitAction";
          document.forms[0].strOperation.value = document.forms[0].operation.value;
          document.forms[0].action="abstractsubmission.do";
          document.forms[0].submit();
      }
       
           
       }
     }
}
}


 function loadTitle()
{
 
  alert("inside loadtitle"+http_request1.readyState);
  //alert("inside loadtitle"+http_request1.status);
   if(http_request4.readyState == 4)
   {
   
     
    if(http_request4.status == 200) 
    {
     alert("x5");
       var str = http_request4.responseXML.documentElement;
      
       var x= str.getElementsByTagName("TitleID");
  
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
        alert("This Proposal Title : ' "+document.forms[0].title.value+ " ' already submitted by you.");
        document.forms[0].title.value="";
        document.forms[0].title.focus();
        
       }
     
          
     }
}
}






function check_file()
{
var propFile = "";
propFile = document.forms[0].imageFile.value;
if(propFile!="")
    {
    var to_lowerResume = propFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension for Proposal.");
                 return false;
          }          
    }
}

