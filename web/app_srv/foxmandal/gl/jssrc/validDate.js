function compareFromToDateBdArea(theField1, theField2)
{


isDate(theField1);
isDate(theField2);

  theInput2 = theField1.value;
  theInput1 = theField2.value;
	theLength = theInput1.length;
  
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
  	
    
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);
 

	if(vYear2 > vYear1 )
	{
		
                
                return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				
                                
                                return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 > vDate1)
					{
						
						return true;
					}
					else
					{
						
                                                alert("Start Date "+theInput1+" should  be less than End Date "+theInput2+".");
						theField1.value="";
                                                theField2.value="";
                                                theField2.focus();
            //theField1.select();
						return false;
					}
				}
				else
				{
					alert("Start Date "+theInput1+" should  be less than End Date "+theInput2+".");
					theField1.value="";
                                        theField2.value="";
                                        theField2.focus();
          //theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("Start Date "+theInput1+" should  be less than End Date "+theInput2+".");
			theField1.value="";
                        theField2.value="";
                        theField2.focus();
      //theField1.select();
			return false;
		}
	}
  return true;
}




function compareFromToDate(theField1, theField2)
{
isDate(theField1);
isDate(theField2);

  theInput2 = theField1.value;
  theInput1 = theField2.value;
	theLength = theInput1.length;
  
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
  	
    
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);
 

	if(vYear2 > vYear1 )
	{
		
                
                return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				
                                
                                return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 > vDate1)
					{
						
						return true;
					}
					else
					{
						alert("Start Date "+theInput1+" should not be same as End Date "+theInput2);
						theField1.focus();
            theField1.select();
						return false;
					}
				}
				else
				{
					alert("Start Date "+theInput1+" is bigger than To "+theInput2);
					theField1.focus();
          theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("Start Date "+theInput1+" is bigger than To "+theInput2);
			theField1.focus();
      theField1.select();
			return false;
		}
	}
  return true;
}

function compareDocFromToDate(from_date, to_date)
{

  theInput2 = from_date;
  theInput1 = to_date;
  alert("Inside compareDocFromToDate Function ");
  alert("theInput2 is"+theInput2+"and theInput1 is"+theInput1);
	theLength = theInput1.length;
  
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;
alert("theInput1 pos1 "+theInput1);
	var pos1 = spcDocPosition(0, theInput1);
	var pos2 = spcDocPosition(pos1+1, theInput1);
	var pos3 = spcDocPosition(pos2+1, theInput1);
	
  	
    
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
    	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
    	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcDocPosition(0, theInput2 );
	pos2 = spcDocPosition(pos1+1, theInput2);
	pos3 = spcDocPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
    	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);
 

	if(vYear2 > vYear1 )
	{
		
                
                return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				
                                
                                return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 > vDate1)
					{
						
						return true;
					}
					else
					{
						alert("From Date "+theInput1+" should not be same as To Date "+theInput2);
						theField1.focus();
            theField1.select();
						return false;
					}
				}
				else
				{
					alert("From Date "+theInput1+" should not be greater than To "+theInput2);
					theField1.focus();
          theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("From Date "+theInput1+" should not be greater than To "+theInput2);
			theField1.focus();
      theField1.select();
			return false;
		}
	}
  return true;
}

function compareDocToLastDate(theField1, theField2)
{

  theInput2 = theField1;
  theInput1 = theField2;
  alert("Inside compareDocToLastDate Function ");
  alert("theInput2 is"+theInput2+"and theInput1 is"+theInput1);
	theLength = theInput1.length;
  
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
  	
    
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);
 

	if(vYear2 > vYear1 )
	{
		
                
                return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				
                                
                                return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 > vDate1)
					{
						
						return true;
					}
					else
					{
						alert("Last Date to upload "+theInput1+" should not be same as To Date "+theInput2);
						theField1.focus();
            theField1.select();
						return false;
					}
				}
				else
				{
					alert("To Date "+theInput1+" should not be greater than Last Date to upload "+theInput2);
					theField1.focus();
          theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("To Date "+theInput1+" should not be greater than Last Date to upload "+theInput2);
			theField1.focus();
      theField1.select();
			return false;
		}
	}
  return true;
}



