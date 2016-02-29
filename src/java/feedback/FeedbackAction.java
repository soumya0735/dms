/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package feedback;

import bean_feedback.Feedback;
import bean_feedback.FeedbackAdmin;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
//import dao.Ibatis_Login;
import dao.Ibatis;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts2.interceptor.SessionAware;

public class FeedbackAction extends ActionSupport implements SessionAware {

    private String visitor_Name;
    private String visitor_Email;
    private String visitor_Organisation;
    private String visitor_Address;
    private String visitor_Comment;
    Map<String, Object> session;
    Feedback feedback = new Feedback();
    List<Feedback> submittedFeedback = new ArrayList<Feedback>();
    List<FeedbackAdmin> feedbackAdmin = new ArrayList<FeedbackAdmin>();
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(".+@.+\\.[a-z]+");
    java.util.regex.Matcher m;
    private String mailSubjectTemplate = "Feedback Notification:- A Feedback has been has been placed  on {0}";
    private String mailBodyTemplate = "Dear Admin, " + "\n" + "\n"
            + "A feedback  has been placed on {0}." + "\n" + "\n"
            + "The feedback is :- {1}" + "\n" + "\n"
            + "Placed by    :- {2}" + "\n"
            + "Organization :- {3}" + "\n"
            + "Email :-        {4}" + "\n" + "\n"
            + "** This is an auto-generated mail from West Bengal Secretariat Library Website. This may be kept for future reference.**";

    public String getVisitor_Name() {
        return StringEscapeUtils.escapeHtml(visitor_Name);
    }

    public void setVisitor_Name(String visitor_Name) {
        this.visitor_Name = StringEscapeUtils.escapeHtml(visitor_Name);
    }

    public String getVisitor_Email() {
        return visitor_Email;
    }

    public void setVisitor_Email(String visitor_Email) {
        this.visitor_Email = visitor_Email;
    }

    public String getVisitor_Organisation() {
        return StringEscapeUtils.escapeHtml(visitor_Organisation);
    }

    public void setVisitor_Organisation(String visitor_Organisation) {
        this.visitor_Organisation = StringEscapeUtils.escapeHtml(visitor_Organisation);
    }

    public String getVisitor_Address() {
        return StringEscapeUtils.escapeHtml(visitor_Address);
    }

    public void setVisitor_Address(String visitor_Address) {
        this.visitor_Address = StringEscapeUtils.escapeHtml(visitor_Address);
    }

    public String getVisitor_Comment() {
        return StringEscapeUtils.escapeHtml(visitor_Comment);
    }

    public void setVisitor_Comment(String visitor_Comment) {
        this.visitor_Comment = StringEscapeUtils.escapeHtml(visitor_Comment);
    }

    public List<Feedback> getSubmittedFeedback() {
        return submittedFeedback;
    }

    public void setSubmittedFeedback(List<Feedback> submittedFeedback) {
        this.submittedFeedback = submittedFeedback;
    }

    public List<FeedbackAdmin> getFeedbackAdmin() {
        return feedbackAdmin;
    }

    public void setFeedbackAdmin(List<FeedbackAdmin> feedbackAdmin) {
        this.feedbackAdmin = feedbackAdmin;
    }

    public FeedbackAction() {
    }

    public String execute() throws Exception {
        return SUCCESS;
    }

    public String show() throws Exception {
        return SUCCESS;
    }

