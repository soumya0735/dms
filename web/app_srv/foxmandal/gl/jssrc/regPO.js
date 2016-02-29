function checkDuplicacy(theFlag) {

   if(document.forms[0].strDocpass.value!="" &&  document.forms[0].password.value!="") 
   {
     if(document.forms[0].strDocpass.value==document.forms[0].password.value) 
     {
            alert("Private Key Password and Login password Cannot be Same.");
             if(theFlag=="P")
             { 
             document.forms[0].password.value="";
             document.forms[0].confirmpassword.value="";
             }
             else 
             {
             document.forms[0].strDocpass.value="";
             document.forms[0].strDocConPass.value="";
             }
     return false;
     }
     else
      return true;
     
   }
   else
    return true;
}
function chkYear(these)
{

    
   if(document.forms[0].strDob.value=="")
   {
        alert("Please Select Date of Birth.");
        document.forms[0].strDob.value="";
        these.value="";
        document.forms[0].strDob.focus();
        return false;
        
   }
    else
  {
        var dob=document.forms[0].strDob.value;
        var deg_year=these.value;
        dob=dob.substring(6, 10);
        if(eval(deg_year-dob)<15)
        {
          alert("You should be minimum 10th passed to register for this system.");
          these.value="";
          these.focus();
          return false;
        }
        
  }
}





function isDate(ExpiryDate)
{     
        if (ExpiryDate.length !== 10) 
          {        
              return false;   
          }    
           
          if (ExpiryDate.substring(2, 3) !== '-' || ExpiryDate.substring(5, 6) !== '-')
          {   
             return false;   
          } 
          
          return true;
       

}

function date_chk(these)
{
    
    if(these.value!="")
    {
       if (isDate(these.value)) 
       {         
            
       
        var date = new Date();
        var d  = date.getDate();
        var day = (d < 10) ? '0' + d : d;
        var m = date.getMonth() + 1;
        var month = (m < 10) ? '0' + m : m;
        var yy = date.getYear();
        var year = (yy < 1000) ? yy + 1900 : yy;
        var t2=day + "-" + month + "-" + year;
        var t1= these.value;
        var one_day=1000*60*60*24; 


        var x=t1.split("-");     
        var y=t2.split("-");
  

        var date1=new Date(x[2],(x[1]-1),x[0]);
  
        var date2=new Date(y[2],(y[1]-1),y[0])
        var month1=x[1]-1;
        var month2=y[1]-1;
        
        
               
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day)); 
        if(_Diff<6570)
        {
            alert("You should be minimum 18 years in age to register."); 
            these.value="";
            these.focus();
            return false;
        }
        else
        {
          return true;
        }
        
             
     }     
      else 
      {         
        alert('Invalid date format!'); 
        these.value="";
        these.focus();
        return false;
      }  
  }
 
}

function userId(field) 
{
	var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.";
	var ok = "yes";
	var temp;
	var field_val_len=field.value.length;
	var new_field_value="";
	
	for (var i=0; i<field_val_len; i++) 
	{
		temp = "" + field.value.substring(i, i+1);
		
		if (valid.indexOf(temp) == "-1") ok = "no";
	}
	
	if (ok == "no") 
	{
		alert("Please enter only alphabets,numbers or dot(.) in User Id.");
		field.value="";
		field.focus();
		field.select();
		return false;
	}
	
	for (var i=0; i<field_val_len; i++) 
	{	
		
		temp = "" + field.value.substring(i, i+1);
		
		
		if (temp == "'") 
			{
			
				
				
				//new_field_value=new_field_value+"\\"+temp;
			
			}
		else	
			{
				
				new_field_value=new_field_value+temp;
			}
	
		
	}
	field.value=new_field_value;
	
	
}





