function isAlphaNumeric(alphane)
{
              
                 
	alphane.value=trim(alphane.value);
        var fiedlName="";
        if(alphane.id!=null)
          fiedlName=alphane.id;
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
		
                       if(fiedlName=="")
                        fiedlName="this field.";
                alert("Please don't Enter  ' , @ , < , > , = , ^ , ! , * , % , $ \ characters in "+fiedlName+".");
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



///********************Function for trim********************//
function initCap(obj) {

var inputString = obj; // The input text field
var outputString = obj; // The output text field
var tmpStr, tmpChar, preString, postString, strlen;
tmpStr = inputString.value.toLowerCase();
stringLen = tmpStr.length;
if (stringLen > 0)
{
  for (i = 0; i < stringLen; i++)
  {
    if (i == 0)
	{
      tmpChar = tmpStr.substring(0,1).toUpperCase();
      postString = tmpStr.substring(1,stringLen);
      tmpStr = tmpChar + postString;
    }
    else
	{
      tmpChar = tmpStr.substring(i,i+1);
      if (tmpChar == " " && i < (stringLen-1))
	  {
      tmpChar = tmpStr.substring(i+1,i+2).toUpperCase();
      preString = tmpStr.substring(0,i+1);
      postString = tmpStr.substring(i+2,stringLen);
      tmpStr = preString + tmpChar + postString;
      }
    }
  }
}
outputString.value = tmpStr;
}

function trimMasterValues(string) 
{
  if(string.value == ' ')
  {
    string.value = trim(string.value);
    return true;
  }
  if(string.value != '')
  {
    string.value = trim(string.value);
    string = string.value;
    while (string.substring(string.length-1,string.length) == ' ') {
      string = string.substring(0,string.length-1);
    }
      return string;
  }  
}


function calculatelength() 
{
    
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
//**************End of the function*************//

function isAlphaNumericWithApos(alphane)
{ 
                 
                
	alphane.value=trim(alphane.value);
        var fiedlName="";
        if(alphane.id!=null)
          fiedlName=alphane.id;
          
        
        if(parseInt(alphane.value)=="0") 
                   {
                        if(fiedlName=="")
                        fiedlName="This field";
                   
                       alert(fiedlName+" can not be zero.");
                       alphane.value="";
                       fiedlName="";
                       return false;
                   }
        var numaric = trim(alphane.value);
        
	
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
		else if((hh==64)||(hh==60)||(hh==62)||(hh==61)||(hh==34)|| (hh==35)||(hh==33)||(hh==36)||(hh==37)||(hh==94)||(hh==126))	
                {
                 if(fiedlName=="")
                        fiedlName="this field.";
                
		alert("Please don't Enter   @ , < , > , = , ^ , ! , * , % , $ \ characters in "+fiedlName+".");
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
        
function isAlphabetWithApos(thisField) 
{
	
        thisField.value=trim(thisField.value);
        var fiedlName="";
        if(thisField.id!=null)
          fiedlName=thisField.id;
          
                    
	if(thisField.value!="")
	{
		for(var i = 0; i < thisField.value.length; i++) 
		{
			var ch = thisField.value.substring(i,i+1);
			//alert(ch);
			if(ch>="A" && ch<="Z") 
                        { 			
			} 
                        else if(ch>="a" && ch<="z") 
                        {
			} 
                        else if(ch == " ") 
                        {
			} 
                        else if(ch== ".")
                        {
                        }
                        else if(ch== "'")
                        {
                        }
			else{
                        
                                if(fiedlName=="")
                                fiedlName="This Field";
                                
				alert("Enter Only Alphabets In "+fiedlName+".");
				thisField.value="";
				thisField.focus();
				//thisField.select();
				
			}
		}
	}
	//checkDomain(thisField); 
}
//***************Function for check Alphabet in namin conevention

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
			} else if(ch== "."){
                        }
			 else{
				alert("Enter Only Alphabets.");
				thisField.value="";
				thisField.focus();
				//thisField.select();
				
			}
		}
	}
	//checkDomain(thisField); 
}//*********************End of Function*********************//


///********************Function for validation of Phone No********************/
function isPhone(obj)
{
	obj.value=trim(obj.value);
	var string=obj.value;
	var len =string.length;
	if (len==0)
	{
		return false;
	}	

		for(i=0;i<len;i++)
			{
				ch=string.substring(i,i+1)
				if(((ch>="0" && ch<="9")) || (ch=="(")|| (ch==")")|| (ch=="-") ||(ch=="+"))
					{
						true;
					}
				else
					{
						alert("Please Enter Valid Phone Number!");
            obj.value="";
						obj.focus();
						
						return false;
									
					}
			}
				
}
//**************************End of the Function************************//