function compareAppPreDate(theField1, theField2)
{

isDate(theField1);
isDate(theField2);

	 theInput2 = theField1.value;
	 theInput1 = theField2.value;
	theLength = theInput1.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("4 Date "+theInput1+" is bigger than Approve "+theInput2);
						theField1.focus();
            theField1.select();
						return false;
					}
				}
				else
				{
					alert("Prepare Date "+theInput1+" is bigger than Approve "+theInput2);
					theField1.focus();
          theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("Prepare Date "+theInput1+" is bigger than Approve "+theInput2);
			theField1.focus();
      theField1.select();
			return false;
		}
	}
  return true;
}


function days_between_age(theField) {
if(theField.value!="")
{
var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
var currendate=day+ "/" +month  + "/" + year;
t1=currendate;
var y;
 theInput = theField.value; 
theLength = theInput.length;
for(var i = 0; i<theLength; i++)
{
if (isNaN(theInput.substring(i, i+1)))
{
if (theInput.substring(i, i+1)==".")
{
y=theInput.split(".");
}
if (theInput.substring(i, i+1)=="/")
{
 y=theInput.split("/");

}
if (theInput.substring(i, i+1)=="-")
{
y=theInput.split("-");
}
}
}
var one_day=1000*60*60*24*365; 
var x=t1.split("/");     
var date1=new Date(x[2],(x[1]-1),x[0]);
var date2=new Date(y[2],(y[1]-1),y[0])
var month1=x[1]-1;
var month2=y[1]-1;
_Diff=Math.floor((date1.getTime()-date2.getTime())/(one_day)); 
if(_Diff<15)
{
alert("Your Age can not be Less than 15 years");
theField.value="";
theField.focus();

}
}
}

function days_between_two(theField2,theField1) {
//alert(theField1.value);
if(theField2.value!="" && theField1.value!="")
{


var y;
var x;

theInput1 = theField1.value; 
theLength1 = theInput1.length;
//alert(theLength1);
for(var i = 0; i<theLength1; i++)
{
//alert("for");

if (isNaN(theInput1.substring(i, i+1)))
{
    
    if (theInput1.substring(i, i+1)==".")
    {
    x=theInput1.split(".");
    }
    if (theInput1.substring(i, i+1)=="/")
    {
     x=theInput1.split("/");
    
    }
    if (theInput1.substring(i, i+1)=="-")
    {
   // alert(theInput1);
    x=theInput1.split("-");
   // alert(x);
    }
}
}
 theInput2 = theField2.value; 
theLength2 = theInput2.length;
for(var i = 0; i<theLength2; i++)
{
if (isNaN(theInput2.substring(i, i+1)))
{
if (theInput2.substring(i, i+1)==".")
{
y=theInput2.split(".");
}
if (theInput2.substring(i, i+1)=="/")
{
 y=theInput2.split("/");

}
if (theInput2.substring(i, i+1)=="-")
{
y=theInput2.split("-");
}
}
}
var one_day=1000*60*60*24*365.242; 
  
var date1=new Date(x[2],(x[1]-1),x[0]);
var date2=new Date(y[2],(y[1]-1),y[0])
var month1=x[1]-1;
var month2=y[1]-1;
_Diff=Math.floor((date1.getTime()-date2.getTime())/(one_day)); 
if(_Diff<15)
{
alert("You Entered "+theField1.value+"  as Appointment/this date and "+theField2.value+"for Date of Birth .There Must be 15 years difference in both dates" );
theField1.value="";
theField2.value="";


}
}
}



// To Compare Date Not to be greater than System Date

