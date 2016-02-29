var theInput, theLength;

         
function mobile(theField)
{       
            
        
	
	theInput = theField.value;
        var fiedlName="";
        if(theField.id!=null)
          fiedlName=theField.id;
 
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
                if(fiedlName=="")
                fiedlName="this field.";
		alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a Valid Number in "+fiedlName+".");
		theField.value="";
		theField.focus();
	}
  else
  {
              if(document.forms[0].mob_no.value.length >10||document.forms[0].mob_no.value.length <10)
              {
                alert("Mobile Number Should be of 10 digits only.");
                document.forms[0].mob_no.value = "";
                document.forms[0].mob_no.focus();
                return false;
              }
    }
}


function isNumber(theField)
{
	
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
		alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a Valid Number.");
		theField.value="";
		theField.focus();
		return(false);
	}
        else
            return true;
}



function isDecimal(theField,beforeDecimal,afterDecimal)
{
   
	var count_before_decimal = '';
	var count_after_decimal = '';
        
        
        
        
        
        
	for(var i=0; i<beforeDecimal; i++)
	{
		count_before_decimal = count_before_decimal + '9';
	}
	for(var i=0; i<afterDecimal; i++)
	{
		count_after_decimal = count_after_decimal + '9';
	}
	theInput = theField.value;
	theLength = theInput.length;
	var okNum =  "ALLOK";
	var charSpe = false;
	var count_decimal = 0;
	if(theLength == 0)
		{
			return(false);
	}
	for(var i=0; i<theLength; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
			if(theInput.substring(i, i+1)!='.' || count_decimal>0)
			{
				okNum = "notOK";
				charSpe = theInput.substring(i, i+1);
				break;
			}
			else
				count_decimal++;
		}
	}
	if (okNum == "notOK")
	{alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a Valid Number.");
		theField.value = "";
		theField.focus();
		return(false);
	}
	if (parseInt(theInput)>parseInt(count_before_decimal))
	{
		alert("You Can Not Enter more than "+beforeDecimal+" digit before decimal.");
		theField.value = "";
		theField.focus();
		return(false);
	}
	if((theInput.indexOf('.'))!=-1)
	{
		if (parseInt(theInput.substring(theInput.indexOf('.')+1))>parseInt(count_after_decimal))
		{
			alert("You can not enter more than "+afterDecimal+" digit after decimal.");
			theField.value = "";
			theField.focus();
			return(false);
		}
	}
  
}
function isDecimalDuration(theField,beforeDecimal,afterDecimal)
{
    
  if(theField.value.length==1)
  {
    var element=theField.value.charAt(0);
   
    if(element==0)
    {
      alert("Duration can not be zero");
      theField.value = "";
		  theField.focus();
      return false;
    }
  }



	var count_before_decimal = '';
	var count_after_decimal = '';
	for(var i=0; i<beforeDecimal; i++)
	{
		count_before_decimal = count_before_decimal + '9';
	}
	for(var i=0; i<afterDecimal; i++)
	{
		count_after_decimal = count_after_decimal + '9';
	}
	theInput = theField.value;
	theLength = theInput.length;
	var okNum =  "ALLOK";
	var charSpe = false;
	var count_decimal = 0;
	if(theLength == 0)
		{
			return(false);
	}
	for(var i=0; i<theLength; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
			if(theInput.substring(i, i+1)!='.' || count_decimal>0)
			{
				okNum = "notOK";
				charSpe = theInput.substring(i, i+1);
				break;
			}
			else
				count_decimal++;
		}
	}
	if (okNum == "notOK")
	{alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a Valid Number.");
		theField.value = "";
		theField.focus();
		return(false);
	}
	if (parseInt(theInput)>parseInt(count_before_decimal))
	{
		alert("You Can Not Enter more than "+beforeDecimal+" digit before decimal.");
		theField.value = "";
		theField.focus();
		return(false);
	}
	if((theInput.indexOf('.'))!=-1)
	{
		if (parseInt(theInput.substring(theInput.indexOf('.')+1))>parseInt(count_after_decimal))
		{
			alert("You can not enter more than "+afterDecimal+" digit after decimal.");
			theField.value = "";
			theField.focus();
			return(false);
		}
	}
}


function compareNumber(theField1,theField2)
{
	isNumber(theField1);
	isNumber(theField2);
	theInput1=theField1.value;
	theInput2=theField2.value;
	theLen1=theField1.length;
	theLen2=theField2.length;
	if(theLen1==0)
	{
		return(0);
	}
	
	if(theInput2!="")
	{
		if(theInput1>theInput2)
		{
			alert("The Number "+theInput1+" is greater than "+(theInput2*1));
			theField1.focus();
			return(0);
		}	
	}
}

function compareNumber1(theField1,theField2)
{
	var theInput1=theField1.value;
	var theInput2=theField2.value;
	var theLen1=theField1.length;
	var theLen2=theField2.length;

	if(theLen1==0)
	{
		return (false);
	}
	
	if(theInput2!="")
	{
		if(theInput1 > theInput2)
		{
			alert("The Number "+theInput1+" is greater than "+(theInput2*1));
			theField1.focus();
			return (false);
		}
		return (true);	
	}
}

function compareNumber2(theField1,theField2,theField3)
{
	var	theInput1=theField1.value;
	var theInput2=theField2.value;
	var theInput3=theField3.value;
	
	var theInput4 = parseFloat((theField2.value - theField3.value));
	
	if((theInput2!=""))
	{
		if(theInput1 > theInput4)
		{
			alert("The Number "+theInput1+" is greater than "+theInput4);
			theField1.focus();
			return (false);
		}
		return (true);	
	}
}