function degreeType(field) 
{

	var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ(),-";
	var ok = "yes";
	var temp;
	var field_val_len=field.value.length;
	var new_field_value="";
	
	for (var i=0; i<field_val_len; i++) 
	{
		temp = "" + field.value.substring(i, i+1);
		
		if (valid.indexOf(temp) == "-1") ok = "no";
	}
	
	if (ok == "no") 
	{
		alert("Numbers and special characters are not allowed !");
		field.value="";
		field.focus();
		field.select();
		return;
	}
	
	for (var i=0; i<field_val_len; i++) 
	{	
		
		temp = "" + field.value.substring(i, i+1);
		
		
		if (temp == "'") 
			{
			
				
				
				//new_field_value=new_field_value+"\\"+temp;
			
			}
		else	
			{
				
				new_field_value=new_field_value+temp;
			}
	
		
	}
	field.value=new_field_value;
	
	
}

function checkContactNo()
{
if(document.forms[0].orgSTD.value=="" || document.forms[0].orgContactNo.value=="")
{
if(document.forms[0].mob_no.value=="")
{
alert("Please Enter atleast one \n Organisation No. or Mobile No.");
return false;
}
else return true;
}
else
return true;
}



function setFocus()
{

if(document.forms[0].usrtype.value=="U" || document.forms[0].usrtype.value=="A")
document.forms[0].utype[0].checked = true;
else
document.forms[0].utype[1].checked = true;
   
 
}
   
      
function loadStateUserDIS(strEvent)
{

//var selected=document.forms[0].state.value;
var strUserID=document.forms[0].user_id.value;
var strSelectedID=document.forms[0].th_area.value;
var url="";
var url1="";
var url2="";
//alert(document.forms[0].state.value);
//alert(document.forms[0].user_id.value);
 if(strEvent=='O') 
 {
  if (strSelectedID!= null)
     url2="invPOAction.do?hmode=getDecipline&maDis="+strSelectedID; 
 }
   



 else if(strEvent=='U')

 {
 if(strUserID!= null)
 
 
   url1="invPOAction.do?hmode=checkUserID&userID="+strUserID;
  
 }
 


 
 
   	
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
		
   
   
    if (strEvent=='O')
   {
        http_request4.open("GET", url2, true);
			http_request4.onreadystatechange = loadUommajData;
      http_request4.send(null);
   }
   
    else
      {
      if(strEvent=='U' && strUserID!="")
      http_request4.open("GET", url1, true);
			http_request4.onreadystatechange = loadUserID;
      http_request4.send(null);
    }
			
}
    
    
    
function loadUomData()
{
var frm=document.forms[0];


	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
			var o=document.getElementById("strCity");
			len=o.childNodes.length;

			for(var rem=len;rem>1;rem--){
				o.removeChild(o.childNodes[rem-1]);
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
				
							
		
				    
				}
		}
}
    
 function loadUserID()
{

   if(http_request4.readyState == 4)
   {
      //alert(http_request2.status);
    if(http_request4.status == 200) 
    {
       var str = http_request4.responseXML.documentElement;
       var x= str.getElementsByTagName("UserID");
      
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
        alert("User ID "+document.forms[0].user_id.value+" already exists.");
        document.forms[0].user_id.value="";
        document.forms[0].user_id.focus();
        
       }
     
          
     }
}
}
   
 
   
function passwordcheck(theValue,theValue2,theFlag)
  {
       var thisValue=theValue.value;
        var valueToCompare= theValue2.value;
        var len=thisValue.length;
        for(var i=0;i<len;i++)
        {
            if(thisValue.charAt(i)==" ")
            {
              alert("Space not allowed!");
              theValue.value="";
              //theValue.focus();
              return false;
            }
        }
        


         if(valueToCompare!="" && thisValue!="")
        {
            if(thisValue!=valueToCompare)
		{
                alert("Password is not same as confirm password.");
                //document.forms[0].confirmpassword.value="";
                 theValue2.value="";
                 return false;
             } 
              
        }
      else if(valueToCompare=="" && thisValue=="")
      {
        return false;
      }
    else if(valueToCompare=="" && thisValue!="")
      {
        
        if(theFlag=='P')
        {
          return false
        }
        else if(theFlag=='C')
         {
              //alert("First enter value in  confirm password");
              //theValue2.focus();
              return false;
          }
      }
  }