function days_between_future(theField) {

if(theField.value!="")
{
var checkDate=isDate(theField);
//alert(checkDate);
if(checkDate){
var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
var currendate=day+ "/" +month  + "/" + year;
t1=currendate;
var y=null;
 theInput = theField.value; 
theLength = theInput.length;
for(var i = 0; i<theLength; i++)
{
if (isNaN(theInput.substring(i, i+1)))
{
if (theInput.substring(i, i+1)==".")
{
y=theInput.split(".");
}
if (theInput.substring(i, i+1)=="/")
{
 y=theInput.split("/");

}
if (theInput.substring(i, i+1)=="-")
{
y=theInput.split("-");
}
}
}
var one_day=1000*60*60*24*365; 
var x=t1.split("/");     
var date1=new Date(x[2],(x[1]-1),x[0]);
var date2=new Date(y[2],(y[1]-1),y[0])
var month1=x[1]-1;
var month2=y[1]-1;
_Diff=Math.floor((date1.getTime()-date2.getTime())/(one_day)); 
if(_Diff<0)
{
alert("You can not Enter Future Date");
theField.value="";
theField.focus();

}
}
else
return false;
}

}


// To Compare Date Not to be less than System Date

function days_between_Past(theField) {
if(theField.value!="")
{
var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
var currendate=day+ "/" +month  + "/" + year;
t1=currendate;
var y=null;
 theInput = theField.value; 
theLength = theInput.length;
for(var i = 0; i<theLength; i++)
{
if (isNaN(theInput.substring(i, i+1)))
{
if (theInput.substring(i, i+1)==".")
{
y=theInput.split(".");
}
if (theInput.substring(i, i+1)=="/")
{
 y=theInput.split("/");


}
if (theInput.substring(i, i+1)=="-")
{
y=theInput.split("-");
}
}
}
var one_day=1000*60*60*24*365; 
var x=t1.split("/");     
var date1=new Date(x[2],(x[1]-1),x[0]);
var date2=new Date(y[2],(y[1]-1),y[0])
var month1=x[1]-1;
var month2=y[1]-1;
_Diff=Math.floor((date2.getTime()-date1.getTime())/(one_day)); 
if(_Diff<0)
{
alert("You can not Enter Past Date");
theField.value="";
theField.focus();

}
}

}


function isDate(theField)
{
        var theInput = theField.value;
	var theLength = theInput.length;
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
                        theField.value="";
			theField.focus();
			return false;
		}
		if (okDate == "Date")
		{
			alert("Invalid Date, Character value found : " + theInput + ", Please insert in (DD-MM-YYYY) Format."); 
			theField.focus();
			return false;
		}
		if (okDate == "31")
		{
			alert("Date value can not be less than 1 greater than 31  : " + theInput +"");
                        theField.value="";
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
			alert("Year is not in Prescribed Range : " + theInput +""); 
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
      theField.value="";
		theField.focus();
		return false;
	}
	return true;
}


function spePosition(startFrom,theInput)
{
	var posi = theInput.indexOf("-", startFrom);
	 if (posi == -1)
	{
		posi = theInput.indexOf("-", startFrom);
	}
        if (posi == -1)
	{
		posi = theInput.indexOf(".", startFrom);
	}
	
	return(posi);
}

function checkYearMonthDate(theInput, p1, p2, okDate)
{

//alert(theInput);
//alert(p1);
//alert(p2);
//alert(okDate);
	var len = theInput.length;

	for(var i = 0; i<p1; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
			return("Date");
		}
	}
	for(var i = p1+1; i<p2; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
			return("Month");
		}
	}
	for(var i = p2+1; i < len; i++)
	{
		if (isNaN(parseInt(theInput.substring(i, i+1))))
		{
			return("Year");
		}
	}

	var vDate  = parseInt(theInput.substring(0,p1));
	//alert(vDate);
	var vMonth = parseInt(theInput.substring(p1+1,p2));
	//	alert(vMonth);
	var vYear  = parseInt(theInput.substring(p2+1,len));
