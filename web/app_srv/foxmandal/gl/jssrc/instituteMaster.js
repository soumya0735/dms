function validateInstVerify(){
    if(document.forms[0].strState.value==""){
        alert("Please select state.");
        return false;
    }
    if(document.forms[0].strCity.value==""){
        alert("Please select city.");
        return false;
    }
    if(document.forms[0].strinst_type.value==""){
        alert("Please select institute type.");
        return false;
    }
    if(document.forms[0].inst_name.value==""){
        alert("Please enter institute name.");
        return false;
    }
    if(document.forms[0].inst_address.value==""){
        alert("Please enter institute address.");
        return false;
    }
    return true;
}

/*from scientistprofile*/
function loadState(strevent)
{
   if(document.forms[0].strinstitute.value=="0")
    document.getElementById('nameOfInst').style.display='none';
document.getElementById("loadingimg").style.display="block";
var selected;
if(strevent=='S') {
   // document.forms[0].strState.value="";
   // document.forms[0].strinstitute.value="0";
    document.forms[0].strCity.value="";
   // alert("1");
    document.forms[0].strinst_type.value="";
}
else {
   // document.forms[0].strinstitute.value="0";
    document.forms[0].strCity.value="";
    document.forms[0].strinst_type.value="";
}


if(strevent=='S')
selected=document.forms[0].strState.value;
var url="";




  if(selected!= null || selected!= "0")
  {
  if(strevent=='S')
    url="/ICMR/institutemasterAction.do?hmode=getstate&stateType="+selected;   
 else
    url="/ICMR/institutemasterAction.do?hmode=getcity&stateType="+selected;   
  }
//alert(url);
		
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
                if(strevent=='S')
                http_request4.onreadystatechange = loadUomData;
                else
                http_request4.onreadystatechange = loadUomcityData;
                
                http_request4.send(null);

   
    
			
}
    
    function loadUomcityData()
{
//alert("in loadUomcityData");
var frm=document.forms[0];
var o;
var m;


	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
                              
			o=document.getElementById("strcity");
                        
                      // alert("state received"+str);
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
                                        $("#strcity").trigger("liszt:updated");
                                     
		loadInstitutesFromState();	
		
				    
				}
		}document.getElementById("loadingimg").style.display="none";
                
}
    
function loadUomData()
{

var frm=document.forms[0];
var o;
var ct;
var m;

	if(http_request4.readyState == 4){
 
		if(http_request4.status == 200) {
  
				str = http_request4.responseXML.documentElement;
                              
			o=document.getElementById("strstate");
                       
                        ct=document.getElementById("strcity");
                         m=document.getElementById("inst_type");
                        
                       // alert("state received"+str);
		/*	len=o.childNodes.length;
    	for(var rem=len;rem>1;rem--){
				o.removeChild(o.childNodes[rem-1]);
			}
			*/
			
      len=m.childNodes.length;
      for(var rem=len;rem>1;rem--){
				m.removeChild(m.childNodes[rem-1]);
			} 
			
      var  length=ct.childNodes.length;
			for(var nodl=length;nodl>1;nodl--){
				ct.removeChild(ct.childNodes[nodl-1]);
			} 
                        
                        			
			var x= str.getElementsByTagName("UOM");
      var a= str.getElementsByTagName("UOMINST");
			
      for(var y=0;y<x[0].childNodes.length;y++)
					{

					    partOption1=document.createElement("option");
						partOption1.value=x[0].childNodes[y].attributes[1].nodeValue;
						partOption1.innerText=x[0].childNodes[y].attributes[0].nodeValue;
						partOption1.text=x[0].childNodes[y].attributes[0].nodeValue;
						ct.appendChild(partOption1);
                                                
					}
          $("#strcity").trigger("liszt:updated"); 
          
          for(var y1=0;y1<a[0].childNodes.length;y1++)
					{

					    partOption1=document.createElement("option");
						partOption1.value=a[0].childNodes[y1].attributes[1].nodeValue;
						partOption1.innerText=a[0].childNodes[y1].attributes[0].nodeValue;
						partOption1.text=a[0].childNodes[y1].attributes[0].nodeValue;
						m.appendChild(partOption1);
                                               
					}							
				 $("#inst_type").trigger("liszt:updated");
         
         getInstToMergelist();
							
				}
		}document.getElementById("loadingimg").style.display="none";
}

/**/
  
function checkEnter(e){

var characterCode = e.keyCode;
   
        if((characterCode ==13))
        {
   
          e.preventDefault();
        }
    
}

function addinginst() {
//alert("M in saving data"+document.forms[0].action);var
var conmsg=confirm("Do you want to add this institute?");

if(conmsg)
{
 document.forms[0].hmode.value="datasaving";
 document.forms[0].savemode.value="A";
document.forms[0].submit();
}
}



function modifyinginst(thefield) {
if(!validateInstVerify())
    return false;
    if(thefield=="M")
      document.forms[0].savemode.value="M";
    else
      document.forms[0].savemode.value="V";
    
     document.forms[0].hmode.value="datamodify";
     document.forms[0].submit();
}

function change_inst() {
//alert("change inst");
    document.forms[0].hmode.value="changeinst";

document.forms[0].submit();
}

 function getinstlist() {
  if(document.forms[0].strState.value=="%") {
     alert("Please Select State.");
     return false;
 } 
  document.forms[0].hmode.value="changeinst";
     document.forms[0].submit();
 }

 function update_inst() {
     document.forms[0].hmode.value="updateinst";
     document.forms[0].submit();
 }
  
  function edit_inst() {
     document.forms[0].hmode.value="editinst";
     document.forms[0].submit();
 }
 
 function cancel() {
      window.close(self);
 }
 function canceledit() {
 location.href="/ICMR/institutemasterAction.do?hmode=changeinst";
 }