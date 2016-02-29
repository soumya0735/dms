
function checkSecPassword() 
{
    if(document.getElementById("strDocSecurityPass")!=null) 
    {
         if(document.getElementById("strDocSecurityPass").value=="")
         {
         alert("Please Enter Document Security Password");
         document.getElementById("strDocSecurityPass").focus();
         return false;
         }
         else
          return true;
     }
    else
    {
     document.getElementById("tdDocSec").style.visibility="hidden" ;
     document.getElementById("rightTick").style.visibility="hidden";     
     return true;
    }
}

/**
 *CODE fOR expert TO DOWNLOAD fULL ProposaL.
 *checkSecurityPassFullProposal FUNCTION IS RESPONSIBLE FOR AUTHENTICATING PRIVATE KEY ENTERED BY THE USER
 * THIS RETURNS FALSE IF THE PASSWORD FIELD IS EMPTY.ELSE, IT CHECKS WHETHER THE PASSWORD IS CORRECT OR NOT IN THE REGISTRATIONACTION FILE
 *  
 */

 function checkSecurityPassFullProposal() {
 
 if(document.getElementById("strDocSecurityPass").value=="") {
            alert("Please Enter Private Key Password");
             document.getElementById("strDocSecurityPass").focus();    
         return false;
        }
        else {
       
        document.getElementById('rightTick').style.visibility = "visible";
        //alert("hi");
            url="/ICMR/registrationAction.do?hmode=checkSecurityPassword&secPass="+document.getElementById("strDocSecurityPass").value;	
           // alert(url);
             if (window.XMLHttpRequest) // Mozilla, Safari,...
		http_request4 = new XMLHttpRequest();
            else if (window.ActiveXObject)  // IE
            {     
                  //alert("in else if");
                    try
                    {
                    http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {  try {
                                    http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            catch (e) {}
                    }
            }
            if (!http_request4) 
            {
                alert('Giving up :( Cannot create an XMLHTTP instance');
                return false;
             }
          document.getElementById("strDocSecurityPass").readOnly=true;
          document.getElementById('login').style.display='inline';
          document.getElementById('loginpopupObject').style.display='inline';
          http_request4.open("GET", url, true);          
          //alert("before function");
	  http_request4.onreadystatechange = loadPassDetailsFullProposal;
          http_request4.send(null);
          return false;
        }        
    }
   
//WHEN THE http_request4.readyState IS 4 AND http_request4.status IS 200 AND ALSO THE RESPONSE TEXT RECEIVED FROM checkSecurityPassword IS "Security Password is Correct" THEN
// AN ALERT MESSAGE IS SHOWN TO THE USER AND THEREAFTER THE FILE DOWNLOADS IN THE DECRYPTED FORMAT AUTOMATICALLY.

function loadPassDetailsFullProposal() {
       // alert("swati");
       
        if(http_request4.readyState == 4)
          {
          //alert("http_request4.readyState"+http_request4.readyState);          
            if(http_request4.status == 200) 
              {
               document.getElementById('rightTick').style.visibility = "hidden";
              // alert("http_request4.status"+http_request4.status);
               var str = http_request4.responseText;
               if(str=="Security Password is Correct") 
                 {
                  document.getElementById('rightTick').style.visibility = "visible";
                  document.getElementById('login').style.display='none';
                  document.getElementById('loginpopupObject').style.display='none';
                  document.getElementById("strDocSecurityPass").readOnly=true;
                
                 // alert("The document security password is correct!");               
                  
                    document.forms[0].action="/ICMR/registrationAction.do?hmode=getFile4Expert&strFileType=F&strProposalId="+document.forms[0].strProposalId.value+"&strFileId="+document.forms[0].strVersionId.value;
                    document.forms[0].method="post";
                    document.forms[0].submit();
                  }
               else
               {
                     if(str=="Your Session is Expired") 
                     {
                     alert("Your Session has been Expired");
                     location.href="/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
                     }
                     else if(str=="Your Old Security Password is Incorrect. Pleasee Enter the Correct Security Password.") 
                          alert("The Security Password , You Entered is Incorrect");
                    else if(str=="Cannot get Private Key") 
                         alert("Your Priate Keys could not be Retrieved\nPlease Try Again Later");

                    document.getElementById("strDocSecurityPass").value="";
                    document.getElementById("strDocSecurityPass").readOnly=false;
                    document.getElementById("strDocSecurityPass").focus();   
                }
              }//END IF STATUS IF
          }//END OF READYSTATE IF
    }    
  //*****expert Full Proposal Ends Here
 function SettingField()
    {
   document.getElementById("strDocSecurityPass").value="";
    }

function checkSecurityPass() {
    url="/ICMR/registrationAction.do?hmode=checkSecurityPassword&secPass="+document.getElementById("strDocSecurityPass").value;	
     if (window.XMLHttpRequest) // Mozilla, Safari,...
        http_request4 = new XMLHttpRequest();
    else if (window.ActiveXObject)  // IE
    {
            try
            {
            http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {  try {
                            http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (e) {}
            }
    }
    if (!http_request4) 
    {
        alert('Giving up :( Cannot create an XMLHTTP instance');
        return false;
     }
  document.getElementById("strDocSecurityPass").readOnly=true;
  document.getElementById('login').style.display='inline';
   document.getElementById('loginpopupObject').style.display='inline';
  http_request4.open("GET", url, true);
  http_request4.onreadystatechange = loadPassDetails;
  http_request4.send(null);
}
    function loadPassDetails() {
        if(http_request4.readyState == 4)
          {
            if(http_request4.status == 200) 
              {               
               var str = http_request4.responseText;
               if(str=="Security Password is Correct")
                  document.f1.submit();                                 
               else
               {
                     if(str=="Your Session is Expired") 
                     {
                     alert("Your Session has been Expired");
                     location.href="/ICMR/app_srv/icmr/gl/jsp/LogOut.jsp";
                     }
                     else if(str=="Your Old Security Password is Incorrect. Pleasee Enter the Correct Security Password.") 
                          alert("The security password is incorrect.");
                    else if(str=="Cannot get Private Key")
                         alert("Your Private Keys could not be Retrieved\nPlease Try Again Later");
                    document.getElementById('login').style.display='none';
                    document.getElementById('loginpopupObject').style.display='none';
                    document.getElementById("strDocSecurityPass").value="";
                    document.getElementById("strDocSecurityPass").readOnly=false;
                    document.getElementById("strDocSecurityPass").focus();   
                }
              }
          }
    }
    
    
    function checkSecPassword() 
{
    if(document.getElementById("strDocSecurityPass")!=null) 
    {
         if(document.getElementById("strDocSecurityPass").value=="")
         {
         alert("Please Enter Document Security password");
         document.getElementById("strDocSecurityPass").focus();
         return false;
         }
         else
          return true;
     }
    else
    {
     document.getElementById("tdDocSec").style.visibility="hidden" ;
     document.getElementById("rightTick").style.visibility="hidden" ;
     
     return true;
    }
}


function checkSecurityPassAllocator() {

        if(document.getElementById("strDocSecurityPass").value=="") {
            alert("Please Enter Document Security Password");
             document.getElementById("strDocSecurityPass").focus();    
         return false;
        }
        else {
       theField=document.getElementById("strDocSecurityPass");
             url="/ICMR/registrationAction.do?hmode=checkSecurityPassword&secPass="+theField.value;	
             if (window.XMLHttpRequest) // Mozilla, Safari,...
		    		http_request4 = new XMLHttpRequest();
            else if (window.ActiveXObject)  // IE
            {
                    try
                    {
                    http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {  try {
                                    http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            catch (e) {}
                    }
            }
            if (!http_request4) 
            {
                alert('Giving up :( Cannot create an XMLHTTP instance');
                return false;
             }
             
               document.getElementById('loadingObject').style.display='inline';
          document.getElementById("strDocSecurityPass").readOnly=true;
          http_request4.open("GET", url, true);
	  http_request4.onreadystatechange = loadPassDetailsAllocator;
          http_request4.send(null);
        }
        
    }
    function loadPassDetailsAllocator() {
        if(http_request4.readyState == 4)
          {
            if(http_request4.status == 200) 
              {
               document.getElementById('loadingObject').style.display='none';
               var str = http_request4.responseText;
               if(str=="Security Password is Correct")
               {   document.getElementById("strDocSecurityPass").readOnly=true;
                   document.getElementById('login').style.display='none';
                   document.getElementById('loginpopupObject').style.display='none';
                   document.forms[0].action="/ICMR/allocatorAbstract.do?hmode=forwardWG";
                   document.forms[0].method="post";
                   document.forms[0].submit();
               }
               else
               {
                     if(str=="Your Session is Expired") 
                     {
                     alert("Your Session has been Expired");
                     location.href="/ICMR/app_srv/icmr/gl/jsp/LogOut.jsp";
                     }
                     else if(str=="Your Old Security Password is Incorrect. Please Enter the Correct Security Password.") 
                          alert("The Security Passwrod , You Entered is Incorrect");
                    else if(str=="Cannot get Private Key") 
                         alert("Your Priate Keys could not be Retrieved\nPlease Try Again Later");
                    document.getElementById("strDocSecurityPass").value="";
                    document.getElementById("strDocSecurityPass").readOnly=false;
                    document.getElementById("strDocSecurityPass").focus();    
               }
              }
          }
    }
    
    
    /*--------------------------------------------------------------------------------------------------------------
      for Downloading PFX File
    --------------------------------------------------------------------------------------------------------------*/
    function getPFXFile() {

        if(document.getElementById("strDocSecurityPass").value=="")
         return false;
        else {
            theField=document.getElementById("strDocSecurityPass");
             url="/ICMR/registrationAction.do?hmode=checkSecurityPassword&secPass="+theField.value;	
             if (window.XMLHttpRequest) // Mozilla, Safari,...
		    		http_request4 = new XMLHttpRequest();
            else if (window.ActiveXObject)  // IE
            {
                    try
                    {
                    http_request4 = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {  try {
                                    http_request4 = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            catch (e) {}
                    }
            }
            if (!http_request4) 
            {
                alert('Giving up :( Cannot create an XMLHTTP instance');
                return false;
             }
          document.getElementById("strDocSecurityPass").readOnly=true;
          document.getElementById('login').style.display='inline';
           document.getElementById('loginpopupObject').style.display='inline';
          http_request4.open("GET", url, true);
	  http_request4.onreadystatechange = loadGetPFXDetails;
          http_request4.send(null);
        }
        
    }
    function loadGetPFXDetails() {
        if(http_request4.readyState == 4)
          {
            if(http_request4.status == 200) 
              {
               
               var str = http_request4.responseText;
               if(str=="Security Password is Correct")
               {
                    document.getElementById('login').style.display='none';
                    document.getElementById('loginpopupObject').style.display='none';
                    document.getElementById('rightTick').style.visibility = "visible";
                    document.getElementById("strDocSecurityPass").readOnly=true;                   
                    document.forms[0].method="post";
                    document.forms[0].action="/ICMR/registrationAction.do?hmode=getPFXFile&strEmpId="+document.forms[0].strEmpId.value;
                    document.forms[0].submit();
               }
               else
               {
                     if(str=="Your Session is Expired") 
                     {
                     alert("Your Session has been Expired");
                     location.href="/ICMR/app_srv/icmr/gl/jsp/LogOut.jsp";
                     }
                     else if(str=="Your Old Security Password is Incorrect. Please Enter the Correct Security Password.") 
                          alert("The Security Passwrod , You Entered is Incorrect");
                    else if(str=="Cannot get Private Key") 
                         alert("Your Priate Keys could not be Retrieved\nPlease Try Again Later");
                    document.getElementById('login').style.display='none';
                    document.getElementById('loginpopupObject').style.display='none';
                    document.getElementById("strDocSecurityPass").value="";
                    document.getElementById("strDocSecurityPass").readOnly=false;
                    document.getElementById("strDocSecurityPass").focus();    
               }
              }
          }
    }