//alert(vYear);
	var leapYear = vYear/4;

	var vMonth_1 = theInput.substring(p1+1,p2);
	//alert("vMonth_1"+vMonth_1);
	if(vMonth_1 == '08') 
	{
	//alert("vaibhav"+okDate);
		vMonth_1=8;
		vMonth=8;
	}
	if (vMonth_1 == '09')
{
	//alert("vaibhav"+okDate);
		vMonth_1=9;
		vMonth=9;
	}
	var vDate_1 = theInput.substring(0,p1);
	if (vDate_1 == '08' || vDate_1 == '09')
	{
		return(okDate);
	}

	if (vMonth < 1 || vMonth >12)
	{
		return("invMonRange");
	}
	if (vYear < 1901 || vYear >2099)
	{
		
		return("invYearRange");
	}
	if(theInput.substring(p2+1,len).length != 4)
	{
		return("Year");
	}
	if ((vMonth == 1) || (vMonth == 3) || (vMonth == 5) || (vMonth == 7) || (vMonth == 8) || (vMonth == 10) || (vMonth == 12))
	{
		if (vDate>31 || vDate<1)
		{
		//alert("vaibhav31");
			return("31");
		}
		return(okDate);
	}
	else
	{
		if ((vMonth == 4) || (vMonth == 6) || (vMonth == 9) || (vMonth== 11))
		{
			if(vDate>30 || vDate<1)
			{
			//alert("vaibhav30");
				return("30");
			}
			return(okDate);
		}
		else
		{
			if((leapYear - parseInt(leapYear)) == 0)
			{
				if (vDate>29 || vDate<1)
				{
					
					return("Leap");
				}
			}
			else
			{
				if (vDate>28 || vDate<1)
				{
					return("Nonleap");
				}
			}
			return(okDate);
		}
	}
}

function compareDateField(theField1, theField2)
{
	isDate(theField1);
	isDate(theField2);

	theInput1 = theField1.value;
	theInput2 = theField2.value;
	theLength = theInput1.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("The Date "+theInput1+" is bigger than "+theInput2);
            theField1.value="";
						theField1.focus();
						return false;
					}
				}
				else
				{
					alert("The Date "+theInput1+" is bigger than "+theInput2);
           theField1.value="";
					theField1.focus();
					return false;
				}
			}
		
		}
		else
		{
			alert("The Date "+theInput1+" is bigger than "+theInput2);
       theField1.value="";
			theField1.focus();
			return false;
		}
	}
}

function compareDateField1(theField1, theField2)
{
isDate(theField1);
isDate(theField2);
//alert("in compareDateField1");

	 theInput2 = theField1.value;
	 theInput1 = theField2.value;
	theLength = theInput1.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >vDate1)
					{
						
						return true;
					}
					else
					{
                                        
						alert("The Call Start Date "+theInput1+" should be less than "+theInput2);
                                         theField1.value="";
						theField1.focus();
						return false;
					}
				}
				else
				{
                                  
					alert("The Call Start Date "+theInput1+" should be less than "+theInput2);
                                      theField1.value="";
					theField1.focus();
					return false;
				       }
			          }
		
		          }
		else
		{
                
			alert("The Call Start Date "+theInput1+" should be less than "+theInput2);
                      theField1.value="";
			theField1.focus();
			return false;
		}
	}
}

