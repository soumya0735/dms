



function checkMaxlen(these,maxlength,minlength) 
{
  
  
    if(these.value!="")
    {
        var length=these.value.length;
       
        if(length>maxlength) 
        {
            alert("Entered value for "+these.id+" exceeds maximum length of "+maxlength+" characters.");
            these.value="";
            these.focus();
            return false;
        }
        if(length<minlength) 
        {
            alert("Enter atleast "+minlength+" characters for "+these.id+".");
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
                              alert(field.id+" Can Not be Zero.");
                              field.value="";
                              field.focus();
                            
                             return false;
                             
                         }
                         else
                         return true;
    
               }
    
}




function checkDuplicacy(theFlag) {

   if(document.forms[0].strDocpass.value!="" &&  document.forms[0].password.value!="") 
   {
     if(document.forms[0].strDocpass.value==document.forms[0].password.value) 
     {
            alert("Private Key Password and Login password Cannot be Same");
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

//for degree check if DOB and degree year are valid
function chkYear(these)
{
   
   
    var date = new Date();
    var yy = date.getYear();
    var year = (yy < 1000) ? yy + 1900 : yy;
    var deg_year=these.value;
   
    var dob=document.forms[0].strDob.value;
    dob=dob.substring(6, 10);
  /* if(document.forms[0].strDob.value=="")
   {
        alert("Please Select Date of Birth");
        document.forms[0].strDob.value="";
        these.value="";
        document.forms[0].strDob.focus();
        return false;
        
   } */
   //else
   //{
   
                
                 
                   
                // if(document.forms[0].strDob.value!="")
               //{   
                    
                 /* if(deg_year!="")
                       {
                  
                    if(eval(deg_year-dob)<18)
                    {
                      alert("You have entered invalid degree year.");
                      these.value="";
                      these.focus();
                      return false;
                    }
                    else 
                    { */
                       
                                   if(deg_year>year) 
                            {
                                  alert("Degree year entered should not be greater than current year.");
                                  these.value="";
                                  these.focus();
                                  return false;
                                
                            }
                       
                       
                       
                        
                    //}
               // }
             //}
    
   }
    
  
  
  
  
//}





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
       if (isDOB(these)) 
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
        var dobpluseighteen=parseInt(x[2])+18;
        var dobplushun=parseInt(x[2])+100;
        var t3=x[0] + "-" + x[1] + "-" + dobpluseighteen;
        var t4=x[0] + "-" + x[1] + "-" + dobplushun;
        
        var z=t3.split("-");
        var v=t4.split("-");
        var date1=new Date(x[2],(x[1]-1),x[0]);
  
        var date2=new Date(y[2],(y[1]-1),y[0]);
        var date3=new Date(z[2],(z[1]-1),z[0]);
        var date4=new Date(v[2],(v[1]-1),v[0]);
       
        var month1=x[1]-1;
        var month2=y[1]-1;
        var month3=z[1]-1;
        var month4=v[1]-1;
        
        
               
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day)); 
        var _diff=Math.ceil((date3.getTime()-date1.getTime())/(one_day));
        var _diffhun=Math.ceil((date4.getTime()-date1.getTime())/(one_day));
        
        
        
        
        if(_Diff<0) 
        {
            alert("Do not enter future date."); 
            these.value="";
            these.focus();
            return false;
        }
        
        
        
        
      /* if(_Diff<_diff)
        {
            alert("You should be minimum 18 years in age to register."); 
            these.value="";
            these.focus();
            return false;
        }*/
        if(_Diff>_diffhun) 
        {
            alert("You can be maximum 100 years in age."); 
            these.value="";
            these.focus();
            return false;
        }
        
        
        
          return true;
        
        
             
     }     
       
  }
 
}

