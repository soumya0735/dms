/* vikash work start here   */
function onSelectInst(obj){
  if(document.getElementById("institute-div-id")!=null){
                    $('#institute-div-id').removeClass("red-border");              
    }
    //If other institute selected
    if(obj.value=="0"){
   
         document.forms[0].org.value="";
          document.getElementById("otherinst").style.display="block";
         document.getElementById("div_insName").style.display="block";
         document.getElementById("div_insNameText").style.display="block";
         document.getElementById("div_insAdd").style.display="block";
         document.getElementById("div_insAddText").style.display="block";
         document.getElementById("div_insType").style.display="block";
         document.getElementById("div_insTypeText").style.display="block";
         document.getElementById("div_insCityLabel").style.display="block";
         document.getElementById("div_insCityCombo").style.display="block";
         
         
         
    }else{
        document.getElementById("div_insName").style.display="none";
         document.getElementById("div_insNameText").style.display="none";
         document.getElementById("div_insAdd").style.display="none";
         document.getElementById("div_insAddText").style.display="none";
         document.getElementById("div_insType").style.display="none";
         document.getElementById("div_insTypeText").style.display="none";
         document.getElementById("div_insCityLabel").style.display="none";
         document.getElementById("div_insCityCombo").style.display="none";
         document.forms[0].org.value=obj.options[obj.selectedIndex].text;         
         document.forms[0].temp_add.value="";
    }
}

function loadStateUser(strEvent)
{
    if(document.getElementById("state-div-id")!=null){
                    $('#state-div-id').removeClass("red-border");
    }
  

document.forms[0].strinstitute.value="";
var selected=document.forms[0].state.value;
var strUserID=document.forms[0].user_id.value;
var url="";
var url1="";
document.forms[0].strInstType.value="";
    if(selected==""){
                var o=document.getElementById("institute");
                len=o.childNodes.length;
                for(var rem=len;rem>1;rem--){
                        o.removeChild(o.childNodes[rem-1]);
                }
                var o2=document.getElementById("strCity");
                len=o2.childNodes.length;
                for(rem=len;rem>1;rem--){
                        o2.removeChild(o2.childNodes[rem-1]);
                }
                document.forms[0].strInstType.value="";
        //return false;
     }
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
        //  alert('Mozilla');
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
/*      partOption1=document.createElement("option");
            partOption1.value="%";
            partOption1.innerText="-Select City-";
            partOption1.text="-Select City-";
            o.appendChild(partOption1); 
            */
          
      var x= str.getElementsByTagName("UOM");
                        for(var y=0;y<x[0].childNodes.length;y++)
                        {
                            partOption1=document.createElement("option");
                            partOption1.value=x[0].childNodes[y].attributes[1].nodeValue;
                            partOption1.innerText=x[0].childNodes[y].attributes[0].nodeValue;
                            partOption1.text=x[0].childNodes[y].attributes[0].nodeValue;
                            o.appendChild(partOption1);                   
                        }
                          // $("#strCity").trigger("liszt:updated"); 
                        loadWorkingInstitutes();                                
                }
  }
 //Institute is being loaded just by click on the state
}    

function loadWorkingInstitutes() {    
    //if(document.forms[0].strinstitute.value=="0")
    //document.getElementById('nameOfInst').style.display='none';
    //document.getElementById("loadingimg").style.display="block";
    //var selected=document.forms[0].strinst_type.value;
    
    var state=document.forms[0].state.value;
    var city=document.getElementById("strCity").value;
    var instType=document.forms[0].strInstType.value;
   /* if(state=="" ||city==""){
        return false;
    }*/
    var url="";
    url="registrationAction.do?hmode=getWorkingInstitutes&city="+city+"&state="+state+"&instType="+instType;
    if (window.XMLHttpRequest) // Mozilla, Safari,...
      { 
            http_request4 = new XMLHttpRequest();
      } 
      else if (window.ActiveXObject)  // IE
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
                
                http_request4.onreadystatechange = loadInstitutesData;
                http_request4.send(null);
}

function loadInstitutesData()
{
//alert("in loadInstitutesData");
var frm=document.forms[0];
var o;


  if(http_request4.readyState == 4){
 
    if(http_request4.status == 200) {
  
        str = http_request4.responseXML.documentElement;
                              
      o=document.getElementById("institute");
                      //  alert(o);
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
                                        
                                     
                                                partOption1=document.createElement("option");
            partOption1.value="0";
            partOption1.innerText="Other Institute";
            partOption1.text="Other Institute";
            o.appendChild(partOption1)
          //  $("#institute").trigger("liszt:updated"); 
    
            
        }
    }//document.getElementById("loadingimg").style.display="none";
}