function compareDateLessThan(theField1, theinput)
{
	if(isDate(theField1))
	{
		theInput1 = theField1.value;
		theLength = theInput1.length;

		theInput2 = theinput;
		if(theLength == 0)
		{
			return false;
		}

		var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
		var charSpe = false;

		var pos1 = spcPosition(0, theInput1 );
		var pos2 = spcPosition(pos1+1, theInput1);
		var pos3 = spcPosition(pos2+1, theInput1);

		var len = theInput1.length;

		var vDate1  = parseInt(theInput1.substring(0,pos1),10);
		var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
		var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);

		pos1 = spcPosition(0, theInput2 );
		pos2 = spcPosition(pos1+1, theInput2);
		pos3 = spcPosition(pos2+1, theInput2);
		len = theInput2.length;


		var vDate2  = parseInt(theInput2.substring(0,pos1),10);
		var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
		var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


		if(vYear2 < vYear1 )
		{
			return true;
		}
		else
		{
			if(vYear2 == vYear1)
			{
				if(vMonth2 < vMonth1)
				{
					return true;
				}
				else
				{
					if(vMonth2 == vMonth1)
					{      
					
					
					       if(vDate2 == vDate1)
						{
						
						alert("The Date "+theInput1+" is equal to "+theInput2);
             theField1.value="";
						theField1.focus();
						return false;

								
						}
						if(vDate2 < vDate1)
						{
							return true;
						}
						else
						{
							alert("The Date "+theInput1+" is Less than "+theInput2);
               theField1.value="";
							theField1.focus();
							return false;
						}
						
							
													
					}
					else
					{
						alert("The Date "+theInput1+" is Less than "+theInput2);
             theField1.value="";
						theField1.focus();
						return false;
					}
				}
			}
			else
			{
				alert("The Date "+theInput1+" is Less than "+theInput2);
         theField1.value="";
				theField1.focus();
				return false;
			}
		}
	}
	else
	{
		return false;
	}
	return true;
}











function compareYear(theField1, theinput)
{


	 theInput1 = theField1.value;
	 theLength = theInput1.length;
	 
	 theInput2 = theinput;
	if(theLength == 0)
	{
		return false;
	}
	theInput1 = "1-1-"+theInput1;
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("The Year "+theField1.value+" is bigger than "+theInput2);
            
             theField1.value="";
						theField1.focus();
						return false;
					}
				}
				else
				{
					alert("The Year "+theField1.value+" is bigger than "+theInput2);
           theField1.value="";
					theField1.focus();
					return false;
				}
			}
		
		}
		else
		{
			alert("The Year "+theField1.value+" is bigger than "+theInput2);
       theField1.value="";
			theField1.focus();
			return false;
		}
	
	
	
	}

}

function ifFutureCurrentYear(theinput, theField1)
{


	 theInput2 = theField1.value;
	 
	 theInput1 = theinput;
	 theLength = theInput2.length;
	if(theLength == 0)
	{
		return false;
	}
	theInput1 = "1-1-"+theInput1;
	theInput2 = "1-1-"+theInput2;
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("The Year "+theField1.value+" is not current or future year!");
             theField1.value="";
						theField1.focus();
						return false;
					}
				}
				else
				{
					alert("The Year "+theField1.value+" is not current or future year!");
           theField1.value="";
					theField1.focus();
					return false;
				}
			}
		
		}
		else
		{
			alert("The Year "+theField1.value+" is not current or future year!");
       theField1.value="";
			theField1.focus();
			return false;
		}
	
	
	
	}

}

function ifPastCurrentYear(theinput, theField1)
{


	 theInput1 = theField1.value;
	 
	 theInput2 = theinput;
	 theLength = theInput1.length;
	if(theLength == 0)
	{
		return false;
	}
	theInput1 = "1-1-"+theInput1;
	theInput2 = "1-1-"+theInput2;
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("The Year "+theField1.value+" is not past or current year!");
             theField1.value="";
						theField1.focus();
						return false;
					}
				}
				else
				{
					alert("The Year "+theField1.value+" is not past or current year!");
           theField1.value="";
					theField1.focus();
					return false;
				}
			}
		
		}
		else
		{
			alert("The Year "+theField1.value+" is not past or current year!");
       theField1.value="";
			theField1.focus();
			return false;
		}
	
	
	
	}

}

function compareDateString(theInput1, theInput2)
{
	 
theLength = theInput1.length;
	 
	 theInput2 = theinput;
	if(theLength == 0)
	{
		return false;
	}
theLength = theInput2.length;
	 
	 theInput2 = theinput;
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("The Date "+theInput1+" is bigger than "+theInput2);
             theField1.value="";
						theField1.focus();						
						return false;
					}
				}
				else
				{
					alert("The Date "+theInput1+" is bigger than "+theInput2);
           theField1.value="";
					theField1.focus();
					return false;
				}
			}
		
		}
		else
		{
			alert("The Date "+theInput1+" is bigger than "+theInput2);
       theField1.value="";
			theField1.focus();
			return false;
		}
	}

}


