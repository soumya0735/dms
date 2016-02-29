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

public class Login extends ActionSupport implements SessionAware {

    private String login;
    private String password;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
     public String authenticate() throws Exception {

        if(login.equals("user")&& password.equals("1234"))
            return SUCCESS;
        else
            return ERROR;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}