/* vikash work ends here   */

function chkbroadAreaMajorDiscipline() 
{
   
   
   
    if(document.forms[0].broadArea.value !="" && document.forms[0].majorArea.value!="" ) 
    {
        var bArray= document.forms[0].broadArea.value.split(",");
        var mArray=document.forms[0].majorArea.value.split(",")
        if(bArray.length!=mArray.length) 
        {
            alert("Please Select Broad Area and Corresponding Major Discipline Area Correctly ");
            return false;
        }
        else
        {
         
         return true;
        }
        
    }
}



function checkMaxlenReg(these,maxlength,minlength) 
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
            alert("Document Security Password and Login password Cannot be Same");
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
   if(document.forms[0].strDob.value=="")
   {
        alert("Please Select Date Of Birth First.");
        document.forms[0].strDob.value="";
        these.value="";
        document.forms[0].strDob.focus();
        return false;
        
   }
   else
   {
   
                
                 
                   
                 if(document.forms[0].strDob.value!="")
               {   
                    
                  if(deg_year!="")
                       {
                  
                    if(eval(deg_year-dob)<18)
                    {
                      //alert("You have entered invalid degree year.");
                      alert("Degree year should be 18 years more than Date of Birth");
                      these.value="";
                      these.focus();
                      return false;
                    }
                    else 
                    {
                       
                                   if(deg_year>year) 
                            {
                                  alert("Degree year entered should not be greater than current year");
                                  these.value="";
                                  these.focus();
                                  return false;
                                
                            }
                       
                       
                       
                        
                    }
                }
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
        
        
        
        
       if(_Diff<_diff)
        {
            alert("You should be minimum 18 years in age to register."); 
            these.value="";
            these.focus();
            return false;
        }
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
    
        var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.";
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
    alert("Please enter only alphabets,numbers or dot(.) in User Id.");
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
      
        
        
        new_field_value=new_field_value+"\\"+temp;
      
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
alert("Please Enter atleast one \n Institute Telephone Number. or Mobile Number.");
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
   
    
 function loadUserID()
{
   if(http_request4.readyState == 4)
   {
      
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
              theValue.focus();
              return false;
            }
        }
        


         if(valueToCompare!="" && thisValue!="")
        {
            if(thisValue!=valueToCompare)
    {
                 alert("Password is not same as confirm password");
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
              alert("First Enter Value in Password");
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

function chk_dup() 
{
   

    var edu_year=document.forms[0].edu_year.length;
    var edu_deg=document.forms[0].edu_deg.length;
    
    
    if (edu_year) 
          {
              for (var i = 0;i < edu_year-1;i++) 
              {
                  
                  for(var j=i;j<edu_year-1;j++)
                  {
                           
                  
                          if(document.forms[0].edu_year[i].value==document.forms[0].edu_year[j+1].value) 
                          {
                             
                              
                              
                              alert("Please do not enter duplicate enteries for qualification year ");
                              document.forms[0].edu_year[j+1].focus();
                              document.forms[0].edu_year[j+1].value="";
                              return false;    
                              
                          }
                  }
                  
                  
                  
                  
              }
               

         }
    if (edu_deg) 
          {
              for (var k = 0;k < edu_deg-1;k++) 
              {
                  
                  for(var l=k;l<edu_deg-1;l++)
                  {
                  
                  
                          if(document.forms[0].edu_deg[k].value==document.forms[0].edu_deg[l+1].value) 
                          {
                              alert("Please do not enter duplicate enteries for Degree ");
                              document.forms[0].edu_deg[l+1].focus();
                              document.forms[0].edu_deg[l+1].value="";
                              return false;
                              
                          }
                  }
                  
                  
                  
                  
                  
                  
                  
              }

         }
    
    
}

function chk_qual() 
{

var edu_deg=document.forms[0].edu_deg.length;
var edu_inst=document.forms[0].edu_inst.length;

var edu_field=document.forms[0].edu_field.length;
var edu_year=document.forms[0].edu_year.length;
var work_dur=document.forms[0].work_dur.length;
var work_inst=document.forms[0].work_inst.length;
var work_done=document.forms[0].work_done.length;
if(work_dur) 
{
    
            
              
              for (var i = 0;i < work_dur;i++) 
              {
                  if (document.forms[0].work_dur[i].value == "") 
                  {
                      alert("Missing field Duration");
                      document.forms[0].work_dur[i].focus();
                      return false;
                  }
                  
                
                  
              }
}
else 
{
     
            
          var chk=0;
            
            if (document.forms[0].work_dur.value != "" || document.forms[0].work_inst.value != "" || document.forms[0].work_done.value != "") 
              {
                  
                  
                 chk++;
                  
                  
              }
              if(chk>0)
              {
                  if(document.forms[0].work_dur.value == ""||document.forms[0].work_inst.value =="" ||document.forms[0].work_done.value == "")
                   {  
                      alert("Please Enter Full Detail for Research Training Experience");
                      document.forms[0].work_dur.focus();
                   
                     return false;
                  }
              } 
              
               
              
    
    
    
}
           
if(work_inst) 
{
      
              for (var j = 0;j < work_inst;j++) 
              {
                  if (document.forms[0].work_inst[j].value == "") 
                  {
                      alert("Missing field Institute");
                      document.forms[0].work_inst[j].focus();
                      return false;
                  }
                  
                 
                  
              }
}

if(work_done) 
{
    
              for (var k = 0;k < work_done;k++) 
              {
                  if (document.forms[0].work_done[k].value == "") 
                  {
                      alert("Missing field Particulars of Work Done ");
                      document.forms[0].work_done[k].focus();
                      return false;
                  }
                 
                  
              }
}



    
     if (edu_inst) 
         {
             
            
             
             
              for (var l = 0;l < edu_inst;l++) 
              {
                  if (document.forms[0].edu_deg[l].value == "") 
                  {
                      alert("Missing field Degree");
                      document.forms[0].edu_deg[l].focus();
                      return false;
                  }
                  
                 
                  
              }
                  

          }
          else 
          {
                
          
          
              if (document.forms[0].edu_deg.value == "") 
              {
                  alert("Missing field degree");
                  document.forms[0].edu_deg.focus();
                  return false;
              }
          }
          

         if (edu_inst) 
         {
              for (var m = 0;m < edu_inst;m++) 
              {
                  if (document.forms[0].edu_inst[m].value == "") 
                  {
                      alert("Missing field Institution");
                      document.forms[0].edu_inst[m].focus();
                      return false ;
                  }
                  
              }

        }
        else 
        {
              if (document.forms[0].edu_inst.value == "") 
              {
                  alert("Missing field Institution");
                  document.forms[0].edu_inst.focus();
                  return false;
              }
          }
          
          
          
          
          
          
          
          
          if (edu_field) 
          {
              for (var n = 0;n < edu_field;n++) 
              {
                  if (document.forms[0].edu_field[n].value == "") 
                  {
                      alert("Missing Field");
                      document.forms[0].edu_field[n].focus();
                      return false;
                  }
              }

          }
          else 
          {
              if (document.forms[0].edu_field.value == "") 
              {
                  alert("Missing Field");
                  document.forms[0].edu_field.focus();
                   return false;
              }
          }
          
          
          if (edu_year) 
          {
              for (var o = 0;o < edu_year;o++) 
              {
                  if (document.forms[0].edu_year[o].value == "") 
                  {
                      alert("Missing field Year");
                      document.forms[0].edu_year[o].focus();
                      return false;
                  }
                  
                  
                  
              }

          }
          else 
          {
              if (document.forms[0].edu_year.value == "")
              {
                  alert("Missing field Year");
                  document.forms[0].edu_year.focus();
                  return false;
              }
              
          }
    
    return true;
    
    
    
}


function check_file()
{
 var imageFile = document.forms[0].imageFile.value;
 var resumeFile = document.forms[0].resumeFile.value;
 
 var  file;

     var input = document.getElementById('resumeFile');
     
          
  /* 
 
  if(imageFile!="")
    {
    
      var to_lowerImage = imageFile.toLowerCase();
          if(to_lowerImage.lastIndexOf(".jpg")==-1)
          {
                if(to_lowerImage.lastIndexOf(".jpeg")==-1)
                {
                   alert("Please upload only .jpg extension file");
                   document.forms[0].imageFile.value="";
                   document.forms[0].imageFile.focus();
                   return false;
                 }
          }
          
  }
  */
 if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
    
     file = input.files[0];
        if(file.size > 1024*1000)
        {
        alert("File size cannot exceed 1 MB");
        document.forms[0].resumeFile.focus();
        return false;
                
        }
 
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension file");
                 document.forms[0].resumeFile.focus();
                  document.forms[0].resumeFile.value="";
                 return false;
          }          
    }
}





function check_mandatory(thisEvent)
{
var flag1=false;
var temp;
var fields=new Array();
var fieldDesc=new Array();


if(thisEvent=='Submit')
{

      //fields=new Array("user_id","password","confirmpassword","sal","fullname","lname","desig","strDob","state","strinstitute","mob_no","emailid","strResearch","resumeFile","strDocpass","strDocConPass"); 
     // fieldDesc= new Array("User Id","Password","Confirm Password","Salutation","First Name","Last Name","Designation","Date Of Birth","State","Institute Name","Zip Code","Mobile Number","Email ID","Research Specialization","Resume","Private Key Password ","Confirm Private Key Password ");
  flag1=true;
}
else
{
   //fields=new Array("user_id","password","confirmpassword","sal","fullname","lname","desig","strDob","state","city","zcode","mob_no","emailid","strResearch");  
   //fieldDesc= new Array("User Id","Password","Confirm Password","Salutation","First Name","Last Name","Designation","Date Of Birth","State","City","Zip Code","Mobile Number","Email ID","Research Specialization");
   fields=new Array("user_id","password","confirmpassword","sal","fullname","lname","desig","strDob","mob_no","emailid","strResearch"); 
   fieldDesc= new Array("User Id","Password","Confirm Password","Salutation","First Name","Last Name","Designation","Date Of Birth","Mobile Number","Email ID","Research Specialization");
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
    flag1=true;
  }
  if(thisEvent=='Submit')
      { 
            //If institutte is oyher
            if(document.forms[0].strinstitute.value=="0") {
                if(document.forms[0].org.value==""){
                    alert("Please enter institute name.");
                    return false;
                }
                if(document.forms[0].strInstType.value==""){
                    alert("Please enter institute type.");
                    return false;
                }
                
                /*if(document.forms[0].city.value==""){
                    alert("Please select the City of Institute.");
                    return false;
                }*/
                
                if(document.forms[0].temp_add.value==""){
                    alert("Please enter institute address.");
                    return false;
                }
                
                
            }
      }
  
  if(flag1)
    {
     if(thisEvent=='Submit')
      { 
           var chk=chk_qual();
          if(chk==false) 
           {
           flag1=false;
           return false;
           }
           
           
      var chkdup=chk_dup();
           if(chkdup==false) 
           {
           flag1=false;
           return false;
           }
           var stat=check_file_Resume(); 
          if(stat==false)
          {
           flag1=false;
          return false;
           }
          // var status = checkValues();
                /* if(status == false)
                 {
                  flag1=false;
                  return false;
                 }
        */
           
             /*var contNo=checkContactNo();
         
                if(contNo==false)
                {
                 flag1=false;
                      return false;
                }*/
                
              
                if(flag1)
                {
                 confirmation = confirm("Do you want to proceed with the registration?");
                      if(confirmation == true)
                        {
                          document.forms[0].hmode.value="Save";
                          document.getElementById('login').style.display='inline';
                          document.getElementById('loginpopupObject').style.display='inline';
                          document.forms[0].submit();
                        }
                }
                else
                {
                  return false;
                }
         }
        
        /*
         * MODIFICATION CODE
         * */
         else 
         {
         if(thisEvent=='Modify')
         {
            var chkupdate=chk_qual();
            
           if(chkupdate==false) 
           {
               flag1=false;
                      return false;
           }
           var chkdupupdate=chk_dup();
           if(chkdupupdate==false) 
           {
              flag1=false;
                      return false;
           }
                 
                     var stat=check_file_Resume_modify(); 
                     if(stat==false)
                     {
                    flag1=false;
                      return false;
                     }
                      /*var status1 = checkValues();
                     
                 if(status1 == false)
                 {
                     flag1=false;
                      return false;
                 }*/
               
                     /*var contNo2=checkContactNo();*/
         
                /*if(contNo2==false)
                {
                  flag1=false;
                      return false;
                }*/
                
                //if(checkContactNo())
                  //  {
                      confirmation = confirm("Do you want to proceed with the modification?");
                      if(confirmation == true)
                        {
                          document.forms[0].action="/ICMR/registrationAction.do";
                          document.forms[0].hmode.value="update";
                          document.forms[0].submit();
                        }
                      else
                          return false;
                    //}
                
                
              
//                if(flag1)
//                {
//             confirmation = confirm("Do you want to proceed with the registration?");
//                      if(confirmation == true)
//                        {
//                          document.forms[0].hmode.value="Save";
//                          document.getElementById('login').style.display='inline';
//                          document.getElementById('loginpopupObject').style.display='inline';
//                          document.forms[0].submit();
//                        }
//                }   
         
        }
        }
         
         
         
         
      
 }  
}

function Cancel(thisEvent)
{
           
          location.href="/ICMR/registrationAction.do"; 
          
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
                   document.forms[0].imageFile.value="";
                   document.forms[0].imageFile.focus();
                   return false;
                 }
          }
          
  }

}