function spcPosition(startFrom, theInput3)
{
        var posi = theInput3.indexOf("-", startFrom);
        if (posi == -1)
	{
		posi = theInput3.indexOf("-", startFrom);
	}
        else if (posi == -1)
	{
		posi = theInput3.indexOf(".", startFrom);
	}
	return(posi);
}

function spcDocPosition(startFrom, theInput3)
{
        var posi = theInput3.indexOf("-", startFrom);
        if (posi == -1)
	{
		posi = theInput3.indexOf("-", startFrom);
	}
        else if (posi == -1)
	{
		posi = theInput3.indexOf(".", startFrom);
	}
	return(posi);
}


function compareDateLessThanValue(theValue1, theinput)
{
	
		theInput1 = theValue1;
		theLength = theInput1.length;

		theInput2 = theinput;
		if(theLength == 0)
		{
			return false;
		}

		var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
		var charSpe = false;

		var pos1 = spcPosition(0, theInput1 );
		var pos2 = spcPosition(pos1+1, theInput1);
		var pos3 = spcPosition(pos2+1, theInput1);

		var len = theInput1.length;

		var vDate1  = parseInt(theInput1.substring(0,pos1),10);
		var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
		var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);

		pos1 = spcPosition(0, theInput2 );
		pos2 = spcPosition(pos1+1, theInput2);
		pos3 = spcPosition(pos2+1, theInput2);
		len = theInput2.length;


		var vDate2  = parseInt(theInput2.substring(0,pos1),10);
		var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
		var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


		if(vYear2 < vYear1 )
		{
			return true;
		}
		else
		{
			if(vYear2 == vYear1)
			{
				if(vMonth2 < vMonth1)
				{
					return true;
				}
				else
				{
					if(vMonth2 == vMonth1)
					{      
					
					
					       if(vDate2 == vDate1)
						{
						
						alert("The Date "+theInput1+" is equal to "+theInput2);
						
						return false;

								
						}
						if(vDate2 < vDate1)
						{
							return true;
						}
						else
						{
							alert("The Date "+theInput1+" is Less than "+theInput2);
							
							return false;
						}
						
							
													
					}
					else
					{
						alert("The Date "+theInput1+" is Less than "+theInput2);
						
						return false;
					}
				}
			}
			else
			{
				alert("The Date "+theInput1+" is Less than "+theInput2);
				
				return false;
			}
		}
	
	return true;
}

function  compareDate(theField1, theField)
		{
		  if (theField1.value!="" && theField.value !="")
		  { 
		    if (!CompDate(theField1,theField.value) )
		      {  
		         alert("Formation Date Should be <= Valid Upto Date ");
              theField1.value="";
		         theField1.focus();}
		   } 
		} 

function CompDate(theField1, theinput)
{
	if(isDate(theField1))
	{
		theInput1 = theField1.value;
		theLength = theInput1.length;

		theInput2 = theinput;
		if(theLength == 0)
		{
			return false;
		}

		var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
		var charSpe = false;

		var pos1 = spcPosition(0, theInput1 );
		var pos2 = spcPosition(pos1+1, theInput1);
		var pos3 = spcPosition(pos2+1, theInput1);

		var len = theInput1.length;

		var vDate1  = parseInt(theInput1.substring(0,pos1),10);
		var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
		var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);

		pos1 = spcPosition(0, theInput2 );
		pos2 = spcPosition(pos1+1, theInput2);
		pos3 = spcPosition(pos2+1, theInput2);
		len = theInput2.length;


		var vDate2  = parseInt(theInput2.substring(0,pos1),10);
		var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
		var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


		if(vYear2 > vYear1 )
		{
			return true;
		}
		else
		{
			if(vYear2 == vYear1)
			{
				if(vMonth2 > vMonth1)
				{
					return true;
				}
				else
				{
					if(vMonth2 == vMonth1)
					{
						if(vDate2 >= vDate1)
						{
							return true;
						}
						else
						{
							alert("The Date "+theInput1+" is bigger than "+theInput2);
               theField1.value="";
							theField1.focus();
							return false;
						}
					}
					else
					{
						alert("The Date "+theInput1+" is bigger than "+theInput2);
             theField1.value="";
						theField1.focus();
						return false;
					}
				}
			}
			else
			{
				alert("The Date "+theInput1+" is bigger than "+theInput2);
         theField1.value="";
				theField1.focus();
				return false;
			}
		}
	}
	else
	{
		return false;
	}
	return true;
}