function  checkPE(thisEvent)
{
//alert(thisEvent);
 if(thisEvent=="P" || thisEvent=="W")
      document.getElementById("thematicAreaID").style.visibility="hidden";
  else if(thisEvent=="E")
        document.getElementById("thematicAreaID").style.visibility="visible";
}

function checkLength(these,minlength,maxlength) 
{
    if(these.value=="")
      return false;
   
    if(these.value!="")
    {
        var length=these.value.length;
       
        if(length>maxlength) 
        {
            alert("More than "+maxlength+" characters not allowed in "+these.id+".");
            these.value="";
            these.focus();
            return false;
        }
        if(length<minlength) 
        {
            alert("Less than "+minlength+" characters not allowed in "+these.id+".");
            these.value="";
            these.focus();
            return false;
        }
       
    }
     return true;
}




function checkZero(field) 
{
                
                if(field.value!="")
                {
                
                         var len=field.value.length;
                         var count=0;
                         for(var k=0;k<len;k++) 
                         {
                             if(field.value.charAt(k)=="0") 
                             {
                                 count++;
                             }
                         }
                         if(count==len) 
                         {
                              alert(field.id+" :Can't be zero.");
                              
                              field.value="";
                              
                              field.focus();
                            
                             return false;
                             
                         }
                         else
                         return true;
    
               }
    
}





function check_mandatory(thisEvent)
{

var flag1=false;
//var flag1=true;
var temp;
var fields=new Array();
var fieldDesc=new Array();
if(thisEvent.value=='Submit')
{


             // fields=new Array("user_id","password","confirmpassword","fullname","lname","desig","strDob","org","temp_add","state","city","zcode","mob_no","emailid","strResearch","resumeFile","strDocpass","strDocConPass");	
  //fieldDesc= new Array("User id","Password","Confirm Password","Full Name","Last Name","Designation","Date Of Birth"," Name of the Institute","Correspondence Address","State","City","Zip Code","Mobile Number","Email ID","Research Specialization","Resume","Private Key Password ","Confirm Private Key Password ");


  fields=new Array("user_id","password","confirmpassword","th_area","majorArea","strTitle","fullname","lname","desig","strDob","emailid","strResearch","strDocpass","strDocConPass");	
  fieldDesc= new Array("User id","Password","Confirm Password","Broad Area","Major Discipline","Select Your Title","Full Name","Last Name","Designation","Date Of Birth","Email ID","Research Specialization","Private Key Password ","Confirm Private Key Password ");


}
else
{
   fields=new Array("user_id","password","confirmpassword","th_area","majorArea","strTitle","fullname","lname","desig","strDob","emailid","strResearch");	
  fieldDesc= new Array("User id","Password","Confirm Password","Broad Area","Major Discipline","Select Your Title","First Name","Last Name","Designation","Date Of Birth","Email ID","Research Specialization");


}



var confirmation="";
 for(i=0;i<fields.length;i++)
 {
    temp=fields[i];
     if(eval("document.forms[0]."+temp+"").value=="")
     {
     
             alert("Mandatory Field Missing: "+fieldDesc[i]+".");
             flag1=false;
             eval("document.forms[0]."+temp+"").focus();
             break;
            
    }

    else
    {
        flag1=true;
    }
  } 

  if(flag1)
    {
      if(thisEvent.value=='Submit')
      { 
     
           var stat=check_file_Image(); 
           //alert("stat="+stat);
         if(stat==false)
           return false;
           
           var status = checkValuespo(thisEvent.value);
             //alert(" status="+ status);
             if(status == false)
                {
                 return false;
                 }
           
             var flag = 0;
             
        

             
    
              
                //if(checkContactNo())
                //{
                      confirmation = confirm("Do you want to proceed with the registration ?");
                      if(confirmation == true)
                        {
                          
                          //document.forms[0].hmode.value="SaveExpert";
                            document.forms[0].hmode.value="Save";
                          
                            document.getElementById('login').style.display='inline';
                            document.getElementById('loginpopupObject').style.display='inline';
                          document.forms[0].submit();
                        }
                      else
                     
                          return false;
                //}
                
              
                
                
              }
                
                 /*  if(checkContactNo())
                    {
                      confirmation = confirm("Are you sure to Register ");
                      if(confirmation == true)
                        {
                          //document.forms[0].hmode.value="SaveExpert";
                          document.forms[0].hmode.value="Save";
                          document.forms[0].submit();
                        }
                      else
                          return false;
                    }
                    else
                      return false; */
                                  
              
   
        
        
       
         
         if(thisEvent.value=='Modify')
         {
            
                 
                     var stat1=check_file_Image(); 
                      if(stat1==false)
                     return false;  
                     
                      var status1 = checkValuespo(thisEvent.value);
                       
                 if(status1 == false)
                 {
                
                  return false;
                 }
               
                   // if(checkContactNo())
                    //{
                   
                      confirmation = confirm("Do you want to proceed with the modification?");
                      if(confirmation == true)
                        {
                          document.forms[0].hmode.value="update";
                         document.forms[0].action="invPOAction.do";
                          document.forms[0].submit();
                        }
                      else
                          return false;
                   // }
            
           } 
        }
         
         else {
             
         }  
         
         
      
 }  


