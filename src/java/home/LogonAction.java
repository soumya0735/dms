/*
 * LogonAction.java
 *
 * Created on June 8, 2007, 8:21 PM
 */
package home;

import bean.login_Bean;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Sourav Dalal
 * @version 1.1
 */
public class LogonAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;
    private String userName, name, userPassword, operationtype, role, operationdetails, type, src;
    private int userId;
    List<login_Bean> logonInformation = new ArrayList<login_Bean>();
    login_Bean loginBean = new login_Bean();
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public String execute() throws Exception {
        String userId = (String) session.get("userName");
        int userCode = 0;
        String role = null;
        if (userId == null) {
            System.out.println("No session");
            loginBean.setUserName(userName);
            loginBean.setName(name);
            loginBean.setUserPassword(userPassword);

        } else {
            System.out.println("Session Exists");
            session.remove("userName");
            session.remove("name");
            loginBean.setUserName(userName);
            loginBean.setName(name);
            loginBean.setUserPassword(userPassword);
        }
        logonInformation = Ibatis.getSqlMap().queryForList("metadata.checkLogin", loginBean);
        if (logonInformation.size() == 0) {
            addActionError("Unable to Login check User Id or Password");
            return ERROR;
        } else {
            for (int cnt = 0; cnt < logonInformation.size(); cnt++) {
                userCode = logonInformation.get(cnt).getUserId();
                role = logonInformation.get(cnt).getRole();
                userName = logonInformation.get(cnt).getUserName();
                name = logonInformation.get(cnt).getName();
                type=logonInformation.get(cnt).getType();
            }
            session.put("src", src);
            session.put("type", type);
            session.put("userName", userName);
            session.put("name", name);
            session.put("userId", userCode);
            session.put("role", role);
            return SUCCESS;
        }

    }
    public String logout() throws Exception{
        session.remove("src");
        session.remove("type");
        session.remove("userName");
        session.remove("userId");
        session.remove("role");
        session.remove("name");
        return SUCCESS;
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

    public List<login_Bean> getLogonInformation() {
        return logonInformation;
    }

    public void setLogonInformation(List<login_Bean> logonInformation) {
        this.logonInformation = logonInformation;
    }

    public login_Bean getLoginBean() {
        return loginBean;
    }

    public void setLoginBean(login_Bean loginBean) {
        this.loginBean = loginBean;
    }

    public String getOperationtype() {
        return operationtype;
    }

    public void setOperationtype(String operationtype) {
        this.operationtype = operationtype;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getOperationdetails() {
        return operationdetails;
    }

    public void setOperationdetails(String operationdetails) {
        this.operationdetails = operationdetails;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session; //To change body of generated methods, choose Tools | Templates.
    }
}