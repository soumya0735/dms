/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import bean_password.Password;
import dao.Ibatis;

/**
 *
 * @author Arghya Ghosh
 */
public class PasswordAction extends ActionSupport implements SessionAware {

    private String userName;
    private String userPassword;
    private String userNewPassword;
    Map<String, Object> session;
    Password password = new Password();

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public String submitPassword() throws Exception {

        userName = (String) (session.get("userName"));
        password.setUserName(userName);

        System.out.println("User Name: " + userName);
        System.out.println("New Password: " + userNewPassword);

        if (userPassword == null || userPassword.isEmpty()) {
            addActionError("Password should not be blank");
            return ERROR;
        } else if (userPassword.toLowerCase().contains("script") || userPassword.toLowerCase().contains("img") || userPassword.toLowerCase().contains("iframe") || userPassword.toLowerCase().contains("<") || userPassword.toLowerCase().contains(">") || userPassword.toLowerCase().contains("&") || userPassword.toLowerCase().contains("\"") || userPassword.toLowerCase().contains("'") || userPassword.toLowerCase().contains("/") || userPassword.toLowerCase().contains("--") || userPassword.toLowerCase().contains("*") || userPassword.toLowerCase().contains("#") || userName.toLowerCase().contains("%") || userPassword.toLowerCase().contains(";") || userPassword.toLowerCase().contains("!")) {
            addActionError("Old Password Contains Invalid Characters!");
            return ERROR;
        }

        if (userNewPassword == null || userNewPassword.isEmpty()) {
            addActionError("Password should not be blank");
            return ERROR;
        } else if (userNewPassword.toLowerCase().contains("script") || userNewPassword.toLowerCase().contains("img") || userNewPassword.toLowerCase().contains("iframe") || userNewPassword.toLowerCase().contains("<") || userNewPassword.toLowerCase().contains(">") || userNewPassword.toLowerCase().contains("&") || userNewPassword.toLowerCase().contains("\"") || userNewPassword.toLowerCase().contains("'") || userNewPassword.toLowerCase().contains("/") || userNewPassword.toLowerCase().contains("--") || userNewPassword.toLowerCase().contains("*") || userNewPassword.toLowerCase().contains("#") || userNewPassword.toLowerCase().contains("%") || userNewPassword.toLowerCase().contains(";") || userNewPassword.toLowerCase().contains("!")) {
            addActionError("New Password Contains Invalid Characters!");
            return ERROR;
        }

        try {
            password.setUserPassword(userPassword);
            int iCount = Integer.parseInt(Ibatis.getSqlMap().queryForObject("wbsl.checkPassword", password).toString());
            if (iCount == 0) {
                addActionError("Incorrect Old Password!");
                return ERROR;
            } else {
                password.setUserPassword(userNewPassword);
                Ibatis.getSqlMap().update("wbsl.updatePassword", password);
                addActionMessage("Password Changed Successfully!");
                return SUCCESS;
            }

        } catch (Exception e) {
            System.out.println("Error: " + e);
            addActionError("Password Change Unsuccessful! Please Try Again.");
            return ERROR;
        }
    }

    public Password getPassword() {
        return password;
    }

    public void setPassword(Password password) {
        this.password = password;
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

    public String getUserNewPassword() {
        return userNewPassword;
    }

    public void setUserNewPassword(String userNewPassword) {
        this.userNewPassword = userNewPassword;
    }
}