function Cancel(thisEvent)
{
           
          location.href="/ICMR/invPOAction.do"; 
          
}
function check_file_Image()
{
var imageFile = "";
imageFile = document.forms[0].imageFile.value;
 if(imageFile!="")
    {
    
      var to_lowerImage = imageFile.toLowerCase();
          if(to_lowerImage.lastIndexOf(".jpg")==-1)
          {
                if(to_lowerImage.lastIndexOf(".jpeg")==-1)
                {
                   alert("Please upload only .jpg extension for Image.");
                   return false;
                 }
          }
          
  }

}

function check_file_Resume()
{
var resumeFile = "";
resumeFile = document.forms[0].resumeFile.value;
if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension for Resume.");
                 return false;
          }          
    }
}


 
    function checkValuespo(these)
 {
 if(these=='Submit') 
     {  
    if(document.forms[0].user_id.value != "")
    {
       if(checkLength(document.forms[0].user_id,6,25)==false||userId(document.forms[0].user_id)==false)
       {
         
          return false;
      }
    }
    
  if(document.forms[0].password.value != "")
    {
       if(checkLength(document.forms[0].password,6,50)==false||checkDuplicacy('P')==false||passwordcheck(document.forms[0].password,document.forms[0].confirmpassword,'P')==false)
       {
         
          return false;
      }
    }   
    
    
    
     if(document.forms[0].confirmpassword.value != "")
    {
       if(checkLength(document.forms[0].confirmpassword,6,50)==false||passwordcheck(document.forms[0].confirmpassword,document.forms[0].password,'C')==false)
       {
         
          return false;
      }
    }   
     }

 
     if(document.forms[0].fullname.value != "")
    {
       if(isAlphabetWithApos(document.forms[0].fullname) == false||checkLength(document.forms[0].fullname,1,20)==false)
       {
        
          return false;
      }
    }
    if(document.forms[0].mname.value != "")
    {
      if(isAlphabetWithApos(document.forms[0].mname) == false||checkLength(document.forms[0].mname,1,20)==false)
      {
     
        return false;
      }
    }
     if(document.forms[0].lname.value != "")
    {
      if(isAlphabetWithApos(document.forms[0].lname) == false||checkLength(document.forms[0].lname,1,20)==false)
      {
     
        return false;
      }
    }
    
    if(document.forms[0].desig.value != "")
    {
      if(isAlphaNumeric(document.forms[0].desig) ==false||checkLength(document.forms[0].desig,2,50)==false||checkZero(document.forms[0].desig)==false)
      {
      
        return false;
      }
    }
     
 if(document.forms[0].strDob.value != "")
    {
      if(date_chk(document.forms[0].strDob) == false)
      {
      
        return false;
      }
    }
    
    
   
     
    if(document.forms[0].orgSTD.value != "")
    {
      if(isNumber(document.forms[0].orgSTD) == false)
      {
      
        return false;
      }
    }
    if(document.forms[0].orgContactNo.value != "")
    {
      if(isNumber(document.forms[0].orgContactNo) == false)
      {
     
        return false;
      }
    }
    if(document.forms[0].orgExt.value != "")
    {
      if(isNumber(document.forms[0].orgExt) == false)
      {
      
        return false;
      }
    }
     if(document.forms[0].mob_no.value != "")
    {
      if(isNumber(document.forms[0].mob_no) == false)
      {
     
        return false;
      }
    }
    if(document.forms[0].fax_no.value != "")
    {
      if(isNumber(document.forms[0].fax_no) == false)
      {
      
        return false;
      }
    }
    if(these=='Submit') 
     {
     if(document.forms[0].strDocpass.value != "")
    {
       if(checkLength(document.forms[0].strDocpass,6,25)==false||passwordcheck(document.forms[0].strDocpass,document.forms[0].strDocConPass,'P') == false||checkDuplicacy('D')==false)
       {
         
          return false;
      }
    }   
    
    
     if(document.forms[0].strDocConPass.value != "")
    {
       if(checkLength(document.forms[0].strDocConPass,6,25)==false||passwordcheck(document.forms[0].strDocpass,document.forms[0].strDocConPass,'C')==false)
       {
         
          return false;
      }
    } 
    
     }
  
 }