//This function is used to put seprator.
function dateSeparetor(thefield)
{

//eval("document.forms[0]."+field_name+"").value;
var val=thefield.value;
if(val.length==2)
{val=val+"-";}
if(val.length==5)
{val=val+"-";}
thefield.value=val;

}


/* fn already availabe at line 2 created by ...
function compareFromToDate(theField1, theField2)
{
isDate(theField1);
isDate(theField2);

	 theInput2 = theField1.value;
	 theInput1 = theField2.value;
	theLength = theInput1.length;
	 
   alert(theInput2);
	if(theLength == 0)
	{
		return false;
	}
		
	theLength = theInput2.length;
	 
	if(theLength == 0)
	{
		return false;
	}
		
	var dd1,mm1,yyyy1,dd2,mm2,yyyy2;
	var charSpe = false;

	var pos1 = spcPosition(0, theInput1 );
	var pos2 = spcPosition(pos1+1, theInput1);
	var pos3 = spcPosition(pos2+1, theInput1);
	
	var len = theInput1.length;

	var vDate1  = parseInt(theInput1.substring(0,pos1),10);
	var vMonth1 = parseInt(theInput1.substring(pos1+1,pos2),10);
	var vYear1  = parseInt(theInput1.substring(pos2+1,len),10);


	pos1 = spcPosition(0, theInput2 );
	pos2 = spcPosition(pos1+1, theInput2);
	pos3 = spcPosition(pos2+1, theInput2);
	len = theInput2.length;

			
	var vDate2  = parseInt(theInput2.substring(0,pos1),10);
	var vMonth2 = parseInt(theInput2.substring(pos1+1,pos2),10);
	var vYear2  = parseInt(theInput2.substring(pos2+1,len),10);


	if(vYear2 > vYear1 )
	{
		return true;
	}else
	{
		if(vYear2 == vYear1)
		{
			if(vMonth2 > vMonth1)
			{
				return true;
			
			}
			else
			{
				if(vMonth2 == vMonth1)
				{
					if(vDate2 >= vDate1)
					{
						
						return true;
					}
					else
					{
						alert("From Date "+theInput1+" is bigger than To "+theInput2);
						theField1.focus();
            theField1.select();
						return false;
					}
				}
				else
				{
					alert("From Date "+theInput1+" is bigger than To "+theInput2);
					theField1.focus();
          theField1.select();
					return false;
				}
			}
		
		}
		else
		{
			alert("From Date "+theInput1+" is bigger than To "+theInput2);
			theField1.focus();
      theField1.select();
			return false;
		}
	}
  return true;
}

*/






function date_val(these,end_date)
{
    if(these.value!="")
    {
       if (isDate(these.value)) 
       {         
            
       
       // var date = new Date();
        //var d  = date.getDate();
        //var day = (d < 10) ? '0' + d : d;
       // var m = date.getMonth() + 1;
       // var month = (m < 10) ? '0' + m : m;
       // var yy = date.getYear();
       // var year = (yy < 1000) ? yy + 1900 : yy;
        var t2=end_date.value;
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
            alert("Please select end date greater than start date"); 
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

