/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package registration;

import bean_registration.Registration;
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
import org.apache.struts2.interceptor.SessionAware;

public class RegistrationAction extends ActionSupport implements SessionAware {

    private String userName;
    private String userPassword;
    private String name;
    Map<String, Object> session;
    Registration registration = new Registration();
    List<Registration> submittedRegistration = new ArrayList<Registration>();
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(".+@.+\\.[a-z]+");
    java.util.regex.Matcher m;
    //private String mailSubjectTemplate = "WBSL Registration Notification:- A new user has been Registered on {0}";
    /*
     * private String mailBodyTemplate = "Dear Admin, " + "\n" + "\n" + "A new
     * user has been Registered on {0}." + "\n" + "\n" + "The feedback is :-
     * {1}" + "\n" + "\n" + "Placed by :- {2}" + "\n" + "Organization :- {3}" +
     * "\n" + "userName :- {4}" + "\n" + "\n" + "** This is an auto-generated
     * mail from West Bengal Secretariat Library Website. This may be kept for
     * future reference.**";
     */

    public String getuserName() {
        return userName;
    }

    public void setuserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public List<Registration> getSubmittedRegistration() {
        return submittedRegistration;
    }

    public void setSubmittedRegistration(List<Registration> submittedRegistration) {
        this.submittedRegistration = submittedRegistration;
    }

    public RegistrationAction() {
    }

    public String execute() throws Exception {
        return SUCCESS;
    }

    public String show() throws Exception {
        return SUCCESS;
    }

    public String submitRegistration() throws Exception {

        if (name == null || name.isEmpty()) {
            addActionError("Name Should not be blank");
            return ERROR;
        } else if (name.toLowerCase().contains("script") || name.toLowerCase().contains("img") || name.toLowerCase().contains("iframe") || name.toLowerCase().contains("&lt;") || name.toLowerCase().contains("&gt;") || name.toLowerCase().contains("&amp;") || name.toLowerCase().contains("&quot;") || name.toLowerCase().contains("'") || name.toLowerCase().contains("/") || name.toLowerCase().contains("--") || name.toLowerCase().contains("*") || name.toLowerCase().contains("#") || name.toLowerCase().contains("%") || name.toLowerCase().contains(";") || name.toLowerCase().contains("!")) {
            addActionError("Name Contains Invalid Characters");
            return ERROR;
        } else {
            registration.setName(name);
        }

        if (userName == null || userName.isEmpty()) {
            addActionError("userName should not be blank");
            return ERROR;
        } else if (userName.toLowerCase().contains("script") || userName.toLowerCase().contains("img") || userName.toLowerCase().contains("iframe") || userName.toLowerCase().contains("<") || userName.toLowerCase().contains(">") || userName.toLowerCase().contains("&") || userName.toLowerCase().contains("\"") || userName.toLowerCase().contains("'") || userName.toLowerCase().contains("/") || userName.toLowerCase().contains("--") || userName.toLowerCase().contains("*") || userName.toLowerCase().contains("#") || userName.toLowerCase().contains("%") || userName.toLowerCase().contains(";") || userName.toLowerCase().contains("!")) {
            addActionError("userName Contains Invalid Characters");
            return ERROR;
        } else {
            m = p.matcher(userName);
            if (m.matches()) {
                registration.setUserName(userName);
            } else {
                addActionError("Invalid userName Address");
            }
        }

        if (userPassword == null || userPassword.isEmpty()) {
            addActionError("Password should not be blank");
            return ERROR;
        } else if (userPassword.toLowerCase().contains("script") || userPassword.toLowerCase().contains("img") || userPassword.toLowerCase().contains("iframe") || userPassword.toLowerCase().contains("<") || userPassword.toLowerCase().contains(">") || userPassword.toLowerCase().contains("&") || userPassword.toLowerCase().contains("\"") || userPassword.toLowerCase().contains("'") || userPassword.toLowerCase().contains("/") || userPassword.toLowerCase().contains("--") || userPassword.toLowerCase().contains("*") || userPassword.toLowerCase().contains("#") || userName.toLowerCase().contains("%") || userPassword.toLowerCase().contains(";") || userPassword.toLowerCase().contains("!")) {
            addActionError("Password Contains Invalid Characters");
            return ERROR;
        } else {
            registration.setUserPassword(userPassword);
        }

        try {
            System.out.println("In Try");
            int iCount = Integer.parseInt(Ibatis.getSqlMap().queryForObject("wbsl.checkRegistrationIfExists", registration).toString());
            if (iCount == 0) {
                Ibatis.getSqlMap().insert("wbsl.insertRegistration", registration);
                addActionError("Registration Successful! Please login to access your account.");
                return SUCCESS;
            } else {
                addActionError("User already registered!");
                System.out.println("iCount= " + iCount);
                return ERROR;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
            addActionError("Registration Unsuccessful! Please Try Again.");
            return ERROR;
        }
    }

    public void sendMail(String mailSubject, String mailBody, String senderName, String senderuserName, String receiveruserName, String feedback, String senderOrganisation) {
        String subject = MessageFormat.format(mailSubject, new Date());
        String message = MessageFormat.format(mailBody, new Date(), feedback, senderName, senderOrganisation, senderuserName);
        SendMail mail = new SendMail();
        mail.setFromAddress(senderuserName);
        mail.setToAddress(receiveruserName);
        mail.setSubject(subject);
        mail.setMessage(message);
        mail.sendMail();
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;

    }
}