function isAlphaNumeric(alphane)
{

	var numaric = trim(alphane.value);
	//alert(numaric);
	for(var j=0; j<numaric.length; j++)
		{
		//alert("in funvtion");
		  var alphaa = numaric.charAt(j);
		  //alert(alphaa);
		  var hh = alphaa.charCodeAt(0);
		  //alert(hh);
		  if((hh > 47 && hh<58) || (hh > 64 && hh<91) || (hh > 96 && hh<123))
		  {
		  
		  //return true;
		  }
		else if((hh==39)||(hh==64)||(hh==60)||(hh==62)||(hh==61)||(hh==34)|| (hh==35)||(hh==33)||(hh==36)||(hh==37)||(hh==94)||(hh==126))	{
		alert("These  String is not valid .Don't Enter  ' , @ , < , > , = , ^ , ! , * , % , $ \ characters");
			//alert(numaric);
		//alert(numaric.substring(0,numaric.length-1));
		//alphane.value=numaric.substring(0,numaric.length-1);
		alphane.value="";
    alphane.focus();
    
    //alphane.select();
		return false;
		  }
		}

}

function isAlphabet(thisField) 
{
	thisField.value=trim(thisField.value);
	if(thisField.value!="")
	{
		for(var i = 0; i < thisField.value.length; i++) 
		{
			var ch = thisField.value.substring(i,i+1);
			//alert(ch);
			if(ch>="A" && ch<="Z") { 			
			} else if(ch>="a" && ch<="z") {
			} else if(ch == " ") {
			} else if(ch== "."){}
			 else{
				alert("Enter only alphabets.");
				thisField.value="";
				thisField.focus();
				//thisField.select();
				return false;
			}
		}
	}
	//checkDomain(thisField); 
}


function isNumber(theField)
{
var theInput, theLength;	
	theInput = theField.value;
 
	theLength = theInput.length;
	var okNum =  "ALLOK";
	var charSpe = false;
	if(theLength == 0)
		{
			return(false);
	}
	for(var i=0; i<theLength; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
					okNum = "notOK";
					charSpe = theInput.substring(i, i+1);
					break;
		}
	}
	if (okNum == "notOK")
	{
		alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a valid Number.");
		theField.value="";
		theField.focus();
		return false;
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


function date_val(these)
{
    
    if(these.value!="")
    {
       if (isDate(these.value)) 
       {         
            
       
        var date = new Date();
        var d  = date.getDate();
        var day = (d < 10) ? '0' + d : d;
        var m = date.getMonth() + 1;
        var month = (m < 10) ? '0' + m : m;
        var yy = date.getYear();
        var year = (yy < 1000) ? yy + 1900 : yy;
        var t2=day + "-" + month + "-" + year;
        var t1= these.value;
        var one_day=1000*60*60*24; 


        var x=t1.split("-");     
        var y=t2.split("-");
  

        var date1=new Date(x[2],(x[1]-1),x[0]);
  
        var date2=new Date(y[2],(y[1]-1),y[0])
        var month1=x[1]-1;
        var month2=y[1]-1;
        
        
               
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day)); 
        
        if(_Diff>=0)
        {
            alert("Please select date greater than current date "); 
            these.value="";
            these.focus();
            return false;
        }
        else
        {
          return true;
        }
        
             
     }     
      else 
      {         
        alert('Invalid date format!'); 
        these.value="";
        these.focus();
        return false;
      }  
  }
 
}