function check_file_Resume()
{
//alert("inside check file resume function");
var resumeFile = "";
resumeFile = document.forms[0].resumeFile.value;
if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension for Resume");
                 document.forms[0].resumeFile.value="";
                document.forms[0].resumeFile.focus();
                 return false;
          }
          
  /*   var input = document.getElementById('resumeFile');          
       var file = input.files[0];       
        if(file.size > 1024*1000)
        {
        alert("Resume file size cannot exceed 1 MB");
        document.forms[0].resumeFile.value="";
        document.forms[0].resumeFile.focus();
        return false;
                
        }*/
        
    }
    else{
    alert("Resume field cannot be left blank.");
    return false;
    }
}
function check_file_Resume_modify()
{
//alert("inside check file resume function");
var resumeFile = "";
resumeFile = document.forms[0].resumeFile.value;
if(resumeFile!="")
    {
    var to_lowerResume = resumeFile.toLowerCase();
          if(to_lowerResume.lastIndexOf(".pdf")==-1 )
          {
                 alert("Please upload only .pdf extension for Resume");
                 document.forms[0].resumeFile.value="";
                document.forms[0].resumeFile.focus();
                 return false;
          }
          
  /*   var input = document.getElementById('resumeFile');          
       var file = input.files[0];       
        if(file.size > 1024*1000)
        {
        alert("Resume file size cannot exceed 1 MB");
        document.forms[0].resumeFile.value="";
        document.forms[0].resumeFile.focus();
        return false;
                
        }*/
        
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
    /*if(document.forms[0].org.value != "")
    {
      if(isAlphaNumeric(document.forms[0].org) == false)
      {
     
        return false;
      }
    } */   
     
   /* if(document.forms[0].temp_add.value != "")
    {
      if(isAlphaNumericWithApos(document.forms[0].temp_add) == false)
      {
        return false;
      }
    }*/
     /*if(document.forms[0].zcode.value != "")
    {
      if(isNumber(document.forms[0].zcode) == false)
      {
        
        return false;
      }
    }*/
    /*if(document.forms[0].orgSTD.value != "")
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
    }*/
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
  
 }


function isAlphabet(thisField) 
{
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
                        alert("Invalid Character '" + charSpe+ "' found in the Number. Please Insert a valid Number.");
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
      alert("Year is not in Prescribed Range : 1901-2099"); 
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

 function checkMail()
{


var emailid=document.forms[0].emailid.value;
var url="";

 if(emailid!= null)
   url="registrationAction.do?hmode=checkMailId&emailid="+emailid;    
 

    
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
      http_request4.onreadystatechange = loadEmailID;
      http_request4.send(null);
   
    
      
}

 function checkMailmodify()
{
var emailid=document.forms[0].emailid.value;
var emailidold=document.forms[0].emailidold.value;
//alert("emailidold"+emailidold);
var url="";
 if(emailid!= null)
   url="registrationAction.do?hmode=checkMailId&emailid="+emailid+"&emailidold="+emailidold;    
 

    
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
      http_request4.onreadystatechange = loadEmailID;
      http_request4.send(null);
}

 function loadEmailID()
{

   if(http_request4.readyState == 4)
   {
      
    if(http_request4.status == 200) 
    {
       var str = http_request4.responseXML.documentElement;
       var x= str.getElementsByTagName("EmailID");
        
       if(x[0].childNodes[0].attributes[0].nodeValue!=2)
       {
        alert("Email ID "+document.forms[0].emailid.value+" already exists.");
        document.forms[0].emailid.value="";
        document.forms[0].emailid.focus();
        
       }
     
          
     }
}
}

