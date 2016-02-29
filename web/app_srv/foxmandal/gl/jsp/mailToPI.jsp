<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <%@page import="in.cdacnoida.icmr.gl.adaptor.DBQueryManager,in.cdacnoida.icmr.gl.adaptor.*" %>
        <%@page import="java.util.ArrayList,in.cdacnoida.icmr.gl.adaptor.mail_sende" %>
  
    <%
   DBQueryManager dbq=new DBQueryManager();
   mail_sende _sendMail= new mail_sende(); 
    String emailMsgTxt="";
    String ProjectURL="";
    ProjectURL=resourceBundle.getValueFromKey("PROJECT_URL");
   String query="";
   ArrayList al = new ArrayList();
   System.out.println("The query is "+query);
     al=dbq.fetchData(query); 
   String query2="";
         if(al.size()>0){
             for(int i=0;i<al.size();i+=5){
              try{
                  emailMsgTxt ="Dear "+al.get(i).toString()+", <br><br>";
                  emailMsgTxt=emailMsgTxt+"This has reference to your full proposal (ID<b> "+al.get(i+1).toString()+")</b>, titled <b>'"+ al.get(i+2).toString()+"'</b>,  submitted to ";
                  emailMsgTxt=emailMsgTxt+"ICMR through Online system on <b>"+ al.get(i+3).toString()+"</b> for funding. <br><br>" ;
                  emailMsgTxt=emailMsgTxt+"Now, the option for <font color='red'>'Online submission of detailed budget with break-up of individual heads'</font> is available in ";
                  emailMsgTxt=emailMsgTxt+"online System .Please login into your account by clicking on the link below.  Click on <font color='blue'>'View ";
                  emailMsgTxt=emailMsgTxt+"Submitted Full Proposal'</font> and then click on <font color='blue'>'Edit'</font> Link under Cost Column to provide the budget with ";
                  emailMsgTxt=emailMsgTxt+"break-up under 'Individual Heads' and finllay click on <font color='blue'>'Submit Budget to ICMR'</font> button. <br><br>";
                  emailMsgTxt=emailMsgTxt+"The system is at  URL:"+ProjectURL+"<br><br>" ;
                  emailMsgTxt=emailMsgTxt+"You are required to submit all the details on an URGENT basis for a speedy processing of your proposal." ;
                  emailMsgTxt=emailMsgTxt+"In the absence of these details  your proposal <b><font color='red'><u>Can NOT BE processed further</u></font></b>.<br><br>";
                  emailMsgTxt=emailMsgTxt+"We look forward to your active cooperation. If you have any quarries, can contact us through Email or through Phone.<br><br>";
                  emailMsgTxt=emailMsgTxt+"<br><br><br>With best regards ,<br> ICMR Team ";
                 _sendMail.TransferToMailServer(al.get(i+4).toString(),  "Regarding Detailed Budget Submission to ICMR", emailMsgTxt );
                  System.out.println(((i/5)+1)+" Mail Sent Succesfully to "+al.get(i).toString());
                 }
             catch(Exception e)
               {
                  query2 =query2+"insert into tdc_mailtoPI(pi_name ,str_email,num_proposal_id,title,submission_date,transactiondate) values('"+al.get(0).toString()+"','"+al.get(4).toString()+"','"+al.get(1).toString()+"','"+al.get(2).toString()+"',to_date('"+al.get(3).toString()+"','dd-mm-yyyy'),sysdate)#@#";   
                     System.out.println(e);
               }
             }
             
if(!query2.equals(""))
{
System.out.println("query2"+query2);
dbq.batchInsert(query2.split("#@#"));
}
         }

     
        
   
  
   
   
        %>
    </head>
    <body></body>
</html>