    public String submitFeedback() throws Exception {
        System.out.println("test");
        if (visitor_Name == null || visitor_Name.isEmpty()) {
            addActionError("Name Should not be blank");
            return ERROR;
        } else if (visitor_Name.toLowerCase().contains("script") || visitor_Name.toLowerCase().contains("img") || visitor_Name.toLowerCase().contains("iframe") || visitor_Name.toLowerCase().contains("&lt;") || visitor_Name.toLowerCase().contains("&gt;") || visitor_Name.toLowerCase().contains("&amp;") || visitor_Name.toLowerCase().contains("&quot;") || visitor_Name.toLowerCase().contains("'") || visitor_Name.toLowerCase().contains("/") || visitor_Name.toLowerCase().contains("--") || visitor_Name.toLowerCase().contains("*") || visitor_Name.toLowerCase().contains("#") || visitor_Name.toLowerCase().contains("%") || visitor_Name.toLowerCase().contains(";") || visitor_Name.toLowerCase().contains("!")) {
            addActionError("Name Contains Invalid Characters");
            return ERROR;
        } else {
            feedback.setVisitor_Name(visitor_Name);
        }

        if (visitor_Email == null || visitor_Email.isEmpty()) {
            addActionError("Email should not be blank");
            return ERROR;
        } else if (visitor_Email.toLowerCase().contains("script") || visitor_Email.toLowerCase().contains("img") || visitor_Email.toLowerCase().contains("iframe") || visitor_Email.toLowerCase().contains("<") || visitor_Email.toLowerCase().contains(">") || visitor_Email.toLowerCase().contains("&") || visitor_Email.toLowerCase().contains("\"") || visitor_Email.toLowerCase().contains("'") || visitor_Email.toLowerCase().contains("/") || visitor_Email.toLowerCase().contains("--") || visitor_Email.toLowerCase().contains("*") || visitor_Email.toLowerCase().contains("#") || visitor_Email.toLowerCase().contains("%") || visitor_Email.toLowerCase().contains(";") || visitor_Email.toLowerCase().contains("!")) {
            addActionError("Email Contains Invalid Characters");
            return ERROR;
        } else {
            m = p.matcher(visitor_Email);
            if (m.matches()) {
                feedback.setVisitor_Email(visitor_Email);
            } else {
                addActionError("Invalid Email Address");
            }
        }

        if (visitor_Organisation == null || visitor_Organisation.isEmpty()) {
            addActionError("Organisation should not be blank.");
            return ERROR;
        } else if (visitor_Organisation.toLowerCase().contains("script") || visitor_Organisation.toLowerCase().contains("img") || visitor_Organisation.toLowerCase().contains("iframe") || visitor_Organisation.toLowerCase().contains("&lt;") || visitor_Organisation.toLowerCase().contains("&gt;") || visitor_Organisation.toLowerCase().contains("&amp;") || visitor_Organisation.toLowerCase().contains("&quot;") || visitor_Organisation.toLowerCase().contains("'") || visitor_Organisation.toLowerCase().contains("/") || visitor_Organisation.toLowerCase().contains("--") || visitor_Organisation.toLowerCase().contains("*") || visitor_Organisation.toLowerCase().contains("#") || visitor_Organisation.toLowerCase().contains("%") || visitor_Organisation.toLowerCase().contains(";") || visitor_Organisation.toLowerCase().contains("!")) {
            addActionError("Organisation Contains Invalid Characters");
            return ERROR;
        } else {
            feedback.setVisitor_Organisation(visitor_Organisation);
        }

        if (visitor_Address.toLowerCase().contains("script") || visitor_Address.toLowerCase().contains("img") || visitor_Address.toLowerCase().contains("iframe") || visitor_Address.toLowerCase().contains("&lt;") || visitor_Address.toLowerCase().contains("&gt;") || visitor_Address.toLowerCase().contains("&amp;") || visitor_Address.toLowerCase().contains("&quot;") || visitor_Address.toLowerCase().contains("'") || visitor_Address.toLowerCase().contains("/") || visitor_Address.toLowerCase().contains("--") || visitor_Address.toLowerCase().contains("*") || visitor_Address.toLowerCase().contains("#") || visitor_Address.toLowerCase().contains("%") || visitor_Address.toLowerCase().contains(";") || visitor_Address.toLowerCase().contains("!")) {
            addActionError("Address Contains Invalid Characters");
            return ERROR;
        } else {
            feedback.setVisitor_Address(visitor_Address);
        }

        if (visitor_Comment == null || visitor_Comment.isEmpty()) {
            addActionError("Please Write some Feedback");
            return ERROR;
        } else if (visitor_Comment.toLowerCase().contains("script") || visitor_Comment.toLowerCase().contains("img") || visitor_Comment.toLowerCase().contains("iframe") || visitor_Comment.toLowerCase().contains("&lt;") || visitor_Comment.toLowerCase().contains("&gt;") || visitor_Comment.toLowerCase().contains("&amp;") || visitor_Comment.toLowerCase().contains("&quot;") || visitor_Comment.toLowerCase().contains("'") || visitor_Comment.toLowerCase().contains("/") || visitor_Comment.toLowerCase().contains("--") || visitor_Comment.toLowerCase().contains("*") || visitor_Comment.toLowerCase().contains("#") || visitor_Comment.toLowerCase().contains("%") || visitor_Comment.toLowerCase().contains(";") || visitor_Comment.toLowerCase().contains("!")) {
            addActionError("Feedback Contains Invalid Characters");
            return ERROR;
        } else {
            feedback.setVisitor_Comment(visitor_Comment);
        }


        try {
            int feedback_id = Integer.parseInt(Ibatis.getSqlMap().insert("wbsl.insertFeedback", feedback).toString());
            System.out.println("Feedback= " + feedback_id);
            submittedFeedback = Ibatis.getSqlMap().queryForList("wbsl.getCurrentFeedback", feedback_id);
            feedbackAdmin = Ibatis.getSqlMap().queryForList("wbsl.getCurrentAdmin");
            sendMail(mailSubjectTemplate, mailBodyTemplate, visitor_Name, visitor_Email, feedbackAdmin.get(0).getAdmin_Email(), visitor_Comment, visitor_Organisation);
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Feedback not submitted properly");
            return ERROR;
        }
    }

    public void sendMail(String mailSubject, String mailBody, String senderName, String senderEmail, String receiverEmail, String feedback, String senderOrganisation) {
        String subject = MessageFormat.format(mailSubject, new Date());
        String message = MessageFormat.format(mailBody, new Date(), feedback, senderName, senderOrganisation, senderEmail);
        SendMail mail = new SendMail();
        mail.setFromAddress(senderEmail);
        mail.setToAddress(receiverEmail);
        mail.setSubject(subject);
        mail.setMessage(message);
        mail.sendMail();
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;

    }
}