function userId(field) 
{
	
        
        
        var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-.&,(),-,:;";
	var ok = "yes";
	var temp;
	var field_val_len=field.value.length;
	var new_field_value="";
        var status=checkZero(field);
        if(status)
        {
	
	for (var i=0; i<field_val_len; i++) 
	{
		temp = "" + field.value.substring(i, i+1);
		
		if (valid.indexOf(temp) == "-1") ok = "no";
	}
	
	if (ok == "no") 
	{
		alert("Please Enter Valid Characters.");
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
	
}





function degreeType(field) 
{

	var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-.&,(),-,:'; ";
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
		alert("Numbers and special characters are not allowed.");
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
			
				
				
				new_field_value=new_field_value+"\\"+temp;
			
			}
		else	
			{
				
				new_field_value=new_field_value+temp;
			}
	
		
	}
	field.value=new_field_value;
	
	
}
function checkDegree() 
{
//alert("ddd"+document.forms[0].deg_val.value+"egg"+document.forms[0].othdegree.value+"kll");
    if(document.forms[0].deg_val.value=="" && document.forms[0].othdegree.value=="") 
    {
        alert("Please enter degree");
        return false;
    }
    return true;
}
function checkContactNo()
{

//alert("iiii"+document.forms[0].mob_no.value);
if(document.forms[0].orgSTD.value=="" || document.forms[0].orgContactNo.value=="")
{
if(document.forms[0].homeSTD.value=="" || document.forms[0].strResPhone.value=="")
 {
if(document.forms[0].mob_no.value=="")
{
alert("Please Enter Either Mobile No or Institute Telephone No or Residence Telephone No.");
return false;
}
else return true;
}
else
return true;
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
   
      
function loadStateUser(strEvent)
{

var selected=document.forms[0].state.value;
var strUserID=document.forms[0].user_id.value;
var url="";
var url1="";
//alert(document.forms[0].state.value);
//alert(document.forms[0].user_id.value);


if(strEvent=='S')
 {
  if(selected!= null)
    url="registrationAction.do?hmode=getCity&matType="+selected;   
}
else
 {
 if(strUserID!= null)
   url1="registrationAction.do?hmode=checkUserID&userID="+strUserID;		
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
		
    if(strEvent=='S' )
    {
    	http_request4.open("GET", url, true);
			http_request4.onreadystatechange = loadUomData;
      http_request4.send(null);
    }
    else if(strEvent=='U' && strUserID!="")
    {
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
                 alert("Password and confirm password should be same.");
                 theValue2.value="";
                // theValue2.focus();
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
             //alert("First Enter Value in Confirm Password");
             // theValue2.focus();
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

/*function  checkThematicArea()
{
 var iSize=document.forms[0].thematicArea.length;
if(document.forms[0].utype[1].checked)
{
    if(iSize > 0)
    {
        for(var i=0;1<iSize;i++)
        {
        if(document.forms[0].thematicArea[i].checked == false)
            {
              alert("First Select Atleast One Thematic Area!");
              return false;
            }
           
          }//for loop end
      }//if of size
  }//if of utype end
 else
 return true;
}*/



function chk_qual() 
{



var work_dur=document.forms[0].work_dur.length;
var work_inst=document.forms[0].work_inst.length;
var work_done=document.forms[0].work_done.length;
if(work_dur) 
{
    
            
              
              for (var i = 0;i < work_dur;i++) 
              {
                  if (document.forms[0].work_dur[i].value == "") 
                  {
                      alert("Missing field Duration.");
                      document.forms[0].work_dur[i].focus();
                      return false;
                  }
                  
                
                  
              }
}
else 
{
     
            
           if (document.forms[0].work_dur.value == "")
              {
                  alert("Missing field Duration.");
                  document.forms[0].work_dur.focus();
                  return false;
              }
              
    
    
    
}
           
if(work_inst) 
{
      
              for (var j = 0;j < work_inst;j++) 
              {
                  if (document.forms[0].work_inst[j].value == "") 
                  {
                      alert("Missing field Institute.");
                      document.forms[0].work_inst[j].focus();
                      return false;
                  }
                  
                 
                  
              }
}
else 
{
     if (document.forms[0].work_inst.value == "")
              {
                  alert("Missing field Institute.");
                  document.forms[0].work_inst.focus();
                  return false;
              }
              
}

if(work_done) 
{
    
              for (var k = 0;k < work_done;k++) 
              {
                  if (document.forms[0].work_done[k].value == "") 
                  {
                      alert("Missing field Particulars of Work Done.");
                      document.forms[0].work_done[k].focus();
                      return false;
                  }
                 
                  
              }
}
else 
{
              if (document.forms[0].work_done.value == "")
              {
                  alert("Missing field Particulars of Work Done.");
                  document.forms[0].work_done.focus();
                  return false;
              }
}



    
     

         
 return true;
    
    
    
}


function check_file()
{
 var imageFile = document.forms[0].imageFile.value;
 var resumeFile = document.forms[0].resumeFile.value;
  if(imageFile!="")
    {
    
      var to_lowerImage = imageFile.toLowerCase();
          if(to_lowerImage.lastIndexOf(".jpg")==-1)
          {
                if(to_lowerImage.lastIndexOf(".jpeg")==-1)
                {
                   alert("Please upload only .jpg extension file.");
                   document.forms[0].imageFile.value="";
                   document.forms[0].imageFile.focus();
                   return false;
                 }
          }
          
  }
  
 if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension file.");
                 document.forms[0].resumeFile.focus();
                  document.forms[0].resumeFile.value="";
                 return false;
          }          
    }
}


function check_mandatory_partial(thisEvent)
{
if(thisEvent.value=='Submit')
{
     fields=new Array("sal","fullname","majorArea","emailid");	
      fieldDesc= new Array("Salutation","First Name","Major Discipline","Email ID");
  
}
var confirmation="";
 for(i=0;i<fields.length;i++)
 {
    temp=fields[i];
     if(eval("document.forms[0]."+temp+"").value=="")
     {
             alert("Mandatory Field Missing: "+fieldDesc[i]);
             flag1=false;
             eval("document.forms[0]."+temp+"").focus();
             break;
    }
    else
    {
        flag1=true;
    }
    

  }
  if(flag1) {
  if(validateEmail())
{

  checkEmail1();
}      
  }else {
  return false;
      
  }
  

}





function validateEmail()
{
     var str= document.forms[0].emailid.value;
      str = str.replace( /^\s+|\s+$/g ,'').replace( /\s+/g,' ');
      var email =new Array(); 
      var isValidEmail=true;
       email=str;
 
var atpos=email.indexOf("@");
var dotpos=email.lastIndexOf(".");

    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
      {
      alert("'"+email+"' is not a valid e-mail address");
      document.forms[0].emailid.value="";
      document.forms[0].emailid.focus();
      isValidEmail=false;
     
      }
  
  
  
  if(isValidEmail==true) 
  {
   checkEmail1();
  }
  else 
  {
      return false; 
  }
  
}      
        

function check_mandatory(thisEvent)
{

var flag1=true;
var temp;
var fields=new Array();
var fieldDesc=new Array();

if(thisEvent.value=='Submit')
{

      fields=new Array("user_id","password","confirmpassword","sal","fullname","lname","desig","broadArea","majorArea","subDisc","temp_add","state","city","zcode","emailid");	
      fieldDesc= new Array("User Id","Password","Confirm Password","Salutation","First Name","Last Name","Designation","Broad Area","Major Discipline","Sub Discipline","Correspondence Address","State","City","Zip Code","Email ID");
  
}
if(thisEvent.value=='Modify')
{

      fields=new Array("sal","fullname","lname","desig","broadArea","majorArea","subDisc","temp_add","state","city","zcode","emailid","strResearch");	
      fieldDesc= new Array("Salutation","First Name","Last Name","Designation","Broad Area","Major Discipline","Sub Discipline","Correspondence Address","State","City","Zip Code","Email ID","Research Specialization");
  
}

var confirmation="";
 for(i=0;i<fields.length;i++)
 {
    temp=fields[i];
     if(eval("document.forms[0]."+temp+"").value=="")
     {
             alert("Mandatory Field Missing: "+fieldDesc[i]);
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
           if(document.forms[0].othdegree.value=="" && document.forms[0].deg_val.value=="" ) 
           {
               alert("Please enter degree details.");
               document.forms[0].B1.focus();
               return false;
           }
      
           if(!chk_qual())
             return false;
         
         //Private key is not being asked now from expert  
           //fields= new Array("strResearch","strDocpass","strDocConPass","resumeFile");	
           //fieldDesc= new Array("Research Specialization","Private Key Password ","Confirm Private Key Password","Resume");   
         
         fields= new Array("strResearch","resumeFile");	
         fieldDesc= new Array("Research Specialization","Resume");   
      
       for(i=0;i<fields.length;i++)
        {
            temp=fields[i];
             if(eval("document.forms[0]."+temp+"").value=="")
             {
                     alert("Mandatory Field Missing: "+fieldDesc[i]);
                     eval("document.forms[0]."+temp+"").focus();
                     return false;
             }
        }
           
           
           var stat=check_file(); 
           if(stat==false)
           return false;
           
           var status = checkValues();
                 if(status == false)
                 {
                  return false;
                 }
         
        
      
                   if(checkContactNo()&& checkDegree())
                    {
                         
                      confirmation = confirm("Do you want to proceed with the registration?");
                      if(confirmation == true)
                        {
                            document.forms[0].hmode.value="SaveExpert";
                            document.getElementById('login').style.display='inline';
                            document.getElementById('loginpopupObject').style.display='inline';
                            document.forms[0].submit();
                        }
                      else
                          return false;
                    }
                    else
                      return false;
                                  
                //}
         }
        
        
         else 
         {
         if(thisEvent.value=='Modify')
         {
            var chkupdate=chk_qual();
            
           if(chkupdate==false) 
           {
               return false;
           }
        
                 
                     var stat=check_file(); 
                       if(stat==false)
                     return false;  
                     
                      var status1 = checkValues();
                     
                 if(status1 == false)
                 {
                   
                  return false;
                 }
               
                    if(checkContactNo()&& checkDegree())
                    {
                      confirmation = confirm("Do you want to proceed with the modification?");
                      if(confirmation == true)
                        {
                          document.forms[0].action="/ICMR/registrationAction.do";
                          document.forms[0].hmode.value="updateExpert";
                          document.forms[0].submit();
                        }
                      else
                          return false;
                    }
            
         
        }
        }
         
         
         
         
      
 }  
}

function Cancel(thisEvent)
{
           
          location.href="/ICMR/registrationAction.do"; 
          
}
function Cancel_partial(thisEvent)
{
           
          location.href="/ICMR/registrationAction.do?hmode=partialexpertRegister"; 
          
}


function Cancel_piexpert(thisEvent)
{
           
          location.href="/ICMR/registrationAction.do?hmode=partialexpertRegister"; 
          
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
                   alert("Please upload only .jpg extension for Image");
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
                 alert("Please upload only .pdf extension for Resume");
                 return false;
          }          
    }
}

function checkValues()
 {
    
    
   if(document.forms[0].fullname.value != "")
    {
       if(isAlphabetWithApos(document.forms[0].fullname) == false)
       {
         
          return false;
      }
    }
    if(document.forms[0].mname.value != "")
    {
      if(isAlphabetWithApos(document.forms[0].mname) == false)
      {
     
        return false;
      }
    }
     if(document.forms[0].lname.value != "")
    {
      if(isAlphabetWithApos(document.forms[0].lname) == false)
      {
     
        return false;
      }
    }
    
    if(document.forms[0].desig.value != "")
    {
      if(isAlphaNumeric(document.forms[0].desig) ==false)
      {
      
        return false;
      }
    }
    if(document.forms[0].department.value != "")
    {
      if(isAlphaNumeric(document.forms[0].department) == false)
      {
     
        return false;
      }
    }
    if(document.forms[0].org.value != "")
    {
      if(isAlphaNumeric(document.forms[0].org) == false)
      {
     
        return false;
      }
    }    
     
    if(document.forms[0].temp_add.value != "")
    {
   
      if(isAlphaNumericWithApos(document.forms[0].temp_add) == false)
      {
     
        return false;
      }
    }
     if(document.forms[0].zcode.value != "")
    {
      if(isNumber(document.forms[0].zcode) == false)
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
  
    if(document.forms[0].homeSTD.value != "")
    {
      if(isNumber(document.forms[0].homeSTD) == false)
      {
      
        return false;
      }
    }
    
       if(document.forms[0].strResPhone.value != "")
    {
      if(isNumber(document.forms[0].strResPhone) == false)
      {
      
        return false;
      }
    }
  
 }


function isAlphaNumeric(alphane)
{

//alert("1111");
            var fiedlName="";
            if(alphane.id!=null)
            fiedlName=alphane.id;

            if(alphane.value.length>0)
            {
	           if(alphane.value.charAt(0)==" ") 
                   {
                       
                       alphane.value=alphane.value.substring(1, alphane.value.length);
                      
                   }
                   
                   if(parseInt(alphane.value)=="0") 
                   {
                        if(fiedlName=="")
                        fiedlName="This field";
                       
                       alert(fiedlName+" can not be zero.");
                       alphane.value="";
                       return false;
                   }
                
                    var numaric = trim(alphane.value);
	
                       for(var j=0; j<numaric.length; j++)
                        {
                        
                          var alphaa = numaric.charAt(j);
                          
                          var hh = alphaa.charCodeAt(0);
                          
                          if((hh > 47 && hh<58) || (hh > 64 && hh<91) || (hh > 96 && hh<123))
                          {
                          
                         
                          }
                        else if((hh==39)||(hh==64)||(hh==60)||(hh==62)||(hh==61)||(hh==34)|| (hh==35)||(hh==33)||(hh==36)||(hh==37)||(hh==94)||(hh==126))	{
                        
                        if(fiedlName=="")
                        fiedlName="this field.";
                        alert("This String is not valid .Don't Enter  ' , @ , < , > , = , ^ , ! , * , % , $ \ characters in "+fiedlName+".");
                              
                        alphane.value="";
                        alphane.focus();
            
            
                        return false;
                          }
                        }
            }     
        
}

function isAlphabet(thisField) 
{
	
        
      // alert("2222");
            if(thisField.value.length>0)
            {
                   
                  
                  
                  
                   if(thisField.value.charAt(0)==" ") 
                   {
                       
                       thisField.value=thisField.value.substring(1, thisField.value.length);;
                       
                   }
                   
                   
                   
                 
                   thisField.value=trim(thisField.value);
                   
                   
                    for(var i = 0; i < thisField.value.length; i++) 
                    {
                            var ch = thisField.value.substring(i,i+1);
                            
                            if(ch>="A" && ch<="Z") { 			
                            } else if(ch>="a" && ch<="z") {
                            } else if(ch == " ") {
                            } else if(ch== "."){}
                             else{
                                    alert("Enter only alphabets.");
                                    thisField.value="";
                                    thisField.focus();
                                   
                                    return false;
                            }
                    }
            }
     
}


function isNumber(theField)
{
       
        var theInput, theLength;	
	theInput = theField.value;
        var fiedlName="";
        if(theField.id!=null)
          fiedlName=theField.id;
 
	theLength = theInput.length;
	var okNum =  "ALLOK";
	var charSpe = false;
        var status=checkZero(theField);
        if(status)
        {
        
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
                        if(fiedlName=="")
                        fiedlName="this field.";
                        
                        
                        alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a valid Number in "+fiedlName+".");
                        theField.value="";
                        theField.focus();
                        return false;
                }
        }
        else
        return false;
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
            alert("Select date greater than current date."); 
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
            alert("Please select date between current date and end date."); 
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


function isDOB(theField)
{
	
        
        
        theInput = theField.value;
	theLength = theInput.length;
	var okDate =  "ALLOK";
	var charSpe = false;
	if(theLength == 0)
	{
        return false;
	}
  
	if ((theLength <= 8 ||theLength > 10) && theLength !=0)
	{
		alert("Invalid Date : " + theInput + ", Please insert in (DD-MM-YYYY) Format.");
		theField.value="";
                theField.focus();
		return false;
	}
	var pos1 = spePosition(0);
	var pos2 = spePosition(pos1+1);
	var pos3 = spePosition(pos2+1);
	if (pos3 == -1)
	{
		for(var i = 0; i<theLength; i++)
		{
			if (isNaN(theInput.substring(i, i+1)))
			{
				if (!(theInput.substring(i, i+1)== "/") && !(theInput.substring(i, i+1)=="-") && !(theInput.substring(i, i+1)=="."))
				{
					alert("Please Enter DD-MM-YYYY Format, Character Not Allowed in Date");
					theField.value="";
                                        theField.focus();
					return false;
				}
			}
		}
		var okDate = checkYearMonthDate(theInput, pos1, pos2, okDate);
		if (okDate == "Year")
		{
			alert("Invalid Year, Character value found or year is not in YYYY  : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
			theField.value="";
                        theField.focus();
			return false;
		}
		if (okDate == "Month")
		{
			alert("Invalid Month, Character value found : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
			theField.focus();
			return false;
		}
		if (okDate == "Date")
		{
			alert("Invalid Date, Character value found : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
			theField.value="";
                        theField.focus();
			return false;
		}
		if (okDate == "31")
		{
			alert("Date value can not be less than 1 greater than 31  : " + theInput +"");
			theField.focus();
			return false;
		}
		if (okDate == "30")
		{
			alert("Date value can not be less than 1 greater than 30 : " + theInput +"");
			theField.value="";
                        theField.focus();
			return false;
		}
		if (okDate == "Leap")
		{	
			alert("Date value for Leap Year can not be less than 1 greater than 29 : " + theInput +""); 
			theField.focus();
			return false;
		}
		if (okDate == "Nonleap")
		{
			alert("Date value can not be less than 1 greater than 28 : " + theInput +""); 
			theField.value="";
                        theField.focus();
			return false;
		}
		if (okDate == "invYearRange")
		{
			alert("Year is not in Prescribed Range : 1901-2099"); 
			theField.value="";
                        theField.focus();
			return false;
		}
		if (okDate == "invMonRange")
		{
			alert("Not a Valid Month (Valid value is 1 to 12) : " + theInput +""); 
			theField.value="";
                        theField.focus();
			return false;
		}	
              if (okDate == "invDateRange")
		{
			alert("Date is not in Prescribed Range : " + theInput +""); 
			theField.value="";
                        theField.focus();
			return false;
		}
    if (okDate == "invSeperator")
		{
			alert("More than One Seperator is not allowed in Date : " + theInput +", Please insert in (DD-MM-YYYY) Format.");
			theField.value="";
                        theField.focus();
			return false;
		}
	}
	else
	{
  	//alert("Invalid Date Seperators(.-/) found, Seperator can not be less or greater than Two : " + theInput + ", Please insert in (DD-MM-YYYY) Format.");
      alert("Invalid Date Seperators found, Please insert in (DD-MM-YYYY) Format.");
		theField.focus();
		theField.value="";
                return false;
	}
	return true;
}












function checkEmail()
{

var vartitle=document.forms[0].strexpertmail.value;
  
var url="";



 if(vartitle!= null)
 
    
   url="invExpertAction.do?hmode=checkEmailID&pEmail="+vartitle;		
        
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
  
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
        alert("This email id '"+x[0].childNodes[0].attributes[0].nodeValue+"' has already been registered.");
        document.forms[0].strexpertmail.focus();
        return false;
       }
       else 
       {
        var answer = confirm("Are you sure to go ahead with this invitation(s)?")
           if (answer){
    
          document.forms[0].action="/ICMR/invExpertAction.do?hmode=save"
         document.forms[0].method="post";
         document.forms[0].submit();
         alert("Invitation mail has been sent successfully");
           }
           
       } 
          
     }
}
}

function checkEmail1()
{

var vartitle=document.forms[0].emailid.value;
  
var url="";



 if(vartitle!= null)
 
    
   url="invExpertAction.do?hmode=checkpartialEmailID&pEmail="+vartitle;		
        
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
	http_request4.onreadystatechange = loadEmail1;
    
        http_request4.send(null);
        
    }
    // display an error in case of failure
    catch (e)
    {
      alert("Can't connect to server:\n" + e.toString());
    }

        
        
 }

   
    
			




 function loadEmail1()
{
 
  //alert("inside loadtitle"+http_request1.readyState);
  //alert("inside loadtitle"+http_request1.status);
  var emailid= document.forms[0].emailid.value;
  var indexid= emailid.lastIndexOf("@");
  var userid=emailid.substring(0,indexid);
 //alert(userid);
  if(http_request4.readyState == 4)
   {
   
     
    if(http_request4.status == 200) 
    {
     //alert("x5");
       var str = http_request4.responseXML.documentElement;
      
       var x= str.getElementsByTagName("EmailID");
 // alert(x[0].childNodes[0].attributes[0].nodeValue);
       if(x[0].childNodes[0].attributes[0].nodeValue=="A")
       {
        alert("This email id  has already been registered.");
        document.forms[0].emailid.focus();
        return false;
       }
       else if(x[0].childNodes[0].attributes[0].nodeValue=="B")
       {
        alert("This user id  '"+userid+"' has already been registered.\nPlease enter some other Email ID.");
        document.forms[0].emailid.focus();
        return false;
       }
       else 
       {
        var answer = confirm("Do you want to proceed with the partial registration?")
           if (answer){
                               document.forms[0].hmode.value="partialexpertRegisterSave";
                            document.getElementById('login').style.display='inline';
                            document.getElementById('loginpopupObject').style.display='inline';
                            document.forms[0].submit();
           }
           
       } 
          
     }
}


}


function checkMailP()
{


var emailidprop=document.forms[0].emailid.value;
var url="";




 if(emailidprop!= null)
   url="registrationAction.do?hmode=checkMailIdP&emailid="+emailidprop;		
 

		
			if (window.XMLHttpRequest) 
			{ 
		    		http_request4 = new XMLHttpRequest();
		    
			} 
			else if (window.ActiveXObject)  
			{
      
				try {
		
					http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
		 
				}
				catch (e) {
					try {
		
						http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
		
					}
					catch (e) {}
				}
			}
			
			if (!http_request4) {
				alert('Giving up :( Cannot create an XMLHTTP instance');
				return false;
			}
		
    
      http_request4.open("GET", url, true);
      http_request4.onreadystatechange = loadPEmailID;
      http_request4.send(null);
   
    
			
}


 function loadPEmailID()
{

   if(http_request4.readyState == 4)
   {
      
    if(http_request4.status == 200) 
    {
       var str = http_request4.responseXML.documentElement;
       var x= str.getElementsByTagName("EmailID");
      
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
          
      var confirmation=confirm("Email ID "+document.forms[0].emailid.value+" already registered as a Proposer.\n Do you want make this proposer an expert?" );
       
         if(confirmation == true)
                        {
        document.forms[0].action="/ICMR/registrationAction.do?hmode=pitoexpertRegister";
        document.forms[0].submit();
                        }
                        else{
                            document.forms[0].emailid.value="";
                            document.forms[0].emailid.focus();
                              return false;
                        }
       }
    
          
     }
}


}