///********************Function for validation of Mobile No********************/
function isMobile(Obj)
{
var string=Obj.value;
var len = string.length;

	
		if (len==0)
		{
			return false;
		}	

		for(i=0;i<len;i++)
		{
					ch=string.substring(i,i+1)
					
					if( (ch>="0" && ch<="9")||(i==0 && ch=="+"))
					{
						true;
					}
					else
					{
          alert("Please Enter Valid Mobile Number!");
          Obj.value="";
						return false;			
					}
			}	
}

//**********************End of the Mobile function*****************//

//*******************Numeric Function Validation**********************//
function isNumeric(obj)
 {
	obj.value=trim(obj.value);
	var val=obj.value;
	inputStr = val.toString()
	for (var i = 0; i < inputStr.length; i++)
	{
		var oneChar = inputStr.charAt(i)			
		if ((oneChar < "0" || oneChar > "9") && oneChar != "/")
		{
			alert("Enter Numeric Only ");
			obj.value='';
		  	obj.focus();
			return false;
		}
	}

}
//****************End of the Function******************//


function checkLen(field,maxlimit)
{

len=field.value.length;
strVal=field.value;
for(iCount=0;iCount<strVal.length;iCount++) 
{
if(strVal[iCount]=="\n")
++len;
}
if (len > maxlimit)
{
  alert("Please do not enter more than "+maxlimit+" characters");
  field.value = "";
  
}
}


function textCounter(field, countfield, maxlimit)
{

len=field.value.length;
strVal=field.value;
for(iCount=0;iCount<strVal.length;iCount++) 
{
if(strVal[iCount]=="\n")
++len;
}


if (len > maxlimit)
{
  alert("Do not enter more than "+maxlimit+" characters.");
  return false;
  //field.value = "";
  
}
// otherwise, update 'characters left' counter
else 
countfield.value = maxlimit - len;


}



function checkTxt(obj)
{
   obj.value=trim(obj.value);
   if(obj.value.length==0)
   {
   	return false;
   }
   if(!isNaN(obj.value))
    {
      alert("Please Enter the Alpha-Numeric Character");
      return false;
    }
  if(checkSpChar(obj) == false)
   {
       return false;
   }
  
}


function checkSpChar(obj)
{
   var txtValue = obj.value;
   if(txtValue.indexOf("'") >-1 || txtValue.indexOf("*") >-1 || txtValue.indexOf("\"") >-1)
    {
      alert("Special Character ' , * ,  \"  is not allowed ");
	  	obj.value='';
      obj.focus();
      return false;
    }
	//checkDomain(obj);
}


// To count the charecter limit of text area




function isAlphaNumeric1(alphane1)
{

	alphane1.value=trim(alphane1.value);
      var numaric = trim(alphane1.value);
	
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
		else if((hh==39)||(hh==64)||(hh==60)||(hh==62)||(hh==61)||(hh==34)|| (hh==35)||(hh==33)||(hh==36)||(hh==94)||(hh==126))	{
		alert("Please don't Enter  ' , @ , < , > , = , ^ , ! , * ,  $ \ characters");
			//alert(numaric);
		//alert(numaric.substring(0,numaric.length-1));
		//alphane.value=numaric.substring(0,numaric.length-1);
		alphane1.value="";
    alphane1.focus();
    
    //alphane.select();
		return false;
		  }
		}

  }





function checkMaxlen(these,maxlength) 
{
   
    var length=these.value.length;
    
    if(length>maxlength) 
    {
        alert("Please do not enter more than "+maxlength+" characters");
        these.value="";
        these.focus();
        return false;
    }
    return true;
}


function checkMinlen(these,minlength) 
{
    var length=these.value.length;
    
    if(length<minlength) 
    {
        alert("Please do not enter less than "+minlength+" characters");
        these.value="";
        these.focus();
        return false;
    }
    return true;
}


 function checkchar(obj) {
      var re;
      var val = obj.value;
      re = /[a-zA-Z_0-9]/;
      //alert(re.test(val.value));
       if(val=="")
       return false;
      if (!re.test(val.value)) {
          alert("Please enter alphanumeric only .");
        
          return false;
      }
      else {
          return true;
      }
  }

  function checkstr(obj) {
      var obj1="";
      obj1=obj;

      if (checkchar(obj1) == true) {

          var re;
          re = /[a-zA-Z]/;
          var val = obj.value;
            if(val=="")
            return false;
          if (!re.test(val)) {
             if(obj.id!=null)
                alert(" All numbers not allowed in '"+obj.id+"'.");
             else
            alert(" All numbers not allowed in Title.");
              obj.value="";
              
              return false;
          }
      }
      else {
          return true;
      }

  }