function meeting_date(these)
{
   if(these.value!="")
    {
               
            
       
        var date = new Date();
        var d  = date.getDate();
        var day = (d < 10) ? '0' + d : d;
        var m = date.getMonth() + 1;
        var month = (m < 10) ? '0' + m : m;
        var yy = date.getYear();
        var year = (yy < 1000) ? yy + 1900 : yy;
        var t2=day + "-" + month + "-" + year;
        var t1= these.value;
        var one_day=1000*60*60*24; 


        var x=t1.split("-");     
        var y=t2.split("-");
  

        var date1=new Date(x[2],(x[1]-1),x[0]);
  
        var date2=new Date(y[2],(y[1]-1),y[0])
        var month1=x[1]-1;
        var month2=y[1]-1;
        
        
               
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day)); 
        
        if(_Diff>0)
        {
            alert("Please select Date between System Date and End Date "); 
            these.value="";
            these.focus();
            return false;
        }
        else
        {
          return true;
        }
        
          
        
  }
 
}





function loadMajDisp()
{

var selected=document.forms[0].th_area.value;

var url="";

//alert(document.forms[0].state.value);
//alert(document.forms[0].user_id.value);



  if(selected!= null)
    url="invPOAction.do?hmode=getDecipline&maDis="+selected;   
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
			http_request4.onreadystatechange = loadUommajData;
      http_request4.send(null);

   
    
			
}
    


function loadUommajData()
{


var frm=document.forms[0];
	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
			var o=document.getElementById("maj_area");
			len=o.childNodes.length;

			for(var rem=len;rem>1;rem--){
				o.removeChild(o.childNodes[rem-1]);
			}
			
					
			var x= str.getElementsByTagName("UOMJ");
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
		}
}



function checkEmail()
{

var vartitle=document.forms[0].strexpertmail.value;

var url="";



 if(vartitle!="")
 {
    
   url="invPOAction.do?hmode=checkEmailID&pEmail="+vartitle;		
        
	
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
	http_request4.onreadystatechange = loadEmail;
    
        http_request4.send(null);
        
    }
    // display an error in case of failure
    catch (e)
    {
      alert("Can't connect to server:\n" + e.toString());
    }

        
        
 }
else
return false;
}
   
    
			




 function loadEmail()
{
 
  //alert("inside loadtitle"+http_request1.readyState);
  //alert("inside loadtitle"+http_request1.status);
   if(http_request4.readyState == 4)
   {
   
     
    if(http_request4.status == 200) 
    {
     //alert("x5");
       var str = http_request4.responseXML.documentElement;
      
       var x= str.getElementsByTagName("EmailID");
      
  
       if(x[0].childNodes[0].attributes[0].nodeValue!='2')
       {
        alert("This email id '"+x[0].childNodes[0].attributes[0].nodeValue+"' has already been registered.");
        document.forms[0].strexpertmail.focus();
        return false;
       }
       else 
       {
        var answer = confirm("Are you sure to go ahead with this invitation(s)?")
           if (answer)
           {
            document.forms[0].action="/ICMR/invPOAction.do?hmode=save"
            document.forms[0].method="post";
            document.forms[0].submit();
            alert("Invitation mail has been sent successfully");
           }
           
       }
      
      
     }
  
}

 
}






