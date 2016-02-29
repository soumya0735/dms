function cancelRelease(userType)
{
    if (userType=='A')
    {
      location.href="/ICMR/allocatorPage.do";
    } 
    else if (userType=='O')
    {
     location.href="/ICMR/pohome.do";
    } 
    else if (userType=='F')
    {
     location.href="/ICMR/financePage.do";
    } 
}


//hide or shows the mail editor
function showHideEditor()
{
if (document.getElementById("isSendMail").checked)
   {
   document.getElementById("editorDiv").style.display='block';
   }
   else {
   document.getElementById("editorDiv").style.display='none';
   }
   
}


//Break up of sanctioned budget
function breakupOfSanctionedBudget(propID,versionID,collaboratorID,instName)
{

var str="/ICMR/app_srv/icmr/mm01/jsp/view_crp_budget_institutewise.jsp?strProposalId="+propID+"&strVersionId="+versionID+"&collaboratorID="+collaboratorID+"&instName="+instName;
window.open(str,'new','scrollbars,width=900,height=400,left=130,top=200');
}




//Replace the institute id with entered amount , else with zero
function replaceInstituteIdWithAmount(enteredAmountAndInst)
{

var idOfInst= enteredAmountAndInst.id;           //the name of the institute
var enteredAmount=enteredAmountAndInst.value;   //amount entered by the user
var idToReplace ="mail_"+idOfInst;

//using eval to retrieve the element of the target element
//eval("document.getElementById('mail_"+idOfInst+"')").value=enteredAmount;  //enteredAmount

 //$('#lblVessel').text("NewText");
$('#'+idToReplace).text(enteredAmount);


}






//default contents of the mail editor
function defaultMail(){
alert ('defaultMail');
    var str=document.forms[0].strMessageBody.value;
    $('#editor').html(str.replace('#0','Will be replaced by submitted budget'));  
    
}



//for the back button
function goBack()
{
         if (document.forms[0].calledFrom.value=="onGoingProjects")
         {
        document.forms[0].action="/ICMR/allocatorAbstract.do?hmode=ongoingDetails";
         }
         else if (document.forms[0].calledFrom.value=="fullPaper")
         {
         document.forms[0].action="/ICMR/saveSemiModified.do";   //name of action which takes to allocator full paper
         }
         
        document.forms[0].submit();
}


//save as draft
//isDrafted is set to "yes" and then the form is submitted
function saveAsDraftRelease()
{
document.forms[0].isDrafted.value="yes";

submitForm();
}




//submit new release into database
function submitForm()
{
var confirmMessage="Do you want to save the released budget?";
if(document.forms[0].isDrafted.value=="yes")
{
confirmMessage="Do you want to save the entered details as draft?";
}

     document.forms[0].hmode.value="saveReleaseBudget";
        document.forms[0].action="/ICMR/releaseAction.do";
        document.forms[0].method="post";
         confirmation = confirm(confirmMessage);
        if(confirmation == true)
        {
        
        /*Start:hiding all the buttons*/
     document.getElementById("draftRelease").style.display='none';
     /*document.getElementById("submitRelease").style.display='none';*/
          /*End:hiding all the buttons*/
          
            /*Start:Show the loading screen*/
          document.getElementById("loadingimg").style.display="inline";  //shows the image which tells user to wait
              document.getElementById("login").style.display="inline";  //shows the image which tells user to wait
        /*End:Show the loading screen*/
        
        
        /*Storing the contents of the mail*/
        var html = $('#editor').html();
                   $("#mailText").val(html);
        /*Storing the contents of the mail*/
               document.forms[0].submit();
        }
        else
        {
                return false;
        }       
}
    
 //Ensures released budget does not exceed the remaining budget   
function checkLimitAmount(enteredAmountAndInst)
{
var idOfInst= enteredAmountAndInst.id;           //the name of the institute
var enteredAmount=enteredAmountAndInst.value;   //amount entered by the user
var nameOfControl= 'remaining_'+idOfInst;
var remainingAmount=document.getElementsByName(nameOfControl)[0].value;

if (parseInt(enteredAmount)>parseInt(remainingAmount))
   {
   alert ("Entered amount exceeds the remaining amount.\nKindly enter the correct amount or increase the budget of the project.");
   enteredAmountAndInst.value="";
   enteredAmountAndInst.setfocus();
   }
else
{
// do nothing
}

}

//Shows the history of the released budget of a particular institute
function showHistoryOfRelease(instituteID,instituteName,strProposalId,strVersionId)
{
var str = "/ICMR/app_srv/icmr/mm02/jsp/view_release_budget_history.jsp?instituteID="+instituteID+"&isSingleInstitute=yes&instituteName="+instituteName+"&strProposalId="+strProposalId+"&strVersionId="+strVersionId; 
      window.open(str, 'new', 'scrollbars,width=1100,height=450,top=175,left=175');

}


///for accordian
  
$(document).ready(function(){
  var animTime = 300,
      clickPolice = false;
  
  $(document).on('touchstart click', '.acc-btn', function(){
    if(!clickPolice){
       clickPolice = true;
      
      var currIndex = $(this).index('.acc-btn'),
          targetHeight = $('.acc-content-inner').eq(currIndex).outerHeight();
   
      $('.acc-btn h1').removeClass('selected');
      $(this).find('h1').addClass('selected');
      
      $('.acc-content').stop().animate({ height: 0 }, animTime);
      $('.acc-content').eq(currIndex).stop().animate({ height: targetHeight }, animTime);

      setTimeout(function(){ clickPolice = false; }, animTime);
    }
    
  });
  
});



