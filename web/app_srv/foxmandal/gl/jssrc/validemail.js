
//********************Function for validation of Email********************
/*function isEmail(obj) 
{

	obj.value=trim(obj.value);
	var string=obj.value;	
	var at="@";
	var dot=".";
	var lat=string.indexOf(at);
  var lstr=string.length;
	var ldot=string.indexOf(dot);

	if(string!="")
	{
		
    var lenAf=string.substring(ldot+1,lstr).length;
    var count=0;
    var countAf=0;
    var check = "0123456789";
    var len=string.substring(0,ldot).length;
    
    for(var i=0;i<ldot;i++)
    {
      
      var ch=string.substring(0,ldot).charAt(i);
      
      for (var j = 0;  j < check.length; j++)
      {
          if (ch == check.charAt(j))
          {
              count++;
          }
      }

    }
    
    
    if(count==len-1)
    {
      alert("Please Enter Valid E-Mail ID!");
		   obj.focus();
       obj.value="";
		   return false;
    }
    
    
    for(var k=0;k<lenAf;k++)
    {
        var ch=string.substring(ldot+1,lstr).charAt(k);
        for (var l = 0; l < check.length; l++)
      {
          if (ch == check.charAt(l))
          {
              countAf++;
          }
      }
    }
    if(countAf==lenAf)
    {
      alert("Please Enter Valid E-Mail ID!");
		   obj.focus();
       obj.value="";
		   return false;
    }
    
    
    if (string.indexOf(at)==-1){
		   alert("Please Enter Valid E-mail ID!");
		   obj.focus();
       obj.value="";
		   return false;
		}

		if (string.indexOf(at)==-1 || string.indexOf(at)==0 || string.indexOf(at)==lstr || string.indexOf(at)==(lstr-1)){
		   alert("Please Enter Valid E-Mail ID!");
		   obj.focus();
       obj.value="";
		   return false;
		}

		if (string.indexOf(dot)==-1 || string.indexOf(dot)==0 || string.indexOf(dot)==lstr || string.indexOf(dot)==(lstr-1)){
			alert("Please Enter Valid E-Mail ID!");
			obj.focus();
      obj.value="";
			return false;
		}

		 if (string.indexOf(at,(lat+1))!=-1){
			alert("Please Enter Valid E-Mail ID!");
			obj.focus();
      obj.value="";
			return false;
		 }

		 if (string.substring(lat-1,lat)==dot || string.substring(lat+1,lat+2)==dot){
			alert("Please Enter Valid E-Mail ID!");
			obj.focus();
      obj.value="";
			return false;
		 }

		 if (string.indexOf(dot,(lat+2))==-1){
			alert("Please Enter Valid E-Mail ID!");
			obj.value="";
			obj.focus();
			return false;
		 }
		
		 if (string.indexOf(" ")!=-1){
			alert("Please Enter Valid E-Mail ID!");
			obj.value="";
			obj.focus();
			return false;
		 }
	}
   if(checkSpChar(obj) == false)
   {
       return false;
   }
					
  }
//**********************End of the isEmail function*****************/

function isEmail(obj) 
{
   

                
                obj.value=trim(obj.value);
	        var str=obj.value;    
		var at="@"
		var dot="."
		var lat=str.indexOf(at);
		var lstr=str.length;
		var ldot=str.indexOf(dot);
            if (str!=""){
                 
		
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID.");
		   return false;
		}
                if(str.indexOf(dot)-1==str.indexOf(at)) {
                  alert("Invalid E-mail ID.");
		   return false;  
                }

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID.");
		   return false;
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID.");
		    return false;
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID.");
		    return false;
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID.");
		    return false;
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID.");
		    return false;
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID.");
		    return false;
		 }
            }
 	 return true
           
	}

function isEmail1 (s)
{

var rgEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9])+$/;
  if(s.value.match(rgEmail))
   {
      return true;
  }
  else
  {
      alert("Invalid Email id");
      return false;
      
  }
}

function emailValidator(elem, helperMsg){
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(elem.value.match(emailExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}